import 'package:uno/src/cards/card.dart';
import 'package:uno/src/game_config.dart';
import 'package:uno/src/uno_color.dart';

class PlayedWildCard extends PlayedCard with WildCardMixin {
  PlayedWildCard(this.color);

  @override
  final UnoColor color;
}



/// Mixin for all wild cards.
mixin WildCardMixin on Card {
  @override
  bool canBePlayedOn(PlayedCard card) => true;

  @override
  PlayedCard play(color) => PlayedWildCard(color);

  @override
  int compareTo(Card other) {
    if (this is WildCard && other is WildCard) {
      return 0;
    } else if (this is WildCardDrawFour && other is WildCardDrawFour) {
      return 0;
    } else if (other is WildCardDrawFour) {
      return 1;
    } else {
      return -1;
    }
  }
}

/// Implementation of a non-played wild card.
class WildCard extends Card with WildCardMixin {}

/// Extension of [WildCard] also implementing [DrawingCard] to draw 4 cards.
class WildCardDrawFour extends Card with DrawingCard, WildCardMixin {
  @override
  final int cards = 4;

  @override
  bool canStackWith(PlayedCard card, DrawExtensionStrategy strategy) {
    switch (strategy) {
      case DrawExtensionStrategy.none:
        return false;
      case DrawExtensionStrategy.sameType:
        return card is WildCardDrawFour;
      case DrawExtensionStrategy.sameOrHigherType:
        return true;
      case DrawExtensionStrategy.fitting:
        return true;
    }
  }
}