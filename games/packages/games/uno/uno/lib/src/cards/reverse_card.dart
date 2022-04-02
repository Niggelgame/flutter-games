import 'package:uno/src/cards/card.dart';
import 'package:uno/src/uno_color.dart';

/// Implementation of [Card], reversing [Game.direction].
class ReverseCard extends ColoredCard with ActionCard {
  ReverseCard(this.color);

  @override
  void applyToGame(game, p) {
    game.reverse();
  }

  @override
  bool canBePlayedOn(PlayedCard card) =>
      super.canBePlayedOn(card) || card is ReverseCard;

  @override
  final UnoColor color;
}
