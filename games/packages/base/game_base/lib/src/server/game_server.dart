import 'dart:async';

import 'package:game_base/src/game.dart';
import 'package:game_base/src/helper/serializable.dart';
import 'package:game_base/src/server/sessions/session_handler.dart';
import 'package:game_base/src/server/sessions/single_session_handler.dart';
import 'package:meta/meta.dart';

/// Bridge between a [Game] and a [SessionHandler]. This needs no further
/// initialization.
/// 
/// Can be used with all types of games.
class GameServer<PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable> {
  final Game<PlayerGameEvent, ServerGameEvent> game;
  late final SessionHandler<PlayerGameEvent, ServerGameEvent> sessionHandler;

  Map<SingleSessionHandler<PlayerGameEvent, ServerGameEvent>,
      StreamSubscription<PlayerGameEvent>> _playerGameEventSubscriptions = {};

  GameServer(this.game, SessionHandler<PlayerGameEvent, ServerGameEvent> Function(GameServer<PlayerGameEvent, ServerGameEvent>)  onSessionCreation) {
    sessionHandler = onSessionCreation(this);
  }

  @internal
  void onJoin(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> p) {
    if (game.allowsMorePlayers()) {
      game.onPlayerJoined(p);

      // Setup listeners
      _playerGameEventSubscriptions[p] =
          p.playerGameEventStream.listen((event) {
        game.onPlayerGameEvent(p, event);
      });
    } else {
      sessionHandler.kickPlayer(p, reason: "Game is full");
    }
  }

  @internal
  void onLeave(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> p) {
    game.onPlayerLeft(p);
    _playerGameEventSubscriptions.remove(p)?.cancel();
  }

  void close() {
    game.close();
    _playerGameEventSubscriptions.forEach((key, value) {
      value.cancel();
    });
    sessionHandler.close();
  }
}
