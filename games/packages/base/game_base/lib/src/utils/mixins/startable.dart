import 'package:game_base/src/game.dart';
import 'package:game_base/src/helper/serializable.dart';
import 'package:game_base/src/server/sessions/single_session_handler.dart';
import 'package:meta/meta.dart';

/// Mixin to handle a start event of type [T] and then call [onStart]
mixin Startable<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable,
    T extends PlayerGameEvent> on Game<PlayerGameEvent, ServerGameEvent> {
  /// Handle start of the game
  @mustCallSuper
  void onPlayerGameEvent(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player,
      PlayerGameEvent event) {
    if (event is T) {
      onStart(player);
    }
    super.onPlayerGameEvent(player, event);
  }

  /// Handle start of the game
  void onStart(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player);
}
