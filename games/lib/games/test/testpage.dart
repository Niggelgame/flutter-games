import 'package:flutter/material.dart';
import 'package:games/config/app_config.dart';
import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/client/sessions/game_client_local.dart';
import 'package:games/game_base/client/sessions/game_client_network/game_client_network.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/games/test/test_game.dart';

class TestServerPage extends StatefulWidget {
  const TestServerPage({Key? key}) : super(key: key);

  @override
  _TestServerPageState createState() => _TestServerPageState();
}

class _TestServerPageState extends State<TestServerPage> {
  GameClient<TestGameEvent, TestGameEvent, TestGame>? client;

  GameServer<TestGameEvent, TestGameEvent, TestGame>? server;

  String gameCode = '';
  String lastReceivedEventId = '';

  void _startGameStuff() {
    server = GameServer(TestGame(), defaultConfig);
    server!.addListener(() {
      setState(() {
        gameCode = server!.gameCode ?? '';
      });
    });

    final localClient = GameClientLocal<TestGameEvent, TestGameEvent, TestGame>(
        (_) => TestGame());
    server!.sessionHandler.addSession(localClient.sessionHandler, 'Host', true);
    client = localClient;
    client!.eventStream.listen((event) {
      setState(() {
        lastReceivedEventId = event.id.toString();
      });
    });
  }

  @override
  void dispose() {
    client?.close();
    server?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                _startGameStuff();
              },
            ),
            ElevatedButton(
              child: const Text('Send random event'),
              onPressed: () {
                client?.send(TestGameEvent(5));
              },
            ),
            Text('GameCode: $gameCode'),
            Text('Last received event id: $lastReceivedEventId'),
          ],
        ),
      ),
    );
  }
}

class TestNetworkClientPage extends StatefulWidget {
  const TestNetworkClientPage({Key? key}) : super(key: key);

  @override
  _TestNetworkClientPageState createState() => _TestNetworkClientPageState();
}

class _TestNetworkClientPageState extends State<TestNetworkClientPage> {
  late final TextEditingController sessionCodeController;

  GameClient<TestGameEvent, TestGameEvent, TestGame>? client;
  String lastReceivedEventId = '';

  @override
  void initState() {
    sessionCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: sessionCodeController,
              decoration: const InputDecoration(
                labelText: 'Session code',
              ),
            ),
            ElevatedButton(
              child: const Text('Join'),
              onPressed: () {
                try {
                  client =
                      GameClientNetwork<TestGameEvent, TestGameEvent, TestGame>(
                          (_) => TestGame(),
                          defaultConfig,
                          sessionCodeController.text, 'user');

                  client!.eventStream.listen((event) {
                    setState(() {
                      lastReceivedEventId = event.id.toString();
                    });
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
            ElevatedButton(
              child: const Text('Send random event'),
              onPressed: () {
                client!.send(TestGameEvent(10));
              },
            ),
            Text('Last received event id: $lastReceivedEventId'),
          ],
        ),
      ),
    );
  }
}
