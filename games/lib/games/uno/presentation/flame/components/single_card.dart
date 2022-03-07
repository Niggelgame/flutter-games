import 'dart:ui';

import 'package:flame/components.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

const spriteWidth = 3362.0;
const spriteHeight = 2882.0;

const cardWidth = spriteWidth / 14;
const cardHeight = spriteHeight / 8;

const cardHeightWidthRatio = cardHeight / cardWidth;

double _getCardColorOffset(UnoCard card) {
  switch (card.color) {
    case UnoCardColor.blue:
      return 3;
    case UnoCardColor.green:
      return 2;
    case UnoCardColor.yellow:
      return 1;
    case UnoCardColor.red:
      return 0;
  }
}

Vector2 _getCardOffset(UnoCard? card) {
  if (card == null) {
    return Vector2(0, 4);
  }

  switch (card.type) {
    // Wild Cards are on the right side of the asset
    case UnoCardType.wildDrawFour:
      return Vector2(13, 4);
    case UnoCardType.wild:
      return Vector2(13, 0);
    case UnoCardType.drawTwo:
      return Vector2(12, _getCardColorOffset(card));
    case UnoCardType.reverse:
      return Vector2(11, _getCardColorOffset(card));
    case UnoCardType.skip:
      return Vector2(10, _getCardColorOffset(card));
    case UnoCardType.nine:
      return Vector2(9, _getCardColorOffset(card));
    case UnoCardType.eight:
      return Vector2(8, _getCardColorOffset(card));
    case UnoCardType.seven:
      return Vector2(7, _getCardColorOffset(card));
    case UnoCardType.six:
      return Vector2(6, _getCardColorOffset(card));
    case UnoCardType.five:
      return Vector2(5, _getCardColorOffset(card));
    case UnoCardType.four:
      return Vector2(4, _getCardColorOffset(card));
    case UnoCardType.three:
      return Vector2(3, _getCardColorOffset(card));
    case UnoCardType.two:
      return Vector2(2, _getCardColorOffset(card));
    case UnoCardType.one:
      return Vector2(1, _getCardColorOffset(card));
    case UnoCardType.zero:
      return Vector2(0, _getCardColorOffset(card));
  }
}

class SingleCardComponent extends PositionComponent
    with HasGameRef<UnoGameEntrypoint>, Tappable, Hoverable {
  late final Image _rawSpriteSheet;
  late final Vector2 _cardSize;

  final VoidCallback? onTap;
  final void Function(SingleCardComponent)? onHoverEnterCallback;
  final void Function(SingleCardComponent)? onHoverLeaveCallback;

  UnoCard? _card;
  Sprite? _sprite;

  SingleCardComponent(this._card, {this.onTap, Vector2? position, Vector2? size, this.onHoverEnterCallback, this.onHoverLeaveCallback}) : super(position: position, size: size);

  setCard(UnoCard? card) {
    _card = card;
    _resetSprite();
  }

  @override
  Future<void>? onLoad() {
    _rawSpriteSheet = gameRef.images.fromCache('uno_deck.png');
    final _singleCardWidth = _rawSpriteSheet.width / 14;
    final _singleCardHeight = _rawSpriteSheet.height / 8;

    _cardSize = Vector2(_singleCardWidth, _singleCardHeight);

    _resetSprite();
    return super.onLoad();
  }

  void _resetSprite() {
    final position = _getCardOffset(_card);
    _sprite = Sprite(_rawSpriteSheet,
        srcPosition:
            Vector2(position.x * _cardSize.x, position.y * _cardSize.y),
        srcSize: _cardSize);
  }

  @override
  void render(Canvas canvas) {
    _sprite?.render(canvas, size: size.isInfinite || size.isZero() ? null : size);
    super.render(canvas);
  }

  @override
  bool onTapDown(info) {
    if (onTap != null) {
      onTap!();
      return false;
    }
    return super.onTapDown(info);
  }

  @override
  bool onHoverEnter(info) {
    if(onHoverEnterCallback != null) {
      onHoverEnterCallback!(this);
      return false;
    }
    return super.onHoverEnter(info);
  }

  @override
  bool onHoverLeave(info) {
    if(onHoverLeaveCallback != null) {
      onHoverLeaveCallback!(this);
      return false;
    }
    return super.onHoverLeave(info);
  }
}
