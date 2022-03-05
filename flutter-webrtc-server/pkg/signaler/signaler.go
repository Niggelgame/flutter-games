package signaler

import (
	"crypto/hmac"
	"crypto/sha1"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"github.com/niggelgame/web-games-server/pkg/packets"
	"net"
	"net/http"
	"net/url"
	"time"

	"github.com/niggelgame/web-games-server/pkg/logger"
	"github.com/niggelgame/web-games-server/pkg/turn"
	"github.com/niggelgame/web-games-server/pkg/util"
	"github.com/niggelgame/web-games-server/pkg/websocket"
)

const (
	// TODO: Get shared key from env
	sharedKey = `shared-key-from-env-TODO`
)

type TurnCredentials struct {
	Username string   `json:"username"`
	Password string   `json:"password"`
	TTL      int      `json:"ttl"`
	Uris     []string `json:"uris"`
}

type SessionData struct {
	Token      string                 `json:"token"`
	Game       string                 `json:"game"`
	GameConfig map[string]interface{} `json:"game_config"`
}

type Error struct {
	Request string `json:"request"`
	Reason  string `json:"reason"`
}

type Signaler struct {
	peers          map[string]Peer
	serverSessions map[string]*ServerPeer
	turn           *turn.TurnServer
	turnAuthData   *util.ExpiredMap
	// map[string]string
	sessionTokens *util.ExpiredMap
}

func NewSignaler(turn *turn.TurnServer) *Signaler {
	var signaler = &Signaler{
		peers:          make(map[string]Peer),
		serverSessions: make(map[string]*ServerPeer),
		turn:           turn,
		turnAuthData:   util.NewExpiredMap(),
		sessionTokens:  util.NewExpiredMap(),
	}
	signaler.turn.AuthHandler = signaler.authHandler
	return signaler
}

func (s Signaler) authHandler(username string, realm string, srcAddr net.Addr) (string, bool) {
	// handle turn credential.
	if found, info := s.turnAuthData.Get(username); found {
		credential := info.(TurnCredentials)
		return credential.Password, true
	}
	return "", false
}

// HandleTurnServerCredentials .
// https://tools.ietf.org/html/draft-uberti-behave-turn-rest-00
func (s *Signaler) HandleTurnServerCredentials(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")

	params, err := url.ParseQuery(request.URL.RawQuery)
	if err != nil {
		_ = json.NewEncoder(writer).Encode(Error{Request: "HandleTurnServerCredentials", Reason: packets.InvalidParams})
		return
	}
	logger.Debugf("%v", params)
	service := params["service"][0]
	if service != "turn" {
		return
	}
	username := params["username"][0]
	timestamp := time.Now().Unix()
	turnUsername := fmt.Sprintf("%d:%s", timestamp, username)
	hmac := hmac.New(sha1.New, []byte(sharedKey))
	hmac.Write([]byte(turnUsername))
	turnPassword := base64.RawStdEncoding.EncodeToString(hmac.Sum(nil))
	ttl := 86400
	host := fmt.Sprintf("%s:%d", s.turn.Config.PublicIP, s.turn.Config.Port)
	credential := TurnCredentials{
		Username: turnUsername,
		Password: turnPassword,
		TTL:      ttl,
		Uris: []string{
			"turn:" + host + "?transport=udp",
		},
	}
	s.turnAuthData.Set(turnUsername, credential, int64(ttl))
	_ = json.NewEncoder(writer).Encode(credential)
}

func (s *Signaler) HandleSessionCheck(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")

	params, err := url.ParseQuery(request.URL.RawQuery)
	if err != nil {
		_ = json.NewEncoder(writer).Encode(Error{Request: "HandleSessionCheck", Reason: packets.InvalidParams})
	}

	sessionCode := params["code"][0]

	serverPeer, valid := s.serverSessions[sessionCode]
	if !valid {
		_ = json.NewEncoder(writer).Encode(Error{Request: "HandleSessionCheck", Reason: packets.InvalidSession})
		return
	}

	token := util.RandomBase64String(40)
	s.sessionTokens.Set(token, serverPeer.id, 300)

	sessionData := SessionData{
		Token:      token,
		Game:       serverPeer.game,
		GameConfig: serverPeer.config,
	}
	val, _ := json.Marshal(sessionData)
	logger.Infof("Send %v", string(val))
	_ = json.NewEncoder(writer).Encode(sessionData)

}

