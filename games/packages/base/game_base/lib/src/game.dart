import 'package:game_base/src/helper/serializable.dart';
import 'package:game_base/src/server/sessions/single_session_handler.dart';
import 'package:meta/meta.dart';

/// Abstract representation of a game.
abstract class Game<PlayerGameEvent extends Serializable, ServerGameEvent extends Serializable> {
  /// Name of the Game. It is recommended to create an additional static method exposing it.
  abstract final String name;

  /// List of currently connected sessions. Do not modify
  List<SingleSessionHandler<PlayerGameEvent, ServerGameEvent>> players = [];

  /// Event handler called when [player] joined the game.
  @mustCallSuper
  void onPlayerJoined(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player) {
    players.add(player);
  }

  /// Event handler called when [player] left the game.
  @mustCallSuper
  void onPlayerLeft(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player) {
    players.remove(player);
  }

  // /// Will only be called as a reaction to an admin [PlayerSession]. 
  // void start();

  /// Whether the game allows more players to join.
  bool allowsMorePlayers();

  /// Event handler called when [player] sends an [event].
  void onPlayerGameEvent(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player, PlayerGameEvent event);

  // After calling this method, no more events can be send to the players
  void close();

  /// Game config send to server.
  Map<String, dynamic> get configAsJson;
}