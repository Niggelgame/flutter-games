import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/layers.dart';
import 'package:flame/widgets.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:games/games/uno/presentation/flame/components/notification.dart';

class BackgroundLayer extends PreRenderedLayer {
  final Sprite sprite;
  final Vector2 canvasSize;

  BackgroundLayer(this.sprite, this.canvasSize);

  @override
  void drawLayer() {
    sprite.renderRect(canvas, canvasSize.toRect());
  }
}

class UnoGameEntrypoint extends FlameBlocGame {
  Sprite? backgroundSprite;
  late BackgroundLayer backgroundLayer;

  @override
  Future<void>? onLoad() async {
    backgroundSprite = Sprite(await images.load('bg_game.jpg'));
    backgroundLayer = BackgroundLayer(backgroundSprite!, canvasSize);
    await images.load("uno_deck.png");

    final unoRepo = read<UnoRepository>();
    add(NotificationComponent(
        messageStream: unoRepo.messageStream,
        errorMessageStream: unoRepo.errorMessageStream));
    
    return await super.onLoad();
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    if (backgroundSprite != null) {
      backgroundLayer = BackgroundLayer(backgroundSprite!, canvasSize);
    }
    super.onGameResize(canvasSize);
  }

  @override
  void render(Canvas canvas) {
    backgroundLayer.render(canvas);
    super.render(canvas);
  }
}
