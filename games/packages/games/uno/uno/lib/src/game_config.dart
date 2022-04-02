/// Configure which cards are allowed to continue a drawing spree.
enum DrawExtensionStrategy {
  /// No cards are allowed to continue a drawing spree.
  none,

  /// Drawing spree can be continued by cards of the same type.
  ///
  /// Example: A DrawTwoCard can be played on a DrawTwoCard, while continuing the drawing spree.
  /// A WildCardDrawFour will not continue the drawing spree of a DrawTwoCard.
  sameType,

  /// Drawing spree can be continued by cards of the same or higher type.
  ///
  /// Example: A DrawTwoCard can be played on a DrawTwoCard, while continuing the drawing spree.
  /// A WildCardDrawFour can be played on a DrawTwoCard, while continuing the drawing spree.
  /// Any DrawTwoCard will not continue the drawing spree of a WildCardDrawFour.
  sameOrHigherType,

  /// Drawing spree can be continued by all drawing cards fitting the last placed card.
  ///
  /// Example: A WildCardDrawFour can be played on a WildCardDrawFour, while continuing the drawing spree.
  /// A WildCardDrawFour can be played on a DrawTwoCard, while continuing the drawing spree.
  /// A DrawTwoCard can be played on a WildCardDrawFour, while continuing the drawing spree,
  /// **if** the chosen color of the WildCardDrawFour is the same as the color of the DrawTwoCard.
  fitting
}

class GameConfig {
  final DrawExtensionStrategy drawExtensionStrategy;
  final int initialCardCount;
  final int maxPlayerCount;

  GameConfig({
    this.drawExtensionStrategy = DrawExtensionStrategy.sameOrHigherType,
    this.initialCardCount = 7,
    this.maxPlayerCount = 8,
  });
}
