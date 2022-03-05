import 'dart:async';

import 'package:games/game_base/client/client_state.dart';
import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/server/sessions/single_session/single_local_session_handler.dart';

class GameClientLocal<
        PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable,
        G extends Game<PlayerGameEvent, ServerGameEvent>>
    extends GameClient<PlayerGameEvent, ServerGameEvent, G> {

  late final StreamController<ServerGameEvent> _serverEventController;    
  late final SingleLocalSessionHandler<PlayerGameEvent, ServerGameEvent> _sessionHandler;

  GameClientLocal(G Function(Map<String, dynamic> gameConfig) _gameFactory) : super(_gameFactory) {
    _serverEventController = StreamController<ServerGameEvent>.broadcast();
    _sessionHandler = SingleLocalSessionHandler(this);
    state = ClientState.lobby;
  }

  onServerEvent(ServerGameEvent event) {
    _serverEventController.sink.add(event);
  }

  @override
  close() {
    state = ClientState.disconnected;
    notifyListeners();
    _serverEventController.close();
  }
  
  @override
  Stream<ServerGameEvent> get eventStream => _serverEventController.stream;

  @override
  void send(PlayerGameEvent event) {
    _sessionHandler.onPlayerEvent(event);
  }

  SingleLocalSessionHandler<PlayerGameEvent, ServerGameEvent> get sessionHandler => _sessionHandler;

  @override
  String get selfId => '0';
}
