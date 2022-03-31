import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/components/single_card.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

class DeckComponent extends PositionComponent {
  final Stream<PlayerState> playerStateStream;
  final PlayerState? initialPlayerState;
  final VoidCallback onDeckTap;

  late final StreamSubscription<PlayerState> _streamSubscription;

  UnoCard? topCard;

  _DrawDeckComponent? _drawDeckComponent;
  _TopCardComponent? _topCardComponent;
  _ColorCircleComponent? _colorCircleComponent;

  // @override
  // bool get debugMode => true;

  DeckComponent(
      {required this.playerStateStream,
      this.initialPlayerState,
      required this.onDeckTap,
      required Vector2 position,
      required Vector2 size})
      : super(position: position, size: size);

  @override
  Future<void>? onLoad() {
    _streamSubscription = playerStateStream.listen((event) {
      topCard = event.lastPlayedCard;
    });

    final deckWidth = size.y / cardHeightWidthRatio;
    _drawDeckComponent = _DrawDeckComponent(onDeckTap)
      ..size = Vector2(deckWidth, size.y);

    _topCardComponent = _TopCardComponent()
      ..position = Vector2(size.x - deckWidth, 0)
      ..size = Vector2(deckWidth, size.y);

    _colorCircleComponent = _ColorCircleComponent(radius: 30)
      ..position = Vector2(size.x / 2, size.y / 2);

    add(_drawDeckComponent!);
    add(_topCardComponent!);
    add(_colorCircleComponent!);

    return super.onLoad();
  }

  @override
  set size(Vector2 size) {
    final deckWidth = size.x / 2.5;
    _drawDeckComponent?.size = Vector2(deckWidth, size.y);
    _topCardComponent?.size = Vector2(deckWidth, size.y);
    _topCardComponent?.position = Vector2(size.x - deckWidth, 0);
    _colorCircleComponent?.position = Vector2(size.x / 2, size.y / 2);

    super.size = size;
  }

  @override
  void onRemove() {
    _streamSubscription.cancel();
    super.onRemove();
  }
}

class _ColorCircleComponent extends PositionComponent
    with HasGameRef<UnoGameEntrypoint> {
  final double radius;

  late final Paint _paint;

  StreamSubscription? _subscription;

  // @override
  // bool get debugMode => true;

  _ColorCircleComponent({required this.radius}) : assert(radius >= 0);

  @override
  Future<void>? onLoad() {
    _paint = Paint()
      ..color = gameRef.unoRepo.lastPlayerState?.currentColor.toColor() ??
          Colors.white
      ..style = PaintingStyle.fill;

    _subscription = gameRef.unoRepo.playerStateStream.listen((event) {
      _paint.color = event.currentColor.toColor();
    });

    return super.onLoad();
  }

  @override
  void onRemove() {
    _subscription?.cancel();
    super.onRemove();
  }

  set color(Color color) {
    _paint.color = color;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(const Offset(0, 0), radius, _paint);
  }
}

extension _UsualColor on UnoCardColor {
  Color toColor() {
    switch (this) {
      case UnoCardColor.blue:
        return Colors.blue;
      case UnoCardColor.green:
        return Colors.green;
      case UnoCardColor.red:
        return Colors.red;
      case UnoCardColor.yellow:
        return Colors.yellow;
    }
  }
}

class _DrawDeckComponent extends PositionComponent with Tappable {
  final void Function() onTap;

  final List<SingleCardComponent> stack = [];

  _DrawDeckComponent(this.onTap);

  @override
  bool onTapDown(TapDownInfo info) {
    onTap();

    for (final e in stack) {
      e.add(RotateEffect.to(
          0.1 * pi, EffectController(duration: 0.2, alternate: true)));
    }
    return false;
  }

  @override
  Future<void>? onLoad() {
    for (int i = 0; i < 3; i++) {
      final comp = SingleCardComponent(null,
          position: Vector2(10.0 * i, 0),
          size: Vector2(size.y / cardHeightWidthRatio, size.y));
      stack.add(comp);

      add(comp
        ..anchor = Anchor.topLeft
        ..angle = 0.03 * pi * i);
    }

    return super.onLoad();
  }

  @override
  set size(Vector2 size) {
    for (final e in stack) {
      e.size = Vector2(size.y / cardHeightWidthRatio, size.y);
    }
    super.size = size;
  }
}

class _TopCardComponent extends PositionComponent
    with HasGameRef<UnoGameEntrypoint> {
  UnoCard? _card;

  _NoCardComponent? _noCardComponent;
  PositionComponent? _cardComponent;

  StreamSubscription? _streamSubscription;

  _TopCardComponent({UnoCard? card}) {
    _card = card;
  }

  set card(UnoCard? card) {
    _card = card;
    if (_noCardComponent != null &&
        contains(_noCardComponent!) &&
        card != null) {
      remove(_noCardComponent!);
    }
    if (_cardComponent != null) {
      remove(_cardComponent!);
    }
    if (_card == null) {
      if (_cardComponent != null && !contains(_noCardComponent!)) {
        add(_noCardComponent!);
      }
    } else {
      _cardComponent = SingleCardComponent(card,
          position: Vector2(size.x - size.y / cardHeightWidthRatio, 0),
          size: Vector2(size.y / cardHeightWidthRatio, size.y));
      add(_cardComponent!);
    }
  }

  @override
  Future<void>? onLoad() {
    final realWidth = size.y / cardHeightWidthRatio;

    _noCardComponent = _NoCardComponent(
        position: Vector2(size.x - realWidth, 0),
        size: Vector2(realWidth, size.y));
    if (_card != null) {
      _cardComponent = SingleCardComponent(_card,
          position: Vector2(size.x - realWidth, 0),
          size: Vector2(realWidth, size.y));
      add(_cardComponent!);
    } else {
      add(_noCardComponent!);
    }

    _streamSubscription = gameRef.unoRepo.playerStateStream.listen((event) {
      card = event.lastPlayedCard;
    });

    if (gameRef.unoRepo.lastPlayerState != null) {
      card = gameRef.unoRepo.lastPlayerState!.lastPlayedCard;
    }

    return super.onLoad();
  }

  @override
  void onRemove() {
    _streamSubscription?.cancel();
    super.onRemove();
  }
}

class _NoCardComponent extends PositionComponent {
  _NoCardComponent({Vector2? position, Vector2? size})
      : super(position: position, size: size);

  @override
  Future<void>? onLoad() {
    add(TextBoxComponent(
      boxConfig: TextBoxConfig(maxWidth: size.x),
      text: 'No card placed',
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y / 2),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    ));
    return super.onLoad();
  }
}
