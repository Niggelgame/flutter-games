package websocket

import (
	"github.com/gorilla/websocket"
	"github.com/niggelgame/web-games-server/pkg/logger"
	"net/http"
)

type ServerConfig struct {
	Host           string
	WebSocketPath  string
	TurnServerPath string
	CheckCodePath  string
}

func DefaultConfig() ServerConfig {
	return ServerConfig{
		Host:           ":8086",
		WebSocketPath:  "/ws",
		TurnServerPath: "/api/turn",
		CheckCodePath: "/api/check",
	}
}

type Server struct {
	handleWebSocket  func(ws *WebSocketConn, request *http.Request)
	handleTurnServer func(writer http.ResponseWriter, request *http.Request)
	handleCodeChecker func(writer http.ResponseWriter, request *http.Request)
	// Websocket upgrader
	upgrader websocket.Upgrader
}

func NewWebSocketServer(
	wsHandler func(ws *WebSocketConn, request *http.Request),
	turnServerHandler func(writer http.ResponseWriter, request *http.Request),
	handleCodeChecker func(writer http.ResponseWriter, request *http.Request)) *Server {
	var server = &Server{
		handleWebSocket:  wsHandler,
		handleTurnServer: turnServerHandler,
		handleCodeChecker: handleCodeChecker,
	}
	server.upgrader = websocket.Upgrader{
		CheckOrigin: func(r *http.Request) bool {
			return true
		},
	}
	return server
}

func (server *Server) handleWebSocketRequest(writer http.ResponseWriter, request *http.Request) {
	responseHeader := http.Header{}
	//responseHeader.Add("Sec-WebSocket-Protocol", "protoo")
	socket, err := server.upgrader.Upgrade(writer, request, responseHeader)
	if err != nil {
		logger.Panicf("%v", err)
	}
	wsTransport := NewWebSocketConn(socket)
	server.handleWebSocket(wsTransport, request)
	wsTransport.ReadMessage()
}

func (server *Server) handleTurnServerRequest(writer http.ResponseWriter, request *http.Request) {
	server.handleTurnServer(writer, request)
}

// Bind .
func (server *Server) Bind(cfg ServerConfig) {
	// Websocket handle func
	http.HandleFunc(cfg.WebSocketPath, server.handleWebSocketRequest)
	http.HandleFunc(cfg.TurnServerPath, server.handleTurnServerRequest)
	http.HandleFunc(cfg.CheckCodePath, server.handleCodeChecker)
	logger.Infof("Server listening on: %s", cfg.Host)
	panic(http.ListenAndServe(cfg.Host, nil))
	// TLS only - not needed behind reverse proxy
	// panic(http.ListenAndServeTLS(cfg.Host, cfg.CertFile, cfg.KeyFile, nil))
}
