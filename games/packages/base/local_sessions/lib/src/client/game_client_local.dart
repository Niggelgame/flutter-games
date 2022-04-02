import 'dart:async';

import 'package:game_base/game_base.dart';
import 'package:local_sessions/src/server/single_local_session_handler.dart';

class GameClientLocal<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends GameClient<PlayerGameEvent, ServerGameEvent> {
  late final StreamController<ServerGameEvent> _serverEventController;
  late final SingleLocalSessionHandler<PlayerGameEvent, ServerGameEvent>
      _sessionHandler;

  bool _connected = true;
  late final StreamController<bool> _connectionStatusController;

  GameClientLocal({String? name, bool isAdmin = false}) {
    _serverEventController = StreamController<ServerGameEvent>.broadcast();
    _connectionStatusController = StreamController<bool>.broadcast();
    _sessionHandler = SingleLocalSessionHandler(
      this,
      name: name ?? NameGenerator.generate(),
      isAdmin: isAdmin,
    );
  }

  onServerEvent(ServerGameEvent event) {
    _serverEventController.sink.add(event);
  }

  @override
  close() {
    _serverEventController.close();
    _connected = false;
    _connectionStatusController.add(false);
    _connectionStatusController.close();
  }

  @override
  Stream<ServerGameEvent> get eventStream => _serverEventController.stream;

  @override
  void send(PlayerGameEvent event) {
    _sessionHandler.onPlayerEvent(event);
  }

  SingleLocalSessionHandler<PlayerGameEvent, ServerGameEvent>
      get sessionHandler => _sessionHandler;

  @override
  String get selfId => '0';

  @override
  bool get connected => _connected;

  @override
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;
}
