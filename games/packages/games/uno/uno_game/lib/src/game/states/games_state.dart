import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:game_base/game_base.dart';
import 'package:uno_game/src/game/states/player_state.dart';
import 'package:uno_game/src/models/uno_card.dart';

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
  PlayerState asPlayerState(String playerId, List<SingleSessionHandler> playerList) {
    final currentPlayerIndex = playerList.indexWhere((p) => p.sessionId == playerId);

    final player = players[playerId]!;
    final otherPlayers = players
        .map((key, value) =>
            MapEntry(key, OtherPlayerState(key, value.name, value.hand.length)))
        .values
        .where((value) => value.playerId != playerId)
        .toList();

    // Sort in such way, that the first player in the `otherPlayers` list is the one to the left of the current player
    otherPlayers.sort((a, b) {
      var aIndex = playerList.indexWhere((p) => p.sessionId == a.playerId);
      if (aIndex < currentPlayerIndex) aIndex = aIndex + playerList.length;
      var bIndex = playerList.indexWhere((p) => p.sessionId == b.playerId);
      if (bIndex < currentPlayerIndex) bIndex = bIndex + playerList.length;
      return aIndex.compareTo(bIndex);
    });

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
        currentPlayer == playerId &&
        // TODO: Fix "currentPlayerDrewCard" - not really working as expected
            (cardsInAddDraw > 0 || currentPlayerDrewCard));
  }
}
