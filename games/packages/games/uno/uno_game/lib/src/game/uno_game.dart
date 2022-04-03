import 'dart:math';

import 'package:game_base/game_base.dart';
import 'package:uno/uno.dart' as uno;
import 'package:uno_game/src/game/player_event.dart';
import 'package:uno_game/src/game/server_event.dart';


class UnoGame extends Game<UnoPlayerEvent, UnoServerEvent>
    with
        Startable<UnoPlayerEvent, UnoServerEvent, UnoPlayerStartEvent>,
        Rematchable<UnoPlayerEvent, UnoServerEvent, UnoPlayerVoteRematchEvent>,
        AvaitableEvent<UnoPlayerEvent, UnoServerEvent> {
  final uno.GameConfig config;

  uno.Game? _game;

  UnoGame({required this.config});
  

  @override
  bool allowsMorePlayers() => players.length < config.maxPlayerCount;

  @override
  void close() {}

  @override
  // TODO: implement configAsJson
  Map<String, dynamic> get configAsJson => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  void onRematch() {
    // TODO: implement onRematch
  }

  @override
  void onStart(SingleSessionHandler<UnoPlayerEvent, UnoServerEvent> player) {
    // TODO: implement onStart
  }
}
