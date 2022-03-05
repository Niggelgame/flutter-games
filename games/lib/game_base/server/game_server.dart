import 'package:flutter/widgets.dart';
import 'package:games/config/app_config.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/server/player.dart';
import 'package:games/game_base/server/sessions/session_handler.dart';

class GameServer<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable,
    G extends Game<PlayerGameEvent, ServerGameEvent>> extends ChangeNotifier {
  List<Player> players = [];

  final G game;
  final AppConfig _config;
  late final SessionHandler<PlayerGameEvent, ServerGameEvent, G> sessionHandler;

  String? gameCode;

  GameServer(this.game, this._config) {
    _init();
  }

  _init() {
    sessionHandler = SessionHandler<PlayerGameEvent, ServerGameEvent, G>(this, _config);
    sessionHandler.init(
      onSessionCode: (val) {
        print('Received game code $val');
        gameCode = val;
        notifyListeners();
      },
    );
  }

  onJoin(Player<PlayerGameEvent, ServerGameEvent, G> p) {
    if (game.allowsMorePlayers()) {
      players.add(p);
      game.onPlayerJoined(p);
    } else {
      sessionHandler.kickPlayer(p, "Game is full");
    }
  }

  onLeave(Player p) {
    players.remove(p);
    game.onPlayerLeft(p);
  }

  close() {
    game.close();
    sessionHandler.close();
  }

  PlayerGameEvent playerGameEventFromJson(Map<String, dynamic> json) {
    return game.playerGameEventFromJson(json);
  }

  ServerGameEvent serverGameEventFromJson(Map<String, dynamic> json) {
    return game.serverGameEventFromJson(json);
  }
}
