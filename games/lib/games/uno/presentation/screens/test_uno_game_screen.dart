import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:games/games/uno/presentation/flame/overlays/color_selection_overlay.dart';
import 'package:games/games/uno/presentation/flame/overlays/finished_overlay.dart';
import 'package:games/games/uno/presentation/flame/overlays/initial_overlay.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const initialOverlayIdentifier = 'InitialOverlay';
const finishOverlayIdentifier = 'FinishOverlay';
const colorSelectorOverlayIdentifier = 'ColorSelectorOverlay';
const colorSelectingOverlayIdentifier = 'ColorSelectingOverlay';

class TestUnoGameScreen extends StatelessWidget {
  const TestUnoGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TestUnoGameScreenPage();
  }
}

class _TestUnoGameScreenPage extends StatelessWidget {
  const _TestUnoGameScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<UnoRepository>();
    final game = UnoGameEntrypoint(repo);

    return GameWidget<UnoGameEntrypoint>(
      game: game,
      overlayBuilderMap: {
        initialOverlayIdentifier: (context, game) => InitialOverlay(
              playerStateStream: repo.playerStateStream,
              gameCodeStream: repo.gameCodeStream,
              start: repo.isAdmin ? repo.start : null,
              initialPlayerState: repo.lastPlayerState,
              initialGameCode: repo.lastGameCode,
            ),
        finishOverlayIdentifier: (context, game) => const FinishedOverlay(),
        colorSelectorOverlayIdentifier: (context, game) => ColorSelectionOverlay(onColorSelected: repo.selectColor),
        colorSelectingOverlayIdentifier: (context, game) => const ColorSelectingOverlay(),
      },
      errorBuilder: (context, error) {
        return Text(error.toString());
      },
    );
  }
}
