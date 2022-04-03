import 'dart:collection';

import 'package:meta/meta.dart';
import 'package:uno/src/cards/card.dart';
import 'package:uno/src/cards/draw_two_card.dart';
import 'package:uno/src/cards/reverse_card.dart';
import 'package:uno/src/cards/simple_card.dart';
import 'package:uno/src/cards/skip_card.dart';
import 'package:uno/src/cards/wild_cards.dart';
import 'package:uno/src/exceptions/card_does_not_match_exception.dart';
import 'package:uno/src/exceptions/player_does_not_have_card_exception.dart';
import 'package:uno/src/game_config.dart';
import 'package:uno/src/uno_color.dart';

enum Direction { clockwise, counterclockwise }

extension DirectionX on Direction {
  Direction not() {
    return this == Direction.clockwise
        ? Direction.counterclockwise
        : Direction.clockwise;
  }
}

/// Representation of a player (inheritable).
class Player {
  late List<Card> deck;
  
  bool _saidUno = false;
  bool get saidUno => _saidUno;
  @internal
  set saidUno(v) => _saidUno = v;

  /// Function called if this Player was skipped.
  void onSkip() {}

  /// Function called when the player draws cards. 
  /// 
  /// [Player.deck] will already be updated.
  void onCardsDrawn(int amount, List<Card> cards) {}

  /// Function called when the player forgot to say uno in [game].
  void forgotUno(Game game) {}

  /// Function called if the player won [place].
  void onWin(int place) {}

  /// Callback to indicate that the players cards changed.
  void refreshCards() {}

  /// Makes the player say uno.
  @mustCallSuper
  void uno() {
    _saidUno = true;
  }

  /// Plays [card] in [game] with a chosen [color] if needed.
  ///
  /// Throws a [PlayerDoesNotHaveCardException] if the player doesn't have an instance of
  /// [card] in his deck.
  /// 
  /// Throws a [CardDoesNotMatchException] if the card doesn't match the top card
  void playCard(Game game, Card card, {UnoColor color = UnoColor.blue}) {
    if (!deck.remove(card)) {
      throw PlayerDoesNotHaveCardException(card);
    }

    game.playCard(this, card.play(color));
  }

  /// Makes the player draw 1 card in [game].
  void drawCard(Game game) {
    game.drawCards(this, 1);
  }
}

/// Representation of a game of UNO.
class Game<T extends Player> {
  final List<T> initialPlayers;
  final GameConfig config;

  // Make sure to catch exceptions while initializing the game.
  Game({required this.initialPlayers, required this.config})
      : _players = initialPlayers.toList()..shuffle() {
    playerSequence = _NormalPlayerSequence(game: this);

    _init();
  }

  late final _PlayerSequence<T> playerSequence;

  /// The current deck used to draw cards.
  final _deck = getDefaultUnoDeck();

  @visibleForTesting
  set deck (List<Card> newDeck) {
    _deck.clear();
    _deck.addAll(newDeck);
  }

  /// The cards already played. Used to shuffle into deck when needed.
  final _playedDeck = <PlayedCard>[];

  // ignore: unused_element
  List<T> get _orderedPlayers {
    if (playerSequence is _OrderedPlayerSequence<T>) {
      return (playerSequence as _OrderedPlayerSequence<T>).playersInOrder;
    } else {
      throw Exception(
          'orderedPlayers is only available when using OrderedPlayerSequence implementations');
    }
  }

  /// Current players in the game. Initialized with [initialPlayers] and shuffled.
  final List<T> _players;

  // last player can't win
  final _wonPlayers = <T>[];

  Direction direction = Direction.clockwise;

  List<T> get players => _players.toList();
  List<T> get wonPlayers => _wonPlayers.toList();
  int drawCardSum = 0;

  void _init() {
    if (initialPlayers.length < 2) {
      throw Exception('At least 2 players are required');
    } else if (initialPlayers.length > config.maxPlayerCount) {
      throw Exception('Too many players');
    }

    // Hand out each player's initial cards
    for (var player in players) {
      player.deck = [];
      _handOutCards(player, config.initialCardCount);
    }

    // Play first card as first player. If it is a wild card, the color is choosen randomly.
    _playedDeck.add(_deck.first.play(UnoColorX.random()));
    playCard(_players.first, _playedDeck.first);
    _playedDeck.removeAt(0);
  }

  /// The index of the last player having a turn
  int get lastPlayerIndex => playerSequence.lastIndex;

  /// Whether this game is still running or not.
  bool get isRunning => playerSequence.hasNext();

  /// The [PlayedCard] on top of the deck.
  PlayedCard get topCard => _playedDeck.last;

  /// Skips the next player
  void skipPlayer() => nextPlayer().onSkip();

  /// Reverses [direction]
  void reverse() {
    direction = direction.not();
    // If there are only two players, reverse will result in a skip
    if (players.length == 2) {
      nextPlayer();
    }
  }

