import 'package:games/game_base/helper/serializable.dart';

abstract class SingleSessionHandler<PlayerGameEvent extends Serializable, ServerGameEvent extends Serializable> {
  Stream<PlayerGameEvent> get playerGameEventStream;

  Future<void> send(ServerGameEvent event);

  closeSession({String? reason});

  dispose();

  String get sessionId;
}