
import 'package:meta/meta.dart';
import 'package:uno/src/cards/simple_card.dart';
import 'package:uno/src/game.dart';
import 'package:uno/src/game_config.dart';
import 'package:uno/src/uno_color.dart';

/// Representation of a normal Uno Card
abstract class Card extends Comparable<Card> {
  /// Checks whether this card can be played on [card].
  bool canBePlayedOn(PlayedCard card);

  /// Converts this card into a [PlayedCard]
  /// 
  /// [color] is the [UnoColor] chosen if this is a [WildCard]
  PlayedCard play(UnoColor color);
}

/// A [Card] with a special action (like skip, reverse)
mixin ActionCard on Card {
  /// Applies this cards action to [game].
  void applyToGame(Game game, Player p);
}

/// A card which has already been played
abstract class PlayedCard extends Card {
  /// This cards fixed color (See [ColoredCard]) or the color chosen if this is a wild card.
  abstract final UnoColor color;
}

/// A card causing the next player to draw cards
mixin DrawingCard on Card {
  abstract final int cards;

  /// Checks whether this card stacks with [card] or not.
  bool canStackWith(PlayedCard card, DrawExtensionStrategy strategy);
}

/// Abstract implementation of [Card] and [PlayedCard] for cards which have a fixed color.
abstract class ColoredCard extends PlayedCard {
  @override
  bool canBePlayedOn(PlayedCard card) => card.color == color;

  @override
  @protected
  PlayedCard play(color) => this;

  @override
  int compareTo(Card other) {
    if (other is PlayedCard) {
      return color.compareTo(other.color);
    } else {
      return 0;
    }
  }
}

/// Abstract implementation of numbered, colored cards.
abstract class NumberedCard extends ColoredCard {
  /// number of this card
  abstract final int number;

  @override
  bool canBePlayedOn(PlayedCard card) {
    if (super.canBePlayedOn(card)) return true;
    if (card is NumberedCard) {
      return number == card.number;
    } else {
      return false;
    }
  }

  @override
  int compareTo(Card other) {
    final parent = super.compareTo(other);

    if(parent == 0) {
      if(other is SimpleCard) {
        return number.compareTo(other.number);
      } else {
        return -1;
      }
    } else {
      return parent;
    }
  }
}