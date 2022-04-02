import 'dart:async';

import 'package:game_base/game_base.dart';
import 'package:local_sessions/src/client/game_client_local.dart';

class SingleLocalSessionHandler<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends SingleSessionHandler<PlayerGameEvent, ServerGameEvent> {
  late final StreamController<PlayerGameEvent> _playerEventStreamController;
  final GameClientLocal _localClient;

  SingleLocalSessionHandler(this._localClient,
      {required this.isAdmin, required this.name}) {
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
  Stream<PlayerGameEvent> get playerGameEventStream =>
      _playerEventStreamController.stream;

  @override
  Future<void> send(ServerGameEvent event) async {
    _localClient.onServerEvent(event);
  }

  /// sessionId is hardcoded for local client, as for now we have one at max
  @override
  String get sessionId => "0";

  @override
  final bool isAdmin;

  @override
  final String name;
}
