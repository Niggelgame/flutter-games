import 'dart:async';

import 'package:games/game_base/client/sessions/game_client_local.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/server/sessions/single_session/single_session_handler.dart';

class SingleLocalSessionHandler<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends SingleSessionHandler<PlayerGameEvent, ServerGameEvent> {
  late final StreamController<PlayerGameEvent> _playerEventStreamController;
  final GameClientLocal _localClient;

  SingleLocalSessionHandler(this._localClient) {
    _playerEventStreamController =
        StreamController<PlayerGameEvent>.broadcast();
  }

  onPlayerEvent(PlayerGameEvent event) {
    _playerEventStreamController.add(event);
  }

  @override
  closeSession({String? reason}) {
    _localClient.close();
  }

  @override
  dispose() {}

  @override
  Stream<PlayerGameEvent> get playerGameEventStream =>
      _playerEventStreamController.stream;

  @override
  Future<void> send(ServerGameEvent event) async {
    _localClient.onServerEvent(event);
  }

  /// sessionId is hardcoded for local client, as for now we have one at max
  @override
  String get sessionId => "0";
}
