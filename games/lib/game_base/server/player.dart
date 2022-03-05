import 'package:flutter/widgets.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/game_base/server/sessions/single_session/single_session_handler.dart';

class Player<PlayerGameEvent extends Serializable, ServerGameEvent extends Serializable, G extends Game<PlayerGameEvent, ServerGameEvent>> {
  final SingleSessionHandler<PlayerGameEvent, ServerGameEvent> _session;
  final GameServer<PlayerGameEvent, ServerGameEvent, G> server;
  late final String id;
  final bool isAdmin;

  @mustCallSuper
  Player(this._session, this.server, this.isAdmin) {
    id = _session.sessionId;
    _session.playerGameEventStream.listen((event) {
      server.game.onPlayerGameEvent(this, event);
    });
  }

  @mustCallSuper
  send(ServerGameEvent event) {
    _session.send(event);
  }
}