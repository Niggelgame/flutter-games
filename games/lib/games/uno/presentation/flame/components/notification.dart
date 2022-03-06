import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

class NotificationComponent extends PositionComponent with HasGameRef<UnoGameEntrypoint> {
  final Stream<String> messageStream;
  final Stream<String> errorMessageStream;

  StreamSubscription<String>? _messageSubscription;
  StreamSubscription<String>? _errorMessageSubscription;

  NotificationComponent({
    required this.messageStream,
    required this.errorMessageStream,
  });

  @override
  Future<void>? onLoad() {
    _messageSubscription = messageStream.listen(_onMessage);
    _errorMessageSubscription = errorMessageStream.listen(_onErrorMessage);
    return super.onLoad();
  }

  @override
  void onRemove() {
    _messageSubscription?.cancel();
    _errorMessageSubscription?.cancel();
    super.onRemove();
  }

  void _onMessage(String text) {
    _addTextComponent(text, Colors.green);
  }

  void _onErrorMessage(String text) {
    _addTextComponent(text, Colors.red);
  }

  void _addTextComponent(String text, Color c) {
    add(TextBoxComponent(
      boxConfig: TextBoxConfig(maxWidth: gameRef.size.x / 3 * 2),
      text: text,
      anchor: Anchor.center,
      position: Vector2(gameRef.size.x / 2, gameRef.size.y - (gameRef.size.y / 10)),
      textRenderer: TextPaint(
        style: TextStyle(
          color: c,
          fontSize: 25,
        ),
      ),
    )
       ..add(
         MoveEffect.by(
           Vector2(0, -20),
           EffectController(
             duration: 3,
             infinite: false,
             curve: Curves.easeOut,
           ),
         ),
       )
      // ..add(
      //   OpacityEffect.fadeOut(
      //     CurvedEffectController(3, Curves.bounceIn),
      //   ),
      // )
       ..add(
         RemoveEffect(
           delay: 3,
         ),
       )
      );
  }
}
