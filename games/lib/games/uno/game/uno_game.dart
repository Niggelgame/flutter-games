import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/server/player.dart';
import 'package:games/games/uno/game/config.dart';
import 'package:games/games/uno/game/player_event.dart';
import 'package:games/games/uno/game/server_event.dart';
import 'package:games/games/uno/game/states/games_state.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/models/uno_card.dart';

class UnoGame extends Game<UnoPlayerEvent, UnoServerEvent> {
  final UnoGameConfig gameConfig;

  late GameState gameState;

  UnoGame({required this.gameConfig}) {
    _initGame();
  }
  _initGame() {
    gameState = GameState(SimpleGameState.initial, {}, '', [], [], '',
        Direction.clockwise, UnoCardColor.blue, false, false, 0);
  }

  @override
  bool allowsMorePlayers() {
    return (gameState.state == SimpleGameState.initial) &&
        gameState.players.length < gameConfig.maxPlayers;
  }

  @override
  void close() {}

  @override
  void onPlayerJoined(Player player) {
    super.onPlayerJoined(player);
    gameState.players[player.id] = GamePlayerState([]);
    broadcastWithPlayerState(
        (state, _) => UnoServerEvent.playerJoined(player.id, state));
  }

  @override
  Map<String, dynamic> get config => gameConfig.toJson();

  @override
  String get name => 'Uno';

  void broadcast(UnoServerEvent event) {
    for (var player in players) {
      player.send(event);
    }
  }

  void broadcastPlayerState() {
    for (var player in players) {
      player.send(UnoServerEvent.syncData(gameState.asPlayerState(player.id)));
    }
  }

  void broadcastWithPlayerState(
      UnoServerEvent Function(PlayerState state, String id) f) {
    for (var player in players) {
      player.send(f(gameState.asPlayerState(player.id), player.id));
    }
  }

  void fillDeck(int minLength) {
    if (gameState.stack.length < minLength) {
      final topCard = gameState.cardsPutDown.lastOrNull;
      final cardsPutDownLength = gameState.cardsPutDown.isEmpty
          ? 0
          : gameState.cardsPutDown.length - 1;
      final cardsPutDownDrawable =
          gameState.cardsPutDown.sublist(0, cardsPutDownLength);
      if (gameState.stack.length + (cardsPutDownDrawable.length) < minLength) {
        gameState = gameState.copyWith(
            stack: (gameState.stack + cardsPutDownDrawable + defaultDeck)
                .shuffleX(),
            cardsPutDown: [if (topCard != null) topCard]);
      }

      // Repeat if still not enough cards (should never ever happen - but who knows)
      fillDeck(minLength);
    }
  }

  void currentPlayerDrawCards(int count, {String? reason}) {
    fillDeck(count);

    var cards = gameState.stack.draw(count);
    final playerState = gameState.players[gameState.currentPlayer]!;
    gameState.players[gameState.currentPlayer] =
        playerState.copyWith(hand: playerState.hand + cards);

    gameState = gameState.copyWith(
      currentPlayerDrewCard: true,
    );

    broadcastWithPlayerState((state, id) => UnoServerEvent.cardsDrawn(
        gameState.currentPlayer,
        count,
        id == gameState.currentPlayer ? cards : null,
        reason,
        state));
  }

  bool isSpecialCard(UnoCard card) {
    return card.type == UnoCardType.wild ||
        card.type == UnoCardType.wildDrawFour ||
        card.type == UnoCardType.skip ||
        card.type == UnoCardType.reverse || 
        card.type == UnoCardType.drawTwo;
  }

  Player nextPlayer(String currentPlayer) {
    if (gameState.currentDirection == Direction.clockwise) {
      return players.indexWhere((element) => element.id == currentPlayer) ==
              players.length - 1
          ? players.first
          : players[players.indexWhere(
                  (element) => element.id == gameState.currentPlayer) +
              1];
    } else {
      return players.indexWhere((element) => element.id == currentPlayer) == 0
          ? players.last
          : players[players.indexWhere(
                  (element) => element.id == gameState.currentPlayer) -
              1];
    }
  }

