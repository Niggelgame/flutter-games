import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_base/game_base.dart';
import 'package:webrtc_sessions/src/client/client_webrtc_handler.dart';
import 'package:webrtc_sessions/src/config.dart';
import 'package:webrtc_sessions/src/signaling/api_client.dart';
import 'package:webrtc_sessions/src/signaling/signaler_socket.dart';
import 'package:webrtc_sessions/src/signaling/websocket_packet.dart';
import 'package:webrtc_sessions/src/util/network_helper.dart';
import 'package:webrtc_sessions/src/util/token_generator.dart';

class GameClientNetwork<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends GameClient<PlayerGameEvent, ServerGameEvent> {
  late final StreamController<ServerGameEvent> _serverEventStreamController;
  late final ApiClient _apiClient;

  late SignalerSocket _socket;
  ClientWebRTCHandler? _webRTCHandler;

  Map<String, dynamic> _iceServers = defaultIceServer;

  final List<PlayerGameEvent> _playerEventQueue = [];

  String _selfId = getRandomString(16);

  bool _connected = false;
  late final StreamController<bool> _connectionStatusController;

  GameClientNetwork(
      {required WebrtcApiConfig apiConfig,
      required String externalSessionCode,
      required String name,
      required String gameName,
      required ServerGameEvent Function(Map<String, dynamic>)
          serverEventFromJson}) {
    _serverEventStreamController =
        StreamController<ServerGameEvent>.broadcast();
    _connectionStatusController = StreamController<bool>.broadcast();
    _apiClient = ApiClient(config: apiConfig);
    init(apiConfig, externalSessionCode, name, gameName, serverEventFromJson);
  }

  Future<void> init(
      WebrtcApiConfig appConfig,
      String externalSessionCode,
      String name,
      String gameName,
      ServerGameEvent Function(Map<String, dynamic>)
          serverEventFromJson) async {
    final sessionData = await _apiClient.getSessionData(externalSessionCode);

    try {
      final turnCredentials = await _apiClient.getTurnCredentials();
      if (turnCredentials.uris.isEmpty) {
        throw Exception('No turn credentials');
      }

      _iceServers = {
        'iceServers': [
          {
            'urls': turnCredentials.uris[0],
            'username': turnCredentials.username,
            'credential': turnCredentials.password,
            'ttl': turnCredentials.ttl,
          },
        ]
      };
    } catch (e) {
      debugPrint('Error getting turn credentials: $e');
    }

    assert(sessionData.game == gameName);

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

            init(appConfig, externalSessionCode, name, gameName,
                serverEventFromJson);
          } else {
            // TODO: update connection state
            _connected = false;
            _connectionStatusController.add(false);
            print('Signaler Error: ${error.reason}');
          }
        },
        onAnswer: (answer) {
          print('Client received answer - and does not use it');
        },
        onOffer: (offer) {
          _webRTCHandler =
              ClientWebRTCHandler<PlayerGameEvent, ServerGameEvent>(
            serverGameEventFromMap: serverEventFromJson,
            iceServers: _iceServers,
            channelConnected: () {
              _connected = true;
              _connectionStatusController.add(true);

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
                      ToWebsocketPacketType.candidate,
                      PassThroughPacket(offer.from, offer.to,
                              CandidatePacket(candidate).toJson())
                          .toJson())
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
        });
  }

  @override
  void send(PlayerGameEvent event) {
    if (_webRTCHandler != null && _webRTCHandler?.session.dc != null) {
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

  @override
  bool get connected => _connected;

  @override
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;
}
