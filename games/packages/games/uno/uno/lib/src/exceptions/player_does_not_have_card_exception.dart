import 'package:uno/src/cards/card.dart';

/// Exception thrown when a player tries to play a [Card] he doesn't have.
class PlayerDoesNotHaveCardException implements Exception {
  /// The card the player tried to play
  final Card card;

  PlayerDoesNotHaveCardException(this.card);
}