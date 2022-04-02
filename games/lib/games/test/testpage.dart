import 'package:flutter/material.dart';
import 'package:game_base/game_base.dart';
import 'package:games/games/test/test_game.dart';
import 'package:local_sessions/local_sessions.dart';
import 'package:webrtc_sessions/webrtc_sessions.dart';

class TestServerPage extends StatefulWidget {
  const TestServerPage({Key? key}) : super(key: key);

  @override
  _TestServerPageState createState() => _TestServerPageState();
}

class _TestServerPageState extends State<TestServerPage> {
  GameClient<TestGameEvent, TestGameEvent>? client;

  GameServer<TestGameEvent, TestGameEvent>? server;

  String gameCode = '';
  String lastReceivedEventId = '';

  void _startGameStuff() async {
    server = GameServer(TestGame(), (server) {
      return NetworkSessionHandler(server: server, apiConfig: defaultConfig, playerGameEventFromJson: TestGameEvent.fromJson);
    });
    await server!.sessionHandler.init(onSessionCode: (sessionCode) {
      setState(() {
        gameCode = sessionCode;
      });
    });
   

    final localClient = GameClientLocal<TestGameEvent, TestGameEvent>(name: 'idiot', isAdmin: true);
    server!.sessionHandler.insertSession(localClient.sessionHandler);
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

  GameClient<TestGameEvent, TestGameEvent>? client;
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
                      GameClientNetwork<TestGameEvent, TestGameEvent>(
                          apiConfig: defaultConfig,
                          externalSessionCode: sessionCodeController.text,
                          gameName: TestGame.gameName,
                          name: 'user',
                          serverEventFromJson: TestGameEvent.fromJson);

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
