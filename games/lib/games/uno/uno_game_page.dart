import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_base/game_base.dart';
import 'package:uno_game/uno_game.dart';
import 'package:webrtc_sessions/webrtc_sessions.dart';

class UnoHostGamePage extends StatelessWidget {
  final GameServer<UnoPlayerEvent, UnoServerEvent> gameServer;
  final GameClient<UnoPlayerEvent, UnoServerEvent> gameClient;
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

class UnoJoinGamePage extends StatefulWidget {
  final String sessionCode;
  final String? name;

  const UnoJoinGamePage({
    Key? key,
    @PathParam('id') required this.sessionCode,
    this.name,
  }) : super(key: key);

  @override
  State<UnoJoinGamePage> createState() => _UnoJoinGamePageState();
}

class _UnoJoinGamePageState extends State<UnoJoinGamePage> {
  GameClient<UnoPlayerEvent, UnoServerEvent>? gameClient;

  @override
  void initState() {
    super.initState();

    gameClient = GameClientNetwork<UnoPlayerEvent, UnoServerEvent>(
      apiConfig: defaultConfig,
      externalSessionCode: widget.sessionCode,
      gameName: UnoGame.gameName,
      name: widget.name ?? NameGenerator.generate(),
      serverEventFromJson: UnoServerEvent.fromJson,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (gameClient == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return _UnoJoinGamePage(
      gameClient: gameClient!,
    );
  }
}

class _UnoJoinGamePage extends StatelessWidget {
  final GameClient<UnoPlayerEvent, UnoServerEvent> gameClient;
  const _UnoJoinGamePage({Key? key, required this.gameClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => UnoRepository(gameClient),
      child: const TestUnoGameScreen(),
    );
  }
}
