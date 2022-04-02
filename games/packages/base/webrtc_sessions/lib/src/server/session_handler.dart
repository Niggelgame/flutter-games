import 'package:game_base/game_base.dart';
import 'package:webrtc_sessions/src/config.dart';
import 'package:webrtc_sessions/src/server/single_network_session_handler.dart';
import 'package:webrtc_sessions/src/signaling/api_client.dart';
import 'package:webrtc_sessions/src/signaling/signaler_socket.dart';
import 'package:webrtc_sessions/src/signaling/websocket_packet.dart';
import 'package:webrtc_sessions/src/util/network_helper.dart';
import 'package:webrtc_sessions/src/util/token_generator.dart';

class NetworkSessionHandler<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends SessionHandler<PlayerGameEvent, ServerGameEvent> {
  final GameServer<PlayerGameEvent, ServerGameEvent> server;
  final WebrtcApiConfig _apiConfig;

  late SignalerSocket socket;

  final Map<String, SingleSessionHandler<PlayerGameEvent, ServerGameEvent>>
      _sessions = {};
  // Random String
  String _selfId = getRandomString(10);

  int sessionCounter = 100;

  String? _gameCode;

  NetworkSessionHandler(
      {required this.server,
      required WebrtcApiConfig apiConfig,
      required this.playerGameEventFromJson})
      : _apiConfig = apiConfig;

  final PlayerGameEvent Function(Map<String, dynamic>) playerGameEventFromJson;

  @override
  Future<void> init({required Function(String) onSessionCode}) async {
    // Load ice servers

    print('Initializing server with sessionId: $_selfId');

    socket = SignalerSocket(
        isServer: true,
        config: _apiConfig,
        type: server.game.name,
        selfId: _selfId,
        name: 'Host',
        onInvite: (invite) {
          _createNewNetworkSession(invite.peerId, invite.name);
        },
        onInit: (init) {
          _gameCode = init.sessionCode;
          onSessionCode(init.sessionCode);
        },
        onCandidate: (candidate) {
          final singleSessionHandler = _sessions[candidate.from];
          if (singleSessionHandler == null) {
            print('Received unused candidate from ${candidate.from}');
            return;
          }
          if (singleSessionHandler is SingleNetworkSessionHandler) {
            final networkSessionhandler =
                singleSessionHandler as SingleNetworkSessionHandler;
            networkSessionhandler
                .addIceCandidate(candidate.parsedData!.candidate);
          }
        },
        onByebye: (bye) {
          if (bye.peerLeftId == _selfId) {
            print('Own leave via Bye');
          } else {
            print('${bye.peerLeftId} left via Bye');
            final leavingPlayerSession = _sessions[bye.peerLeftId];

            if (leavingPlayerSession != null) {
              server.onLeave(leavingPlayerSession);
              leavingPlayerSession.closeSession(reason: bye.reason);
              _sessions.remove(bye.peerLeftId);
            }
          }
        },
        onError: (error) {
          if (error.reason == 'id-already-exists') {
            _selfId = getRandomString(10);
            socket.close();
            init(onSessionCode: onSessionCode);
          } else {
            print('Signaler Error: ${error.reason}');
          }
        },
        onAnswer: (answer) {
          // Seemingly does not need this!

          final singleSessionHandler = _sessions[answer.from];
          if (singleSessionHandler == null) {
            print('Received unused answer from ${answer.from}');
            return;
          }
          if (singleSessionHandler is SingleNetworkSessionHandler<
              PlayerGameEvent, ServerGameEvent>) {
            singleSessionHandler.setRemoteDescription(answer.parsedData!);
          } else {
            print('');
          }
        },
        onOffer: (offer) {
          print(
              'Server received connection offer - no action define by Game Protocol');
        },
        gameConfig: server.game.configAsJson,
        onClosed: () {
          print('Signaler closed');
          // Auto closes Session Handler
          server.close();
        });
  }

  @override
  void kickPlayer(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> playerSession,
      {String? reason}) {
    final session = _sessions[playerSession.sessionId];
    session?.closeSession(reason: reason);
    _sessions.remove(playerSession.sessionId);
  }

  @override
  void insertSession(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> sessionHandler) {
    _sessions[sessionHandler.sessionId] = sessionHandler;
    server.onJoin(sessionHandler);
  }

  void close() {
    _sessions.forEach((key, value) {
      value.closeSession();
    });
    _sessions.clear();
    socket.close();
  }

  void _createNewNetworkSession(String peerId, String peerName) {
    // TODO: get real ice servers
    final session =
        SingleNetworkSessionHandler<PlayerGameEvent, ServerGameEvent>(
      _selfId,
      peerId,
      ApiClient(config: _apiConfig),
      defaultIceServer,
      channelConnected: () {},
      playerGameEventFromMap: playerGameEventFromJson,
      onCandidate: (value) {
        socket.send(
          ToWebsocketPacket(
                  ToWebsocketPacketType.candidate,
                  PassThroughPacket(
                          peerId, _selfId, CandidatePacket(value).toJson())
                      .toJson())
              .toJson(),
        );
      },
      onOffer: (offer) {
        socket.send(
          ToWebsocketPacket(ToWebsocketPacketType.offer,
                  PassThroughPacket(peerId, _selfId, offer.toJson()).toJson())
              .toJson(),
        );
      },
      name: peerName,
      isAdmin: false,
    );

    sessionCounter++;

    insertSession(session);
  }

  @override
  String? get lastGameCode => _gameCode;
}
