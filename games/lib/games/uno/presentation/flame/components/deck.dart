import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/components/single_card.dart';

class DeckComponent extends PositionComponent {
  final Stream<PlayerState> playerStateStream;
  final PlayerState? initialPlayerState;
  final VoidCallback onDeckTap;

  late final StreamSubscription<PlayerState> _streamSubscription;

  UnoCard? topCard;

  _DrawDeckComponent? _drawDeckComponent;

  DeckComponent(
      {required this.playerStateStream,
      this.initialPlayerState,
      required this.onDeckTap,
      required Vector2 position,
      required Vector2 size})
      : super(position: position, size: size);

  @override
  // TODO: implement debugMode
  bool get debugMode => true;

  @override
  Future<void>? onLoad() {
    _streamSubscription = playerStateStream.listen((event) {
      topCard = event.lastPlayedCard;
    });

    final deckWidth = size.x / 2.5;
    _drawDeckComponent = _DrawDeckComponent(onDeckTap)
      ..size = Vector2(deckWidth, size.y);

    add(_drawDeckComponent!);

    return super.onLoad();
  }

  @override
  set size(Vector2 size) {
    _drawDeckComponent?.size = Vector2(size.x / 2.5, size.y);
    super.size = size;
  }

  @override
  void onRemove() {
    _streamSubscription.cancel();
    super.onRemove();
  }
}

class _DrawDeckComponent extends PositionComponent with Tappable, HasGameRef {
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
  // TODO: implement debugMode
  bool get debugMode => false;

  @override
  Future<void>? onLoad() {
    for (int i = 0; i < 3; i++) {
      final comp = SingleCardComponent(null, position: Vector2(10.0 * i, 0));
      stack.add(comp);

      add(comp
        ..anchor = Anchor.bottomLeft
        ..angle = 0.03 * pi * i
        ..scale = Vector2((size.y / 400), (size.y / 400)));
    }

    return super.onLoad();
  }

  @override
  set size(Vector2 size) {
    for (final e in stack) {
      e.scale = Vector2((size.y / 400), (size.y / 400));
    }
    super.size = size;
  }
}
