import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_base/game_base.dart';
import 'package:games/games/uno/uno_game_page.dart';
import 'package:games/routing/app_router.dart';
import 'package:local_sessions/local_sessions.dart';
import 'package:uno_game/uno_game.dart';
import 'package:webrtc_sessions/webrtc_sessions.dart';

class UnoHomePage extends StatefulWidget {
  const UnoHomePage({Key? key}) : super(key: key);

  @override
  _UnoHomePageState createState() => _UnoHomePageState();
}

class _UnoHomePageState extends State<UnoHomePage> {
  bool host = false;

  late final TextEditingController _sessionCodeInputController;
  late final TextEditingController _nameInputController;

  @override
  void initState() {
    _sessionCodeInputController = TextEditingController();
    _nameInputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Join'),
                      onPressed: () {
                        setState(() {
                          host = false;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => host ? Colors.grey : Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Host'),
                      onPressed: () {
                        setState(() {
                          host = true;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => host ? Colors.blue : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (host) ...[
                const SizedBox(height: 80),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _nameInputController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Start Game'),
                  onPressed: () {
                    final game = UnoGame(gameConfig: UnoGameConfig(maxPlayers: 4, drawForceStrategy: DrawForceStrategy.allowAllFitting, startHandLength: 7, allowPlayerAfterForcedDraw: false));
                    
                    final gameServer = GameServer<UnoPlayerEvent, UnoServerEvent>(game, (server) {
                      return NetworkSessionHandler(server: server, apiConfig: defaultConfig, playerGameEventFromJson: UnoPlayerEvent.fromJson);
                    });

                    final usedName = _nameInputController.text.isEmpty ? NameGenerator.generate() : _nameInputController.text;
                    final gameClient = GameClientLocal<UnoPlayerEvent, UnoServerEvent>(name: usedName, isAdmin: true);

                    gameServer.sessionHandler.insertSession(gameClient.sessionHandler);
                    context.router.pushWidget(UnoHostGamePage(gameServer: gameServer, gameClient: gameClient));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => host ? Colors.blue : Colors.grey),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _sessionCodeInputController,
                    decoration: const InputDecoration(
                      labelText: 'Session Code',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _nameInputController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Join Game'),
                  onPressed: () {
                    final usedName = _nameInputController.text.isEmpty ? NameGenerator.generate() : _nameInputController.text;
                    context.router.push(UnoJoinGameRoute(
                      sessionCode: _sessionCodeInputController.text,
                      name: usedName,
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => host ? Colors.grey : Colors.blue),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
