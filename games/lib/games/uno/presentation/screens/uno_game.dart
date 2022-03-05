import 'package:flutter/material.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/games/uno/game/player_event.dart';
import 'package:games/games/uno/game/server_event.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/game/uno_game.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnoGameView extends StatefulWidget {
  final GameServer<UnoPlayerEvent, UnoServerEvent, UnoGame>? gameServer;
  const UnoGameView({Key? key, this.gameServer}) : super(key: key);

  @override
  _UnoGameViewState createState() => _UnoGameViewState();
}

class _UnoGameViewState extends State<UnoGameView> {
  PlayerState? playerState;
  String gameCode = '';

  @override
  void initState() {
    final unoRepo = context.read<UnoRepository>();

    unoRepo.playerStateStream.listen((playerState) {
      setState(() {
        this.playerState = playerState;
      });
    });

    unoRepo.messageStream.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(event),
        duration: const Duration(seconds: 2),
      ));
    });

    unoRepo.errorMessageStream.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(event),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    });

    if (widget.gameServer != null) {
      widget.gameServer!.addListener(() {
        gameCode = widget.gameServer!.gameCode ?? '';
        setState(() {});
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Code: $gameCode'),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Start Game',
            onPressed: () {
              context.read<UnoRepository>().start();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const Text('Other Players:'),
          if (playerState != null)
            ...playerState!.otherPlayers.map((player) {
              return Row(
                children: [
                  Text(player.playerId),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Has ${player.handLength} cards'),
                ],
              );
            }),
          const Text('Your Hand:'),
          if (playerState != null)
            ...playerState!.hand.map(
              (card) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Column(
                      children: [
                        Text('Color: ${card.color}'),
                        Text('Type: ${card.type}'),
                      ],
                    ),
                    onPressed: () {
                      context.read<UnoRepository>().playCard(card);
                    },
                  ),
                );
              },
            ),
          const Text('Card Pile:'),
          Row(
            children: [
              Text(
                  'Top card: Type: ${playerState?.lastPlayedCard?.type} Color: ${playerState?.lastPlayedCard?.color}'),
              const SizedBox(
                width: 20,
              ),
              Text('Current Color: ${playerState?.currentColor}'),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: const Text('Draw\n Card'),
                onPressed: () {
                  context.read<UnoRepository>().drawCard();
                },
              ),
            ],
          ),
          Text(
              'Your Turn: ${playerState?.playersTurnId == context.read<UnoRepository>().selfId}'),
          Text('Current direction: ${playerState?.currentDirection}'),
          const Text('Other Actions:'),
          if (playerState != null)
            if (playerState!.playerRequestingColor ==
                context.read<UnoRepository>().selfId) ...[
              const Text('Select new card color!'),
              ...UnoCardColor.values.map(
                (e) => ElevatedButton(
                  child: Text(e.toString()),
                  onPressed: () {
                    context.read<UnoRepository>().selectColor(e);
                  },
                ),
              )
            ],
          if (playerState != null)
            if (playerState!.allowSkip)
              ElevatedButton(
                child: const Text('Skip'),
                onPressed: () {
                  context.read<UnoRepository>().skip();
                },
              ),
          if (playerState != null)
            ElevatedButton(
              child: const Text('UNO!'),
              onPressed: () {
                context.read<UnoRepository>().flagUno();
              },
            ),
        ],
      ),
    );
  }
}
