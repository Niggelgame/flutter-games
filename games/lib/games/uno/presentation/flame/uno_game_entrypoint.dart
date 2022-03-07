import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/layers.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:games/games/uno/game/states/games_state.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:games/games/uno/presentation/flame/components/deck.dart';
import 'package:games/games/uno/presentation/flame/components/hand.dart';
import 'package:games/games/uno/presentation/flame/components/notification.dart';
import 'package:games/games/uno/presentation/flame/components/skip_button.dart';
import 'package:games/games/uno/presentation/flame/components/uno_button.dart';
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

class UnoGameEntrypoint extends FlameBlocGame with HasTappables, HasHoverables {
  final UnoRepository unoRepo;
  StreamSubscription? _subscription;

  Sprite? backgroundSprite;
  BackgroundLayer? backgroundLayer;

  DeckComponent? deck;
  OwnHandComponent? ownHand;
  SkipButtonComponent? skipButton;
  UnoButtonComponent? unoButton;

  UnoGameEntrypoint(this.unoRepo);

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    try {
      // Overlay insertion / removal
      _subscription = unoRepo.playerStateStream.listen((event) {
        if (event.gameState == SimpleGameState.initial &&
            !overlays.isActive(initialOverlayIdentifier)) {
          overlays.add(initialOverlayIdentifier);
        } else if (event.gameState != SimpleGameState.initial &&
            overlays.isActive(initialOverlayIdentifier)) {
          overlays.remove(initialOverlayIdentifier);
        } else if (event.gameState == SimpleGameState.finished &&
            !overlays.isActive(finishOverlayIdentifier)) {
          overlays.add(finishOverlayIdentifier);
        } else if (event.gameState != SimpleGameState.finished &&
            overlays.isActive(finishOverlayIdentifier)) {
          overlays.remove(finishOverlayIdentifier);
        }

        if (event.playerRequestingColor != null &&
            event.playerRequestingColor!.isNotEmpty) {
          if (event.playerRequestingColor == unoRepo.selfId) {
            if (!overlays.isActive(colorSelectorOverlayIdentifier)) {
              overlays.add(colorSelectorOverlayIdentifier);
            }
            if(overlays.isActive(colorSelectingOverlayIdentifier)) {
              overlays.remove(colorSelectingOverlayIdentifier);
            }
          } else {
            if (!overlays.isActive(colorSelectingOverlayIdentifier)) {
              overlays.add(colorSelectingOverlayIdentifier);
            }
            if(overlays.isActive(colorSelectorOverlayIdentifier)) {
              overlays.remove(colorSelectorOverlayIdentifier);
            }
          }
        } else {
          if (overlays.isActive(colorSelectingOverlayIdentifier)) {
            overlays.remove(colorSelectingOverlayIdentifier);
          }
          if (overlays.isActive(colorSelectorOverlayIdentifier)) {
            overlays.remove(colorSelectorOverlayIdentifier);
          }
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

      ownHand = OwnHandComponent(
        position: Vector2(canvasSize.x * 0.2, canvasSize.y * 0.7),
        size: Vector2(canvasSize.x * 0.6, canvasSize.y * 0.25),
      );
      add(ownHand!);

      skipButton = SkipButtonComponent(
        position: Vector2(canvasSize.x * 0.9, canvasSize.y * 0.8),
        size: Vector2(canvasSize.x * 0.1, canvasSize.x * 0.1),
      );

      add(skipButton!);

      unoButton = UnoButtonComponent(
        position: Vector2(canvasSize.x * 0.1, canvasSize.y * 0.9),
        size: Vector2(canvasSize.x * 0.1, canvasSize.x * 0.1),
      );

      add(unoButton!);

      // Add at the end to ensure that the notifications are always visible
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
    _subscription?.cancel();
    // TODO: Send leave if not finished yet
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

    final ownHandSize = Vector2(canvasSize.x * 0.6, canvasSize.y * 0.25);
    ownHand?.position = Vector2(canvasSize.x * 0.2, canvasSize.y * 0.7);
    ownHand?.size = ownHandSize;

    skipButton?.position = Vector2(canvasSize.x * 0.9, canvasSize.y * 0.8);
    skipButton?.size = Vector2(canvasSize.x * 0.1, canvasSize.x * 0.1);

    unoButton?.position = Vector2(canvasSize.x * 0.1, canvasSize.y * 0.8);
    unoButton?.size = Vector2(canvasSize.x * 0.1, canvasSize.x * 0.1);

    super.onGameResize(canvasSize);
  }

  @override
  void render(Canvas canvas) {
    backgroundLayer?.render(canvas);
    super.render(canvas);
  }
}
