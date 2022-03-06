import 'dart:async';

import 'package:games/config/app_config.dart';
import 'package:games/game_base/client/client_state.dart';
import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/client/sessions/game_client_network/client_webrtc_handler.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/common/network/api_client.dart';
import 'package:games/game_base/common/network/signaler_socket.dart';
import 'package:games/game_base/common/network/websocket_packet.dart';
import 'package:games/game_base/common/token_generator.dart';
import 'package:games/game_base/helper/network_helper.dart';
import 'package:games/game_base/helper/serializable.dart';

class GameClientNetwork<
        PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable,
        G extends Game<PlayerGameEvent, ServerGameEvent>>
    extends GameClient<PlayerGameEvent, ServerGameEvent, G> {
  late final StreamController<ServerGameEvent> _serverEventStreamController;
  late final ApiClient _apiClient;

  late SignalerSocket _socket;
  late Game<PlayerGameEvent, ServerGameEvent> _game;
  ClientWebRTCHandler? _webRTCHandler;

  final List<PlayerGameEvent> _playerEventQueue = [];

  String _selfId = getRandomString(16);

  GameClientNetwork(G Function(Map<String, dynamic> config) gameFactory,
      AppConfig appConfig, String externalSessionCode, String name)
      : super(gameFactory) {
    _serverEventStreamController =
        StreamController<ServerGameEvent>.broadcast();
    _apiClient = ApiClient(config: appConfig);
    init(appConfig, externalSessionCode, name);
  }

  Future<void> init(AppConfig appConfig, String externalSessionCode, String name) async {
    final sessionData = await _apiClient.getSessionData(externalSessionCode);
    _game = gameFactory(sessionData.gameConfig);

    assert(sessionData.game == _game.name);

    print('Initializing client with sessionId: $_selfId');

    _socket = SignalerSocket(
      config: appConfig,
      selfId: _selfId,
      name: name,
      isServer: false,
      type: sessionData.token,
      // Since we aren't the server, we don't need to send any game configs to the server
      gameConfig: {},
      onInvite: (invite) {
        print(
            'Client received InvitePacket for ${invite.peerId} - but Client doesn\'t support invites');
      },
      onInit: (init) {
        print(
            'Client received InitPacket with sessionCode: ${init.sessionCode} - but Client should NOT receive an InitPacket');
      },
      onCandidate: (candidate) {
        if (_webRTCHandler != null) {
          _webRTCHandler!.addIceCandidate(candidate.parsedData!.candidate);
        }
      },
      onByebye: (bye) {
        print('Server left the WS session. Will be closed for us now.');
      },
      onError: (error) {
        if (error.reason == 'id-already-exists') {
          _selfId = getRandomString(10);
          _socket.close();
          notifyListeners();

          init(appConfig, externalSessionCode, name);
        } else {
          print('Signaler Error: ${error.reason}');
        }
      },
      onAnswer: (answer) {
        print('Client received answer - and does not use it');
      },
      onOffer: (offer) {
        _webRTCHandler = ClientWebRTCHandler<PlayerGameEvent, ServerGameEvent>(
          serverGameEventFromMap: _game.serverGameEventFromJson,
          iceServers: defaultIceServer,
          channelConnected: () {
            state = ClientState.lobby;
            for (var queueEvent in _playerEventQueue) {
              send(queueEvent);
            }
          },
          onAnswer: (answer) {
            _socket.send(ToWebsocketPacket(
                    ToWebsocketPacketType.answer,
                    PassThroughPacket(offer.from, offer.to, answer.toJson())
                        .toJson())
                .toJson());
          },
          onCandidate: (candidate) {
            _socket.send(ToWebsocketPacket(
                    ToWebsocketPacketType.candidate, PassThroughPacket(offer.from, offer.to, CandidatePacket(candidate).toJson()).toJson())
                .toJson());
          },
          initialOfferAnswerPacket: offer,
          onServerEvent: (ServerGameEvent value) {
            _serverEventStreamController.add(value);
          },
        );
      },
      onClosed: () {
        close();
      }
    );
  }

  @override
  void send(PlayerGameEvent event) {
    if(_webRTCHandler != null) {
      _webRTCHandler!.send(event);
    } else {
      _playerEventQueue.add(event);
    }
  }

  @override
  Stream<ServerGameEvent> get eventStream =>
      _serverEventStreamController.stream;

  @override
  void close() {
    _serverEventStreamController.close();
    _socket.send(ToWebsocketPacket(
            ToWebsocketPacketType.bye, ByebyePacket('close', '').toJson())
        .toJson());
  }

  @override
  String get selfId => _selfId;
}
