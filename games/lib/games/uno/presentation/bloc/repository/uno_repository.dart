import 'dart:async';

import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/games/uno/game/player_event.dart';
import 'package:games/games/uno/game/server_event.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/game/uno_game.dart';
import 'package:games/games/uno/models/uno_card.dart';

class UnoRepository {
  final GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> _gameClient;

  late final StreamController<PlayerState> _playerStateController;
  late final StreamController<String> _errorMessageController;
  late final StreamController<String> _messageController;

  late final StreamController<String> _gameCodeController;
  String? _lastGameCode;
  String? get lastGameCode => _lastGameCode;

  PlayerState? _lastPlayerState;

  PlayerState? get lastPlayerState => _lastPlayerState;

  String _selfId = '';

  String get selfId => _selfId;

  UnoRepository(this._gameClient,
      {GameServer<UnoPlayerEvent, UnoServerEvent, UnoGame>? gameServer}) {
    _gameCodeController = StreamController<String>.broadcast();
    if (gameServer != null) {
      if(gameServer.gameCode != null) {
        _lastGameCode = gameServer.gameCode;
        _gameCodeController.add(_lastGameCode!);
      }
      gameServer.addListener(() {
        if (gameServer.gameCode != null) {
          _lastGameCode = gameServer.gameCode;
          _gameCodeController.add(gameServer.gameCode!);
        }
      });
    }

    _selfId = _gameClient.selfId;

    _playerStateController = StreamController<PlayerState>.broadcast();
    _errorMessageController = StreamController<String>.broadcast();
    _messageController = StreamController<String>.broadcast();

    _gameClient.eventStream.listen((event) {
      if (event is UnoServerSyncDataEvent) {
        _handleSyncData(event.state);
      } else if (event is UnoServerActionErrorEvent) {
        _handleActionError(event);
      } else if (event is UnoServerSimpleMessageEvent) {
        _handleSimpleMessage(event);
      } else if (event is UnoServerEndEvent) {
        _handleEnd(event);
      } else if (event is UnoServerCardPlayedEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      } else if (event is UnoServerCardsDrawnEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      } else if (event is UnoServerPlayerSelectingColorEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
        _messageController.add('Player ${event.playerId} is selecting color');
      } else if (event is UnoServerPlayerSelectedColorEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
        _messageController
            .add('Player ${event.playerId} selected color ${event.color}');
      } else if (event is UnoServerPlayerUnoedEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      } else if (event is UnoServerPlayerSkippedEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      } else if (event is UnoServerPlayerJoinedEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      } else if (event is UnoServerPlayerLeftEvent) {
        // TODO: Handle correctly
        _handleSyncData(event.state);
      }
    });

    _gameClient.addListener(() {
      _selfId = _gameClient.selfId;
    });
  }

  Stream<PlayerState> get playerStateStream => _playerStateController.stream;
  Stream<String> get errorMessageStream => _errorMessageController.stream;
  Stream<String> get messageStream => _messageController.stream;

  Stream<String> get gameCodeStream => _gameCodeController.stream;

  _handleSyncData(PlayerState syncData) {
    final oldState = _lastPlayerState;
    _lastPlayerState = syncData;
    if (oldState != _lastPlayerState) {
      _playerStateController.add(_lastPlayerState!);
    }
  }

  _handleActionError(UnoServerActionErrorEvent event) {
    _errorMessageController.add(event.error);
  }

  _handleSimpleMessage(UnoServerSimpleMessageEvent event) {
    _errorMessageController.add(event.message);
  }

  _handleEnd(UnoServerEndEvent event) {
    _messageController.add('${event.winnerId} won the game!');
  }

  drawCard() {
    _gameClient.send(UnoPlayerEvent.drawCard());
  }

  playCard(UnoCard card) {
    _gameClient.send(UnoPlayerEvent.playCard(card));
  }

  selectColor(UnoCardColor color) {
    _gameClient.send(UnoPlayerEvent.selectColor(color));
  }

  flagUno() {
    _gameClient.send(UnoPlayerEvent.flagUno());
  }

  skip() {
    _gameClient.send(UnoPlayerEvent.skip());
  }

  start() {
    print('Sending start');
    _gameClient.send(UnoPlayerEvent.start());
  }

  requestSync() {
    _gameClient.send(UnoPlayerEvent.syncRequest());
  }
}
