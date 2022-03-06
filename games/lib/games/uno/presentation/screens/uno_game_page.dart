import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/games/uno/game/player_event.dart';
import 'package:games/games/uno/game/server_event.dart';
import 'package:games/games/uno/game/uno_game.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:games/games/uno/presentation/screens/test_uno_game_screen.dart';

class UnoHostGamePage extends StatelessWidget {
  final GameServer<UnoPlayerEvent, UnoServerEvent, UnoGame> gameServer;
  final GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient;
  const UnoHostGamePage(
      {Key? key, required this.gameServer, required this.gameClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (_) => UnoRepository(gameClient, gameServer: gameServer)),
      ],
      child: const TestUnoGameScreen(),
    );
  }
}

class UnoJoinGamePage extends StatelessWidget {
  final GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient;
  const UnoJoinGamePage(
      {Key? key,
      @PathParam('id') required String sessionCode,
      required this.gameClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => UnoRepository(gameClient),
      child: const TestUnoGameScreen(),
    );
  }
}
