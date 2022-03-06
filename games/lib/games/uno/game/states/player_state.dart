import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games/games/uno/game/states/games_state.dart';
import 'package:games/games/uno/models/uno_card.dart';

import 'package:flutter/foundation.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
class PlayerState with _$PlayerState {
  factory PlayerState(
    SimpleGameState gameState,
    String playersTurnId,
    String name,
    List<UnoCard> hand,
    List<OtherPlayerState> otherPlayers,
    UnoCard? lastPlayedCard,
    String? playerRequestingColor,
    UnoCardColor currentColor,
    Direction currentDirection,
    bool allowSkip,
  ) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);
}

@freezed
class OtherPlayerState with _$OtherPlayerState {
  factory OtherPlayerState(String playerId, String name, int handLength) = _OtherPlayerState;

  factory OtherPlayerState.fromJson(Map<String, dynamic> json) =>
      _$OtherPlayerStateFromJson(json);
}

