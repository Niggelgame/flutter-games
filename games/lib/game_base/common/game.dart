import 'package:flutter/widgets.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/server/player.dart';

abstract class Game<PlayerGameEvent extends Serializable, ServerGameEvent extends Serializable> {
  abstract final String name;

  List<Player> players = [];

  PlayerGameEvent playerGameEventFromJson(Map<String, dynamic> json);
  ServerGameEvent serverGameEventFromJson(Map<String, dynamic> json);

  @mustCallSuper
  void onPlayerJoined(Player player) {
    players.add(player);
  }

  @mustCallSuper
  void onPlayerLeft(Player player) {
    players.remove(player);
  }

  bool allowsMorePlayers();

  void onPlayerGameEvent(Player<PlayerGameEvent, ServerGameEvent, Game<PlayerGameEvent, ServerGameEvent>> player, PlayerGameEvent event);

  // You won't be able to send any events to the players anymore when this method is called
  void close();

  Map<String, dynamic> get config;
}