import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_base/game_base.dart';
import 'package:uno_game/src/game/config.dart';
import 'package:uno_game/src/game/player_event.dart';
import 'package:uno_game/src/game/server_event.dart';
import 'package:uno_game/src/game/states/games_state.dart';
import 'package:uno_game/src/game/states/player_state.dart';
import 'package:uno_game/src/models/uno_card.dart';

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
  void onPlayerJoined(SingleSessionHandler<UnoPlayerEvent, UnoServerEvent> player) {
    super.onPlayerJoined(player);
    gameState.players[player.sessionId] = GamePlayerState([], player.name);
    broadcastWithPlayerState(
        (state, _) => UnoServerEvent.playerJoined(player.sessionId, state));
  }

  @override
  void onPlayerLeft(SingleSessionHandler<UnoPlayerEvent, UnoServerEvent> player) {
    super.onPlayerLeft(player);
    gameState.players.remove(player.sessionId);
    broadcastWithPlayerState(
        (state, _) => UnoServerEvent.playerLeft(player.sessionId, state));
  }

  @override
  String get name => gameName;

  static String get gameName => 'Uno';

  void broadcast(UnoServerEvent event) {
    for (var player in players) {
      player.send(event);
    }
  }

  void broadcastPlayerState() {
    for (var player in players) {
      player.send(
          UnoServerEvent.syncData(gameState.asPlayerState(player.sessionId, players)));
    }
  }

  void broadcastWithPlayerState(
      UnoServerEvent Function(PlayerState state, String id) f) {
    for (var player in players) {
      player.send(f(gameState.asPlayerState(player.sessionId, players), player.sessionId));
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

  void currentPlayerDrawCards(int count,
      {String? reason, bool updateCurrentPlayerDrewCard = true}) {
    fillDeck(count);

    var cards = gameState.stack.draw(count);
    final playerState = gameState.players[gameState.currentPlayer]!;
    gameState.players[gameState.currentPlayer] =
        playerState.copyWith(hand: playerState.hand + cards);

    if (updateCurrentPlayerDrewCard) {
      gameState = gameState.copyWith(
        currentPlayerDrewCard: true,
      );
    }

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

  SingleSessionHandler<UnoPlayerEvent, UnoServerEvent> nextPlayer(String currentPlayer) {
    final currentPlayerIndex =
        players.indexWhere((element) => element.sessionId == currentPlayer);
    if (gameState.currentDirection == Direction.clockwise) {
      return currentPlayerIndex == players.length - 1
          ? players.first
          : players[currentPlayerIndex + 1];
    } else {
      return currentPlayerIndex == 0
          ? players.last
          : players[currentPlayerIndex - 1];
    }
  }

  @override
  void onPlayerGameEvent(
      SingleSessionHandler<UnoPlayerEvent, UnoServerEvent>
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
          gameState.players[p.sessionId] = GamePlayerState(cards, p.name);
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
        gameState = gameState.copyWith(currentPlayer: firstPlayer.sessionId);

        gameState = gameState.copyWith(state: SimpleGameState.awaitingPlay);
        broadcastPlayerState();
      } else {
        player.send(UnoServerEvent.actionError(
            'Game is already running or you are not allowed to start the game'));
      }
    } else if (event is UnoPlayerDrawCardEvent) {
      if (gameState.state == SimpleGameState.awaitingPlay) {
        if (gameState.currentPlayer == player.sessionId &&
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
          gameState.playerRequestingColor == player.sessionId) {
        gameState = gameState.copyWith(
            playerRequestingColor: '',
            currentColor: event.color,
            state: SimpleGameState.awaitingPlay);
        broadcastWithPlayerState((state, id) =>
            UnoServerEvent.playerSelectedColor(player.sessionId, event.color, state));
      }
    } else if (event is UnoPlayerSyncRequestEvent) {
      player.send(
          UnoServerEvent.syncData(gameState.asPlayerState(player.sessionId, players)));
    } else if (event is UnoPlayerPlayCardEvent) {
      if (gameState.state == SimpleGameState.awaitingPlay) {
        if (gameState.currentPlayer == player.sessionId) {
          gameState = gameState.copyWith(state: SimpleGameState.running);

          final currentPlayer = gameState.players[player.sessionId]!;

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
                  if (card.type != UnoCardType.drawTwo &&
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
          gameState = gameState.copyWith(
              cardsPutDown: gameState.cardsPutDown + [card],
              currentColor: card.color);

          broadcastWithPlayerState(
              (state, id) => UnoServerEvent.cardPlayed(player.sessionId, card, state));

          if (currentPlayer.hand.isEmpty) {
            gameState = gameState.copyWith(state: SimpleGameState.finished);
            broadcast(UnoServerEvent.end(player.sessionId));
          } else if (currentPlayer.hand.length == 1) {
            if (!gameState.currentPlayerFlaggedForUno) {
              await Future.delayed(const Duration(seconds: 3));
              if (!gameState.currentPlayerFlaggedForUno) {
                currentPlayerDrawCards(3, updateCurrentPlayerDrewCard: false);
              }
            }
          }

          gameState.copyWith(currentPlayerFlaggedForUno: false);

          // Handle Special Actions
          switch (card.type) {
            case UnoCardType.skip:
              {
                // TODO: Fix next player logic
                final nextPlayerId = nextPlayer(nextPlayer(player.sessionId).sessionId).sessionId;
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayerId,
                    state: SimpleGameState.awaitingPlay,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.reverse:
              {
                // TODO: Fix next player logic (esp. with 2 players)
                gameState = gameState.copyWith(
                    currentDirection:
                        gameState.currentDirection == Direction.clockwise
                            ? Direction.counterclockwise
                            : Direction.clockwise);
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.sessionId).sessionId,
                    state: SimpleGameState.awaitingPlay,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.drawTwo:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.sessionId).sessionId,
                    state: SimpleGameState.awaitingPlay,
                    cardsInAddDraw: gameState.cardsInAddDraw + 2,
                    currentPlayerDrewCard: false);
                broadcastPlayerState();
                break;
              }
            case UnoCardType.wild:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.sessionId).sessionId,
                    state: SimpleGameState.awaitingColorSelection,
                    playerRequestingColor: player.sessionId,
                    currentPlayerDrewCard: false);
                broadcastWithPlayerState((state, id) =>
                    UnoServerEvent.playerSelectingColor(player.sessionId, state));
                break;
              }
            case UnoCardType.wildDrawFour:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.sessionId).sessionId,
                    state: SimpleGameState.awaitingColorSelection,
                    playerRequestingColor: player.sessionId,
                    cardsInAddDraw: gameState.cardsInAddDraw + 4,
                    currentPlayerDrewCard: false);
                broadcastWithPlayerState((state, id) =>
                    UnoServerEvent.playerSelectingColor(player.sessionId, state));
                break;
              }
            default:
              {
                gameState = gameState.copyWith(
                    currentPlayer: nextPlayer(player.sessionId).sessionId,
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
      if (gameState.currentPlayer == player.sessionId &&
          (gameState.state == SimpleGameState.awaitingPlay ||
              gameState.state == SimpleGameState.running)) {
        if (gameState.players[player.sessionId]!.hand.length > 2) {
          player.send(UnoServerEvent.actionError(
              'You cannot have more than 2 cards and flag uno'));
          return;
        }
        gameState = gameState.copyWith(currentPlayerFlaggedForUno: true);
        player.send(UnoServerEvent.simpleMessage('You flagged for uno'));
        broadcastWithPlayerState(
            (state, id) => UnoServerEvent.playerUnoed(player.sessionId, state));
      }
    } else if (event is UnoPlayerSkipEvent) {
      if (gameState.currentPlayer == player.sessionId) {
        if ((gameState.state == SimpleGameState.awaitingPlay)) {
          if (gameState.cardsInAddDraw > 0) {
            currentPlayerDrawCards(gameState.cardsInAddDraw);
            gameState = gameState.copyWith(cardsInAddDraw: 0);
            if (!gameConfig.allowPlayerAfterForcedDraw) {
              gameState = gameState.copyWith(
                  currentPlayer: nextPlayer(player.sessionId).sessionId,
                  cardsInAddDraw: 0,
                  state: SimpleGameState.awaitingPlay,
                  currentPlayerDrewCard: false);
              broadcastWithPlayerState((state, id) =>
                  UnoServerEvent.playerSkipped(player.sessionId, state));
            }
          } else if (gameState.currentPlayerDrewCard) {
            gameState = gameState.copyWith(
                cardsInAddDraw: 0,
                currentPlayerDrewCard: false,
                currentPlayerFlaggedForUno: false,
                currentPlayer: nextPlayer(player.sessionId).sessionId,
                state: SimpleGameState.awaitingPlay);
            broadcastWithPlayerState(
                (state, id) => UnoServerEvent.playerSkipped(player.sessionId, state));
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
  Map<String, dynamic> get configAsJson => gameConfig.toJson();
}
