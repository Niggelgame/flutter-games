import 'package:game_base/src/game.dart';
import 'package:game_base/src/helper/serializable.dart';
import 'package:game_base/src/server/sessions/single_session_handler.dart';
import 'package:meta/meta.dart';

/// Mixin to handle a rematch voting of type [T] and then call [onRematch]
mixin Rematchable<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable,
    T extends PlayerGameEvent> on Game<PlayerGameEvent, ServerGameEvent> {
  final List<String> _rematchVotes = [];

  /// Automatically handle rematch voting
  @mustCallSuper
  void onPlayerGameEvent(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player,
      PlayerGameEvent event) {
    if (event is T) {
      if (!_rematchVotes.contains(player.sessionId)) {
        _rematchVotes.add(player.sessionId);
        if (_rematchVotes.length == players.length) {
          onRematch();
        }
      }
    }
    super.onPlayerGameEvent(player, event);
  }

  /// Handle rematch. You should always check, whether the game is still running.
  void onRematch();
}
