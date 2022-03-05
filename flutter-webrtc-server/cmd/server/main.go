package main

import (
	"github.com/niggelgame/web-games-server/pkg/config"
	"github.com/niggelgame/web-games-server/pkg/signaler"
	"github.com/niggelgame/web-games-server/pkg/turn"
	"github.com/niggelgame/web-games-server/pkg/websocket"
)

func main() {
	cfg := config.LoadConfig()

	turnConfig := turn.DefaultConfig()
	turnConfig.PublicIP = cfg.PublicIp
	turnConfig.Port = cfg.StunPort
	turnConfig.Realm = cfg.Realm
	turnServer := turn.NewTurnServer(turnConfig)

	signalerHandler := signaler.NewSignaler(turnServer)
	wsServer := websocket.NewWebSocketServer(signalerHandler.HandleNewWebSocket, signalerHandler.HandleTurnServerCredentials, signalerHandler.HandleSessionCheck)

	serverConfig := websocket.DefaultConfig()
	serverConfig.Host = cfg.BindAddress

	wsServer.Bind(serverConfig)
}
