
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uno_card.g.dart';

enum UnoCardColor {
  red,
  blue,
  green,
  yellow,
}

enum UnoCardType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  skip,
  reverse,
  drawTwo,
  wild,
  wildDrawFour,
}

@JsonSerializable()
class UnoCard {
  final UnoCardColor color;
  final UnoCardType type;

  UnoCard(this.color, this.type);

  factory UnoCard.fromJson(Map<String, dynamic> json) =>
      _$UnoCardFromJson(json);

  Map<String, dynamic> toJson() => _$UnoCardToJson(this);
}

final List<UnoCard> defaultDeck = [
  UnoCard(UnoCardColor.blue, UnoCardType.one),
  UnoCard(UnoCardColor.blue, UnoCardType.two),
  UnoCard(UnoCardColor.blue, UnoCardType.three),
  UnoCard(UnoCardColor.blue, UnoCardType.four),
  UnoCard(UnoCardColor.blue, UnoCardType.five),
  UnoCard(UnoCardColor.blue, UnoCardType.six),
  UnoCard(UnoCardColor.blue, UnoCardType.seven),
  UnoCard(UnoCardColor.blue, UnoCardType.eight),
  UnoCard(UnoCardColor.blue, UnoCardType.nine),
  UnoCard(UnoCardColor.blue, UnoCardType.skip),
  UnoCard(UnoCardColor.blue, UnoCardType.reverse),
  UnoCard(UnoCardColor.blue, UnoCardType.drawTwo),
  UnoCard(UnoCardColor.blue, UnoCardType.wild),
  UnoCard(UnoCardColor.blue, UnoCardType.wildDrawFour),
  UnoCard(UnoCardColor.red, UnoCardType.one),
  UnoCard(UnoCardColor.red, UnoCardType.two),
  UnoCard(UnoCardColor.red, UnoCardType.three),
  UnoCard(UnoCardColor.red, UnoCardType.four),
  UnoCard(UnoCardColor.red, UnoCardType.five),
  UnoCard(UnoCardColor.red, UnoCardType.six),
  UnoCard(UnoCardColor.red, UnoCardType.seven),
  UnoCard(UnoCardColor.red, UnoCardType.eight),
  UnoCard(UnoCardColor.red, UnoCardType.nine),
  UnoCard(UnoCardColor.red, UnoCardType.skip),
  UnoCard(UnoCardColor.red, UnoCardType.reverse),
  UnoCard(UnoCardColor.red, UnoCardType.drawTwo),
  UnoCard(UnoCardColor.red, UnoCardType.wild),
  UnoCard(UnoCardColor.red, UnoCardType.wildDrawFour),
  UnoCard(UnoCardColor.green, UnoCardType.one),
  UnoCard(UnoCardColor.green, UnoCardType.two),
  UnoCard(UnoCardColor.green, UnoCardType.three),
  UnoCard(UnoCardColor.green, UnoCardType.four),
  UnoCard(UnoCardColor.green, UnoCardType.five),
  UnoCard(UnoCardColor.green, UnoCardType.six),
  UnoCard(UnoCardColor.green, UnoCardType.seven),
  UnoCard(UnoCardColor.green, UnoCardType.eight),
  UnoCard(UnoCardColor.green, UnoCardType.nine),
  UnoCard(UnoCardColor.green, UnoCardType.skip),
  UnoCard(UnoCardColor.green, UnoCardType.reverse),
  UnoCard(UnoCardColor.green, UnoCardType.drawTwo),
  UnoCard(UnoCardColor.green, UnoCardType.wild),
  UnoCard(UnoCardColor.green, UnoCardType.wildDrawFour),
  UnoCard(UnoCardColor.yellow, UnoCardType.one),
  UnoCard(UnoCardColor.yellow, UnoCardType.two),
  UnoCard(UnoCardColor.yellow, UnoCardType.three),
  UnoCard(UnoCardColor.yellow, UnoCardType.four),
  UnoCard(UnoCardColor.yellow, UnoCardType.five),
  UnoCard(UnoCardColor.yellow, UnoCardType.six),
  UnoCard(UnoCardColor.yellow, UnoCardType.seven),
  UnoCard(UnoCardColor.yellow, UnoCardType.eight),
  UnoCard(UnoCardColor.yellow, UnoCardType.nine),
  UnoCard(UnoCardColor.yellow, UnoCardType.skip),
  UnoCard(UnoCardColor.yellow, UnoCardType.reverse),
  UnoCard(UnoCardColor.yellow, UnoCardType.drawTwo),
  UnoCard(UnoCardColor.yellow, UnoCardType.wild),
  UnoCard(UnoCardColor.yellow, UnoCardType.wildDrawFour),
];

extension UnoCardListX on List<UnoCard> {
  List<UnoCard> shuffleX() {
    final List<UnoCard> newList = toList();
    newList.shuffle();
    return newList;
  }

  List<UnoCard> draw(int count) {
    final drawnCards = take(count).toList();
    removeRange(0, count);
    return drawnCards;
  }
}
