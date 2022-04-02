import 'package:uno/src/cards/card.dart';
import 'package:uno/src/uno_color.dart';

/// A simple uno card.
class SimpleCard extends NumberedCard {
  @override
  final int number;

  @override
  final UnoColor color;

  SimpleCard(this.number, this.color);
}