
import 'package:uno/src/cards/card.dart';
import 'package:uno/src/game_config.dart';
import 'package:uno/src/uno_color.dart';

/// A [ColoredCard] making the next player draw 2 cards.
class DrawTwoCard extends ColoredCard with DrawingCard {
  DrawTwoCard(this.color);

  @override
  bool canBePlayedOn(PlayedCard card) => super.canBePlayedOn(card) || card is DrawTwoCard;

  @override
  bool canStackWith(PlayedCard card, DrawExtensionStrategy strategy) {
    switch (strategy) {
      case DrawExtensionStrategy.none:
        return false;
      case DrawExtensionStrategy.sameType:
        return card is DrawTwoCard;
      case DrawExtensionStrategy.sameOrHigherType:
        return card is DrawTwoCard;
      case DrawExtensionStrategy.fitting:
        return card.color == color;
    }
  }

  @override
  final int cards = 2;

  @override
  final UnoColor color;
}