  @override
  void onPlayerGameEvent(
      Player<UnoPlayerEvent, UnoServerEvent,
              Game<UnoPlayerEvent, UnoServerEvent>>
          player,
      UnoPlayerEvent event) async {
    if (event is UnoPlayerStartEvent) {
      if (gameState.state == SimpleGameState.initial && player.isAdmin) {
        if (players.length < 2) {
          player.send(UnoServerEvent.actionError('Not enough players'));
          return;
        }

        // Shuffle players to get random order while playing
        players.shuffle();

        final shuffledDeck = defaultDeck.shuffleX();
        gameState = gameState.copyWith(
          state: SimpleGameState.running,
          stack: shuffledDeck,
        );
        broadcastPlayerState();
        await Future.delayed(const Duration(seconds: 1));

        // give cards to players
        for (var p in players) {
          fillDeck(gameConfig.startHandLength);
          final cards = gameState.stack.draw(gameConfig.startHandLength);
          gameState.players[p.id] = GamePlayerState(cards);
        }

        // lay down top card
        fillDeck(1);
        var topCard = gameState.stack.draw(1)[0];
        // Make sure top card is never a special card
        // TODO: (niggelgame) maybe add special first card handling
        while (isSpecialCard(topCard)) {
          gameState.cardsPutDown.add(topCard);
          fillDeck(1);
          topCard = gameState.stack.draw(1)[0];
        }
        gameState = gameState
            .copyWith(cardsPutDown: [topCard], currentColor: topCard.color);

        // Select first player (randomly)
        final firstPlayer = players[Random().nextInt(players.length)];
        gameState = gameState.copyWith(currentPlayer: firstPlayer.id);

        gameState = gameState.copyWith(state: SimpleGameState.awaitingPlay);
        broadcastPlayerState();
      } else {
        player.send(UnoServerEvent.actionError('Game is already running'));
      }
    } else if (event is UnoPlayerDrawCardEvent) {
      if (gameState.state == SimpleGameState.awaitingPlay) {
        if (gameState.currentPlayer == player.id &&
            !gameState.currentPlayerDrewCard &&
            gameState.cardsInAddDraw == 0) {
          currentPlayerDrawCards(1);
        } else {
          player.send(UnoServerEvent.actionError('You can\'t draw cards now'));
          return;
        }
      } else {
        player.send(UnoServerEvent.actionError('Game is not ready'));
        return;
      }
    } else if (event is UnoPlayerSelectColorEvent) {
      if (gameState.state == SimpleGameState.awaitingColorSelection &&
          gameState.playerRequestingColor == player.id) {
        gameState = gameState.copyWith(
            playerRequestingColor: '',
            currentColor: event.color,
            state: SimpleGameState.awaitingPlay);
        broadcastWithPlayerState((state, id) =>
            UnoServerEvent.playerSelectedColor(player.id, event.color, state));
      }
    } else if (event is UnoPlayerSyncRequestEvent) {
      player.send(UnoServerEvent.syncData(gameState.asPlayerState(player.id)));
    } else if (event is UnoPlayerPlayCardEvent) {
      if (gameState.state == SimpleGameState.awaitingPlay) {
        if (gameState.currentPlayer == player.id) {
          gameState = gameState.copyWith(state: SimpleGameState.running);

          final currentPlayer = gameState.players[player.id]!;

          final card = currentPlayer.hand.firstWhereOrNull((element) =>
              element.type == event.card.type &&
              element.color == event.card.color);

          if (card == null) {
            player
                .send(UnoServerEvent.actionError('You do not have this card'));
            gameState = gameState.copyWith(state: SimpleGameState.awaitingPlay);
            return;
          }

          // Make sure player plays a draw card
          if (gameState.cardsInAddDraw > 0) {
            switch (gameConfig.drawForceStrategy) {
              case DrawForceStrategy.alwaysNext:
                {
                  player.send(UnoServerEvent.actionError('You need to skip.'));
                  gameState =
                      gameState.copyWith(state: SimpleGameState.awaitingPlay);
                  return;
                }
              case DrawForceStrategy.allowSame:
                {
                  final lastPlayedCard = gameState.cardsPutDown.last;
                  if (!((lastPlayedCard.type == UnoCardType.drawTwo &&
                          card.type == UnoCardType.drawTwo) ||
                      (lastPlayedCard.type == UnoCardType.wildDrawFour &&
                          card.type == UnoCardType.wildDrawFour))) {
                    player.send(UnoServerEvent.actionError(
                        'You need to play the same card type as before or skip.'));
                    gameState =
                        gameState.copyWith(state: SimpleGameState.awaitingPlay);
                    return;
                  }
                  break;
                }
              case DrawForceStrategy.allowSameOrHigher:
                {
                  final lastPlayedCard = gameState.cardsPutDown.last;
                  if (!((lastPlayedCard.type == UnoCardType.drawTwo &&
                          (card.type == UnoCardType.drawTwo ||
                              card.type == UnoCardType.wildDrawFour)) ||
                      (lastPlayedCard.type == UnoCardType.wildDrawFour &&
                          card.type == UnoCardType.wildDrawFour))) {
                    player.send(UnoServerEvent.actionError(
                        'You need to play a higher card type as before or skip.'));
                    gameState =
                        gameState.copyWith(state: SimpleGameState.awaitingPlay);
                    return;
                  }
                  break;
                }
              case DrawForceStrategy.allowAllFitting:
                {
                  if (card.type != UnoCardType.drawTwo ||
                      card.type != UnoCardType.wildDrawFour) {
                    player.send(UnoServerEvent.actionError(
                        'You need to play a draw card or skip.'));
                    gameState =
                        gameState.copyWith(state: SimpleGameState.awaitingPlay);
                    return;
                  }
                  break;
                }
            }
          }

          if (gameState.currentColor != card.color &&
              card.type != UnoCardType.wild &&
              card.type != UnoCardType.wildDrawFour &&
              gameState.cardsPutDown.last.type != card.type) {
            player
                .send(UnoServerEvent.actionError('You cannot play this card'));
            gameState = gameState.copyWith(state: SimpleGameState.awaitingPlay);
            return;
          }

          currentPlayer.hand.remove(card);
          gameState =
              gameState.copyWith(cardsPutDown: gameState.cardsPutDown + [card]);

          broadcastWithPlayerState(
              (state, id) => UnoServerEvent.cardPlayed(player.id, card, state));

          if (currentPlayer.hand.isEmpty) {
            gameState = gameState.copyWith(state: SimpleGameState.finished);
            broadcast(UnoServerEvent.end(player.id));
          } else if (currentPlayer.hand.length == 1) {
            if (!gameState.currentPlayerFlaggedForUno) {
              await Future.delayed(const Duration(seconds: 3));
              if (!gameState.currentPlayerFlaggedForUno) {
                currentPlayerDrawCards(3);
              }
            }
          }

          gameState.copyWith(currentPlayerFlaggedForUno: false);

          // Handle Special Actions
          switch (card.type) {
            case UnoCardType.skip:
              { 
                // TODO: Fix next player logic
                final nextPlayerId = nextPlayer(nextPlayer(player.id).id).id;
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayerId,
                    state: SimpleGameState.awaitingPlay,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.reverse:
              {
                // Fix next player logic (esp. with 2 players)
                gameState = gameState.copyWith(
                    currentDirection:
                        gameState.currentDirection == Direction.clockwise
                            ? Direction.counterclockwise
                            : Direction.clockwise);
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.id).id,
                    state: SimpleGameState.awaitingPlay,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.drawTwo:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.id).id,
                    state: SimpleGameState.awaitingPlay,
                    cardsInAddDraw: gameState.cardsInAddDraw + 2,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.wild:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.id).id,
                    state: SimpleGameState.awaitingColorSelection,
                    playerRequestingColor: player.id,
                    currentPlayerDrewCard: false);
                broadcastWithPlayerState((state, id) =>
                    UnoServerEvent.playerSelectingColor(player.id, state));
                break;
              }
            case UnoCardType.wildDrawFour:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.id).id,
                    state: SimpleGameState.awaitingColorSelection,
                    playerRequestingColor: player.id,
                    cardsInAddDraw: gameState.cardsInAddDraw + 4,
                    currentPlayerDrewCard: false);
                broadcastWithPlayerState((state, id) =>
                    UnoServerEvent.playerSelectingColor(player.id, state));
                break;
              }
            default:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.id).id,
                    state: SimpleGameState.awaitingPlay,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
              }
          }
        } else {
          player.send(UnoServerEvent.actionError('It is not your turn'));
        }
      } else {
        player.send(UnoServerEvent.actionError('Game is not ready'));
      }
    } else if (event is UnoPlayerFlagUnoEvent) {
      if (gameState.currentPlayer == player.id &&
          (gameState.state == SimpleGameState.awaitingPlay ||
              gameState.state == SimpleGameState.running)) {
        if (gameState.players[player.id]!.hand.length > 2) {
          player.send(UnoServerEvent.actionError(
              'You cannot have more than 2 cards and flag uno'));
          return;
        }
        gameState = gameState.copyWith(currentPlayerFlaggedForUno: true);
        player.send(UnoServerEvent.simpleMessage('You flagged for uno'));
        broadcastWithPlayerState(
            (state, id) => UnoServerEvent.playerUnoed(player.id, state));
      }
    } else if (event is UnoPlayerSkipEvent) {
      if (gameState.currentPlayer == player.id) {
        if ((gameState.state == SimpleGameState.awaitingPlay)) {
          if (gameState.cardsInAddDraw > 0) {
            currentPlayerDrawCards(gameState.cardsInAddDraw);
            gameState = gameState.copyWith(cardsInAddDraw: 0);
            if (!gameConfig.allowPlayerAfterForcedDraw) {
              gameState = gameState.copyWith(
                  currentPlayer: nextPlayer(player.id).id,
                  state: SimpleGameState.awaitingPlay,
                  currentPlayerDrewCard: false);
              broadcastWithPlayerState((state, id) =>
                  UnoServerEvent.playerSkipped(player.id, state));
            }
          } else if (gameState.currentPlayerDrewCard) {
            gameState = gameState.copyWith(
                cardsInAddDraw: 0,
                currentPlayerDrewCard: false,
                currentPlayerFlaggedForUno: false,
                currentPlayer: nextPlayer(player.id).id,
                state: SimpleGameState.awaitingPlay);
            broadcastWithPlayerState(
                (state, id) => UnoServerEvent.playerSkipped(player.id, state));
          } else {
            player.send(
                UnoServerEvent.actionError('You are not allowed to skip...'));
            return;
          }
        } else {
          player.send(UnoServerEvent.actionError('It cannot skip (yet).'));
          return;
        }
      } else {
        player.send(UnoServerEvent.actionError('It\'s not your turn'));
        return;
      }
    }
  }

  @override
  UnoPlayerEvent playerGameEventFromJson(Map<String, dynamic> json) =>
      UnoPlayerEvent.fromJson(json);

  @override
  UnoServerEvent serverGameEventFromJson(Map<String, dynamic> json) =>
      UnoServerEvent.fromJson(json);
}
