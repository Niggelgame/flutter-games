import 'package:game_base/src/helper/serializable.dart';
import 'package:game_base/src/server/sessions/single_session_handler.dart';

/// Abstract represenation of a session handler. Should be implemented for every 
/// networking protocols.
abstract class SessionHandler<PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable> {
  /// Initialize the session handler. This should be called before passing it
  /// into a [GameServer]. 
  /// This will setup, if needed, discovery services and listeners for new connections.
  Future<void> init({required Function(String) onSessionCode});

  /// Remove a [player] from the session ppol. This should stop all network 
  /// communication after sending the [reason].
  void kickPlayer(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player,
      {String? reason});

  /// Insert [sessionHandler] into the session pool. This will be called when a
  /// player joins the game via discovery.
  /// It can be manually called to insert a player session artificially created
  /// into the pool. Can be used for local sessions.
  void insertSession(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> sessionHandler);

  /// Close the session handler.
  /// This should close all sessions and stop all network communication.
  void close();

  /// Last received game code
  String? get lastGameCode;
}
