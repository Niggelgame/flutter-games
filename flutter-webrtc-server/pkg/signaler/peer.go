package signaler

import (
	"github.com/niggelgame/web-games-server/pkg/packets"
	"github.com/niggelgame/web-games-server/pkg/util"
	"github.com/niggelgame/web-games-server/pkg/websocket"
)

type Peer interface {
	GetId() string
	GetConn() *websocket.WebSocketConn
	Close()
}

type ClientPeer struct {
	serverPeer *ServerPeer
	id         string
	conn       *websocket.WebSocketConn
}

func (c *ClientPeer) GetId() string {
	return c.id
}

func (c *ClientPeer) GetConn() *websocket.WebSocketConn {
	return c.conn
}

func (c *ClientPeer) Close() {
	c.conn.Close()
}

type ServerPeer struct {
	sessions map[string]*ClientPeer
	id       string
	conn     *websocket.WebSocketConn
	game     string
	config   map[string]interface{}
}

func (s *ServerPeer) GetId() string {
	return s.id
}

func (s *ServerPeer) GetConn() *websocket.WebSocketConn {
	return s.conn
}

func (s *ServerPeer) Init() string {
	sessionCode := util.RandomBigAlphaString(5)
	_ = s.conn.SendI(packets.ResponsePacket{Type: packets.Init, Data: packets.InitPacket{SessionCode: sessionCode}})
	return sessionCode
}

func (s *ServerPeer) AddClientPeer(c *ClientPeer) {
	s.sessions[c.id] = c
	_ = s.conn.SendI(packets.ResponsePacket{Type: packets.Invite, Data: packets.InvitePacket{PeerId: c.id}})
}

func (s *ServerPeer) Close() {
	for _, clientPeer := range s.sessions {
		clientPeer.Close()
	}
	s.conn.Close()
}
