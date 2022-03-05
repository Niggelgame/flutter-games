package websocket

import (
	"encoding/json"
	"errors"
	"github.com/niggelgame/web-games-server/pkg/packets"
	"net"
	"sync"
	"time"

	"github.com/chuckpreslar/emission"
	"github.com/gorilla/websocket"
	"github.com/niggelgame/web-games-server/pkg/logger"
)

const pingPeriod = 15 * time.Second

type emptyKeepalive struct {
}

// WebSocketConn wraps websocket.Conn with mutex
type WebSocketConn struct {
	emission.Emitter
	socket *websocket.Conn
	mutex  *sync.Mutex
	closed bool
}

func NewWebSocketConn(socket *websocket.Conn) *WebSocketConn {
	var conn WebSocketConn
	conn.Emitter = *emission.NewEmitter()
	conn.socket = socket
	conn.mutex = new(sync.Mutex)
	conn.closed = false
	conn.socket.SetCloseHandler(func(code int, text string) error {
		logger.Warnf("%s [%d]", text, code)
		conn.Emit("close", code, text)
		conn.closed = true
		return nil
	})
	return &conn
}

func (conn *WebSocketConn) ReadMessage() {
	in := make(chan []byte)
	stop := make(chan struct{})
	pingTicker := time.NewTicker(pingPeriod)

	var c = conn.socket
	go func() {
		for {
			_, message, err := c.ReadMessage()
			if err != nil {
				logger.Warnf("Got error: %v", err)
				if c, k := err.(*websocket.CloseError); k {
					conn.Emit("close", c.Code, c.Text)
				} else {
					if c, k := err.(*net.OpError); k {
						conn.Emit("close", 1008, c.Error())
					}
				}
				close(stop)
				break
			}
			in <- message
		}
	}()

	for {
		select {
		case _ = <-pingTicker.C:
			logger.Infof("Send keepalive !!!")
			if err := conn.SendI(packets.ResponsePacket{Type: packets.ServerKeepalive, Data: emptyKeepalive{}}); err != nil {
				logger.Errorf("Keepalive has failed")
				pingTicker.Stop()
				return
			}
		case message := <-in:
			{
				logger.Infof("Received data: %s", message)
				conn.Emit("message", []byte(message))
			}
		case <-stop:
			return
		}
	}
}

func (conn *WebSocketConn) SendI(m interface{}) error {
	data, err := json.Marshal(m)
	if err != nil {
		logger.Errorf(err.Error())
		return err
	}
	return conn.Send(string(data))
}

/*
* Send |message| to the connection.
 */
func (conn *WebSocketConn) Send(message string) error {
	logger.Infof("Send data: %s", message)
	conn.mutex.Lock()
	defer conn.mutex.Unlock()
	if conn.closed {
		return errors.New("websocket: write closed")
	}
	return conn.socket.WriteMessage(websocket.TextMessage, []byte(message))
}

/*
* Close conn.
 */
func (conn *WebSocketConn) Close() {
	conn.mutex.Lock()
	defer conn.mutex.Unlock()
	if conn.closed == false {
		logger.Infof("Close ws conn now : ", conn)
		conn.socket.Close()
		conn.closed = true
	} else {
		logger.Warnf("Transport already closed :", conn)
	}
}