func (s *Signaler) HandleNewWebSocket(conn *websocket.WebSocketConn, request *http.Request) {
	logger.Infof("On Open %v", request)

	var thisPeer Peer
	conn.On("message", func(message []byte) {
		logger.Infof("On message %v", string(message))
		var body json.RawMessage
		request := packets.RequestPacket{
			Data: &body,
		}
		err := json.Unmarshal(message, &request)
		if err != nil {
			logger.Errorf("Unmarshal error %v", err)
			return
		}

		var data map[string]interface{}
		err = json.Unmarshal(body, &data)
		if err != nil {
			logger.Errorf("Unmarshal error %v", err)
			return
		}

		switch request.Type {
		case packets.Hello:
			var hello packets.HelloPacket
			err := json.Unmarshal(body, &hello)
			if err != nil {
				logger.Errorf("Unmarshal hello error %v", err)
				break
			}
			if _, ok := s.peers[hello.Id]; ok {
				_ = conn.SendI(packets.ResponsePacket{Type: packets.Error, Data: Error{Request: "Hello", Reason: packets.IdAlreadyExists}})
				conn.Close()
				break
			}

			if hello.IsServer {
				p := &ServerPeer{
					id:       hello.Id,
					conn:     conn,
					sessions: make(map[string]*ClientPeer),
					config:   hello.GameConfig,
					game:     hello.Type,
				}

				sessionCode := p.Init()

				s.serverSessions[sessionCode] = p
				s.peers[hello.Id] = p
				thisPeer = p
			} else {
				found, peerData := s.sessionTokens.Get(hello.Type)
				if !found {
					_ = conn.SendI(packets.ResponsePacket{Type: packets.Error, Data: Error{Request: "Hello", Reason: packets.InvalidSession}})
					conn.Close()
					break
				}
				// Remove token, as it was used now
				s.sessionTokens.Remove(hello.Type)
				serverPeerSessionId := peerData.(string)
				p, ok := s.peers[serverPeerSessionId]
				if !ok {
					_ = conn.SendI(packets.ResponsePacket{Type: packets.Error, Data: Error{Request: "Hello", Reason: packets.OutdatedSession}})
					conn.Close()
					break
				}
				serverPeer, ok := p.(*ServerPeer)
				if !ok {
					_ = conn.SendI(packets.ResponsePacket{Type: packets.Error, Data: Error{Request: "Hello", Reason: packets.OutdatedSession}})
					conn.Close()
					break
				}
				clientPeer := &ClientPeer{
					serverPeer: serverPeer,
					conn:       conn,
					id:         hello.Id,
				}
				serverPeer.AddClientPeer(clientPeer)
				s.peers[clientPeer.id] = clientPeer
				thisPeer = clientPeer
			}
			break
		case packets.Offer:
			fallthrough
		case packets.Answer:
			fallthrough
		case packets.Candidate:
			{
				var passthrough packets.PassThroughPacket
				err := json.Unmarshal(body, &passthrough)
				if err != nil {
					logger.Errorf("Unmarshal "+string(request.Type)+" got error %v", err)
					break
				}
				to := passthrough.To
				peer, ok := s.peers[to]
				if !ok {
					msg := packets.RequestPacket{
						Type: "error",
						Data: Error{
							Request: string(request.Type),
							Reason:  "Peer [" + to + "] not found ",
						},
					}
					_ = conn.SendI(msg)
					break
				}
				// Set `from` property to correct id
				passthrough.From = thisPeer.GetId()
				// Send modified packet as ResponsePacket with same type as receiving type
				_ = peer.GetConn().SendI(packets.ResponsePacket{Type: packets.ResponseMethod(packets.MethodAsString(request.Type)), Data: passthrough})
			}
			break
		case packets.Bye:
			var bye packets.ByebyePacket
			err := json.Unmarshal(body, &bye)
			if err != nil {
				logger.Errorf("Unmarshal bye got error %v", err)
				return
			}

			if thisPeer == nil {
				logger.Warnf("Connection bye without initialized Peer")
				break
			}

			sendBye := func(peer Peer) {
				bye := packets.ResponsePacket{
					Type: packets.ServerBye,
					Data: packets.ByebyePacket{
						Reason:     "bye",
						PeerLeftId: thisPeer.GetId(),
					},
				}
				_ = peer.GetConn().SendI(bye)
			}

			if serverPeer, ok := thisPeer.(*ServerPeer); ok {
				for _, peer := range serverPeer.sessions {
					sendBye(peer)
				}
				sendBye(serverPeer)
			} else if clientPeer, ok := thisPeer.(*ClientPeer); ok {
				sendBye(clientPeer.serverPeer)
			}

			break

		case packets.Keepalive:
			_ = conn.SendI(request)
			break
		default:
			logger.Warnf("Unkown request %v", request)
			break
		}
	})

	conn.On("close", func(code int, text string) {
		logger.Infof("On Close %v", conn)

		logger.Infof("Remove peer %v", thisPeer)
		if thisPeer == nil {
			logger.Infof("Leave peer id not found")
			return
		}

		if serverPeer, ok := thisPeer.(*ServerPeer); ok {
			serverPeer.Close()
			for _, clientPeer := range serverPeer.sessions {
				delete(s.peers, clientPeer.id)
			}
		} else if clientPeer, ok := thisPeer.(*ClientPeer); ok {
			clientPeer.Close()
			_ = clientPeer.serverPeer.conn.SendI(
				packets.ResponsePacket{Type: packets.ServerBye, Data: packets.ByebyePacket{Reason: packets.ClosingSession, PeerLeftId: clientPeer.id}},
			)
		}
		delete(s.peers, thisPeer.GetId())
	})
}