  /// Obtains the next [Player]
  T nextPlayer() {
    playerSequence.moveNext();
    return playerSequence.current;
  }

  /// Obtains the next player without progressing the player sequence
  T getNextPlayer() => playerSequence.nextWithoutProgress();

  /// Forces [player] to be added to [wonPlayers].
  void forceWin(T player) {
    _win(player);
  }

  /// Removes [player] from the game.
  bool removePlayer(Player player) => _players.remove(player);

  /// Assumes that [card] has been removed from [player]s deck
  void playCard(Player player, PlayedCard card) {
    // Check whether card matches the top card
    if (!card.canBePlayedOn(topCard))
      throw CardDoesNotMatchException(topCard, card);

    // Check uno rul
    // TODO: allow uno a second after placing the card down
    if (player.deck.length == 1 && !player.saidUno) {
      drawCards(player, 2);
      player.forgotUno(this);
    }

    // Play card
    if (card is ActionCard) {
      (card as ActionCard).applyToGame(this, player);
    }
    if (card is DrawingCard) {
      final _card = (card as DrawingCard);
      if (_card.canStackWith(topCard, config.drawExtensionStrategy)) {
        drawCardSum += _card.cards;
      } else {
        player.onCardsDrawn(drawCardSum);
        _drawSummedCards(player);
        drawCardSum = _card.cards;
      }
    } else if (drawCardSum >= 1) {
      _drawSummedCards(player);
    }

    _playedDeck.add(card);

    // Reset uno state
    player.saidUno = false;

    // Check whether player won
    if (player.deck.isEmpty) {
      _win(player);
      player.onWin(wonPlayers.length);
    }
  }

  void _win(Player player) {
    _players.remove(player);
    _wonPlayers.add((player as T));
  }

  void _drawSummedCards(Player player) {
    drawCards(player, drawCardSum);
    drawCardSum = 0;
  }

  void drawCards(Player player, int cards) {
    // TODO: Uno Bluff?

    if (drawCardSum >= 1 && cards != drawCardSum) {
      return _drawSummedCards(player);
    }
    _handOutCards(player, cards);
  }

  void _handOutCards(Player player, int cards) {
    // Grab cards from played deck if this deck is empty
    if (cards > _deck.length) {
      _deck.addAll(_playedDeck..shuffle());
    }

    final drawnCards = _deck.take(cards);
    player.deck.addAll(drawnCards);
  }
}

/// Abstract representation of a player sequence.
abstract class _PlayerSequence<T extends Player> extends Iterator<T> {
  abstract int lastIndex;

  /// Get the next sequence element while keeping the current element the same
  /// and without progessing further in our Iterator.
  T nextWithoutProgress();

  /// Check whether there are more elements in the sequence.
  bool hasNext();
}

/// A player sequence which is ordered by some player order.
abstract class _OrderedPlayerSequence<T extends Player>
    extends _PlayerSequence<T> {
  abstract List<T> playersInOrder;
}

class _NormalPlayerSequence<T extends Player> extends _PlayerSequence<T> {
  final Game<T> game;

  @override
  int lastIndex = -1;

  _NormalPlayerSequence({required this.game});

  @override
  T nextWithoutProgress() {
    final indexNow = lastIndex;
    moveNext();
    final player = current;
    lastIndex = indexNow;

    return player;
  }

  @override
  T get current => game.players[lastIndex];

  @override
  bool moveNext() {
    if (!hasNext()) {
      return false;
    }
    if (game.direction == Direction.clockwise) {
      if (++lastIndex >= game.players.length) {
        lastIndex = 0;
      }
    } else {
      if (--lastIndex < 0) {
        lastIndex = game.players.length - 1;
      }
    }
    return true;
  }

  @override
  bool hasNext() => game.players.length > 1;
}

/// Get a shuffled deck of cards.
DoubleLinkedQueue<Card> getDefaultUnoDeck() {
  final deck = defaultUnoDeck.toList()..shuffle();
  return DoubleLinkedQueue.of(deck);
}

final List<Card> defaultUnoDeck = () {
  final deck = <Card>[];

  for (var color in UnoColor.values) {
    // each color has one 0 card
    deck.add(SimpleCard(0, color));

    // each color has 2 cards for each number from 1 to 9
    for (var number = 1; number <= 9; number++) {
      deck.add(SimpleCard(number, color));
      deck.add(SimpleCard(number, color));
    }

    // each color has two of each colored action cards
    for (var i = 0; i <= 1; i++) {
      deck.add(DrawTwoCard(color));
      deck.add(ReverseCard(color));
      deck.add(SkipCard(color));
    }
  }

  // there are 4 wild cards of each type
  for (var i = 0; i <= 3; i++) {
    deck.add(WildCard());
    deck.add(WildCardDrawFour());
  }

  return deck;
}();
