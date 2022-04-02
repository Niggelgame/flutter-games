import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:uno_game/src/presentation/flame/uno_game_entrypoint.dart';

class UnoButtonComponent extends PositionComponent
    with Tappable, Hoverable, HasGameRef<UnoGameEntrypoint> {


  CircleComponent? _circle;
  TextBoxComponent? _text;

  UnoButtonComponent({Vector2? position, Vector2? size})
      : super(position: position, size: size, anchor: Anchor.center);

  @override
  Future<void>? onLoad() {
    _circle = CircleComponent(
      radius: size.y / 2,
      position: Vector2(0, 0),
      paint: Paint()..color = Colors.green,
    );

    _text = TextBoxComponent(
      text: 'UNO',
      // close to center text
      position: Vector2((size.x - /* textWidth */ 80) / 2, size.y / 2 - 24),
      boxConfig: TextBoxConfig(maxWidth: size.x),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      priority: 5,
    );


    add(_circle!);
    add(_text!);
    // add(ScaleEffect.by(
    //   Vector2(1.1, 1.1),
    //   EffectController(
    //     duration: 0.5,
    //     curve: Curves.fastOutSlowIn,
    //     infinite: true,
    //   ),
    // ));

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    _circle?.position = Vector2(0, 0);
    _text?.position = Vector2((size.x - /* textWidth */ 80) / 2, size.y / 2 - 24);
    super.onGameResize(gameSize);
  }

  @override
  bool onTapDown(info) {
    gameRef.unoRepo.flagUno();
    return false;
  }
}
