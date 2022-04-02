import 'dart:async';

import 'package:game_base/src/helper/serializable.dart';

/// Abstract representation of a game client. This is the base interaction point
/// for every game participant.
abstract class GameClient<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable> {
  /// Whether the client currently has a connection to a game server.
  bool get connected;

  /// Stream of connection status
  Stream<bool> get connectionStatusStream;

  /// The event stream from the server.
  Stream<ServerGameEvent> get eventStream;

  /// This sends a [PlayerGameEvent] to the server.
  void send(PlayerGameEvent event);

  /// Closes the connection to the server.
  void close();

  /// The server-id of the client.
  String get selfId;
}
