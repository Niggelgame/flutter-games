import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/layers.dart';
import 'package:flame/widgets.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:games/games/uno/game/states/games_state.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:games/games/uno/presentation/flame/components/deck.dart';
import 'package:games/games/uno/presentation/flame/components/notification.dart';
import 'package:games/games/uno/presentation/screens/test_uno_game_screen.dart';

class BackgroundLayer extends PreRenderedLayer {
  final Sprite sprite;
  final Vector2 canvasSize;

  BackgroundLayer(this.sprite, this.canvasSize);

  @override
  void drawLayer() {
    sprite.renderRect(canvas, canvasSize.toRect());
  }
}

class UnoGameEntrypoint extends FlameBlocGame with HasTappables {
  final UnoRepository unoRepo;
  late final StreamSubscription _subscription;

  Sprite? backgroundSprite;
  BackgroundLayer? backgroundLayer;

  DeckComponent? deck;

  UnoGameEntrypoint(this.unoRepo);

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    try {
      _subscription = unoRepo.playerStateStream.listen((event) {
        if(event.gameState == SimpleGameState.initial && !overlays.isActive(initialOverlayIdentifier)) {
          overlays.add(initialOverlayIdentifier);
        } else if (event.gameState != SimpleGameState.initial && overlays.isActive(initialOverlayIdentifier)) {
          overlays.remove(initialOverlayIdentifier);
        } else if (event.gameState == SimpleGameState.finished && !overlays.isActive(finishOverlayIdentifier)) {
          overlays.add(finishOverlayIdentifier);
        } else if (event.gameState != SimpleGameState.finished && overlays.isActive(finishOverlayIdentifier)) {
          overlays.remove(finishOverlayIdentifier);
        }
      });

      backgroundSprite = Sprite(await images.load('bg_game.jpg'));
      backgroundLayer = BackgroundLayer(backgroundSprite!, canvasSize);
      await images.load("uno_deck.png");

      final deckSize = Vector2(canvasSize.x * 0.3, canvasSize.y * 0.2);

      deck = DeckComponent(
        playerStateStream: unoRepo.playerStateStream,
        onDeckTap: unoRepo.drawCard,
        position: Vector2(canvasSize.x / 2 - deckSize.x / 2,
            canvasSize.y / 2 - deckSize.y / 2),
        size: deckSize,
      );

      add(deck!);
      

      add(NotificationComponent(
          messageStream: unoRepo.messageStream,
          errorMessageStream: unoRepo.errorMessageStream));

      overlays.add(initialOverlayIdentifier);

      unoRepo.requestSync();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onRemove() {
    _subscription.cancel();
    super.onRemove();
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    if (backgroundSprite != null) {
      backgroundLayer = BackgroundLayer(backgroundSprite!, canvasSize);
    }

    final deckSize = Vector2(canvasSize.x * 0.3, canvasSize.y * 0.2);
    deck?.position = Vector2(
        canvasSize.x / 2 - deckSize.x / 2, canvasSize.y / 2 - deckSize.y / 2);
    deck?.size = deckSize;

    super.onGameResize(canvasSize);
  }

  @override
  void render(Canvas canvas) {
    backgroundLayer?.render(canvas);
    super.render(canvas);
  }
}
