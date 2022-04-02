
import 'dart:math';

/// The colors of UNO
enum UnoColor {
  red,
  yellow,
  blue,
  green
}

extension UnoColorX on UnoColor {
  int compareTo(UnoColor other) {
    return index.compareTo(other.index);
  }

  static UnoColor random() {
    return UnoColor.values[Random().nextInt(UnoColor.values.length)];
  }
}