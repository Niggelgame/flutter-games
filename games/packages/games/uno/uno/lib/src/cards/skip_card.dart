

import 'package:uno/src/cards/card.dart';
import 'package:uno/src/uno_color.dart';

/// Implementation of [Card], skipping the next player.
class SkipCard extends ColoredCard with ActionCard {
  SkipCard(this.color);

  @override
  void applyToGame(game, p) {
    game.skipPlayer();
  }

  @override
  bool canBePlayedOn(PlayedCard card) => super.canBePlayedOn(card) || card is SkipCard;

  @override
  final UnoColor color;
}