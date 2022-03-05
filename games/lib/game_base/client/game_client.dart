import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:games/game_base/client/client_state.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/helper/serializable.dart';

abstract class GameClient<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable,
    G extends Game<PlayerGameEvent, ServerGameEvent>> extends ChangeNotifier {
  final G Function(Map<String,dynamic>) gameFactory;

  ClientState state = ClientState.disconnected;

  GameClient(this.gameFactory);

  Stream<ServerGameEvent> get eventStream;

  void send(PlayerGameEvent event);

  void close();

  String get selfId;
}
