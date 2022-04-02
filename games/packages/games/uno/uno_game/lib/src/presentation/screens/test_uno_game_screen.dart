import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uno_game/src/presentation/bloc/repository/uno_repository.dart';
import 'package:uno_game/src/presentation/flame/overlays/color_selection_overlay.dart';
import 'package:uno_game/src/presentation/flame/overlays/finished_overlay.dart';
import 'package:uno_game/src/presentation/flame/overlays/initial_overlay.dart';
import 'package:uno_game/src/presentation/flame/uno_game_entrypoint.dart';

const initialOverlayIdentifier = 'InitialOverlay';
const finishOverlayIdentifier = 'FinishOverlay';
const colorSelectorOverlayIdentifier = 'ColorSelectorOverlay';
const colorSelectingOverlayIdentifier = 'ColorSelectingOverlay';

class TestUnoGameScreen extends StatelessWidget {
  const TestUnoGameScreen({Key? key}) : super(key: key);

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
