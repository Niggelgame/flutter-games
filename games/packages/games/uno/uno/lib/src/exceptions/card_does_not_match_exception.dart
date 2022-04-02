
import 'package:uno/src/cards/card.dart';


/// Exception thrown when a player tries to play a [Card][PlayedCard], which does not match the top [Card][PlayedCard]
class CardDoesNotMatchException implements Exception {
  /// The current top card
  final PlayedCard currentCard;

  /// The card the player tried to play
  final PlayedCard triedCard;

  CardDoesNotMatchException(this.currentCard, this.triedCard);

  @override
  String toString() {
    return 'CardDoesNotMatchException: tried to play $triedCard, but current card is $currentCard';
  }
}