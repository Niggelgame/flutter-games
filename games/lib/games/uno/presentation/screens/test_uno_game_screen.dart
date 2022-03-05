import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

class TestUnoGameScreenPage extends StatelessWidget {
  const TestUnoGameScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: UnoGameEntrypoint());
  }
}