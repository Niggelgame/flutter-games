import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/models/uno_card.dart';

part 'games_state.freezed.dart';

@freezed
class GamePlayerState with _$GamePlayerState {
  factory GamePlayerState(List<UnoCard> hand, String name) = _GamePlayerState;
}

enum SimpleGameState {
  initial,
  awaitingPlay,
  running,
  awaitingColorSelection,
  finished,
}

enum Direction {
  clockwise,
  counterclockwise,
}

@freezed
class GameState with _$GameState {
  const GameState._();
  factory GameState(
      SimpleGameState state,
      Map<String, GamePlayerState> players,
      String currentPlayer,
      List<UnoCard> stack,
      List<UnoCard> cardsPutDown,
      String playerRequestingColor,
      Direction currentDirection,
      UnoCardColor currentColor,
      bool currentPlayerFlaggedForUno,
      bool currentPlayerDrewCard,
      int cardsInAddDraw) = _GameState;
}

extension GameStateX on GameState {
  PlayerState asPlayerState(String playerId) {
    final player = players[playerId]!;
    final otherPlayers = players
        .map((key, value) =>
            MapEntry(key, OtherPlayerState(key, value.name, value.hand.length)))
        .values
        .where((value) => value.playerId != playerId)
        .toList();
    return PlayerState(
        state,
        currentPlayer,
        player.name,
        player.hand,
        otherPlayers,
        cardsPutDown.lastOrNull,
        playerRequestingColor,
        currentColor,
        currentDirection,
        currentPlayer == playerId && (cardsInAddDraw > 0 || currentPlayerDrewCard));
  }
}
