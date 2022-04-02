import 'package:game_base/src/helper/serializable.dart';
import 'package:meta/meta.dart';

/// Abstract representation of a single session connection. 
/// This is the direct connection between a client and therefore has the mirrored
/// structure of a [GameClient].
abstract class SingleSessionHandler<PlayerGameEvent extends Serializable, ServerGameEvent extends Serializable> {
  /// Stream of events from the client.
  Stream<PlayerGameEvent> get playerGameEventStream;

  /// Send [event] to the client.
  Future<void> send(ServerGameEvent event);

  /// Close the session and therefore disconnect the client.
  closeSession({String? reason});

  /// Dispose the session. This should always call [closeSession].
  @mustCallSuper
  dispose() {
    closeSession(reason: 'dispose');
  }

  /// The session id of the client.
  String get sessionId;

  /// The user-set name of the client.
  String get name;

  /// Whether the user is an admin. 
  /// The implications are dependent on the [Game] implementation used.
  bool get isAdmin;
}