import 'package:flutter/widgets.dart';
import 'package:games/config/app_config.dart';
import 'package:games/game_base/common/network/signaler_socket.dart';
import 'package:games/game_base/common/network/websocket_packet.dart';
import 'package:games/game_base/helper/network_helper.dart';
import 'package:games/game_base/helper/serializable.dart';
import 'package:games/game_base/common/game.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/game_base/server/player.dart';
import 'package:games/game_base/server/sessions/single_session/network/single_network_session_handler.dart';
import 'package:games/game_base/server/sessions/single_session/single_session_handler.dart';
import 'package:games/game_base/common/token_generator.dart';

class SessionHandler<
    PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable,
    G extends Game<PlayerGameEvent, ServerGameEvent>> {
  final GameServer<PlayerGameEvent, ServerGameEvent, G> server;
  final AppConfig _appConfig;

  late SignalerSocket socket;

  final Map<String, SingleSessionHandler<PlayerGameEvent, ServerGameEvent>>
      _sessions = {};
  // Random String
  String _selfId = getRandomString(10);

  int sessionCounter = 100;

  SessionHandler(this.server, this._appConfig);

  Future<void> init({required ValueChanged<String> onSessionCode}) async {
    // Load ice servers

    print('Initializing server with sessionId: $_selfId');

    socket = SignalerSocket(
      isServer: true,
      config: _appConfig,
      type: server.game.name,
      selfId: _selfId,
      name: 'Host',
      onInvite: (invite) {
        _createNewNetworkSession(invite.peerId, invite.name);
      },
      onInit: (init) {
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
          networkSessionhandler.addIceCandidate(candidate.parsedData!.candidate);
        }
      },
      onByebye: (bye) {
        if (bye.peerLeftId == _selfId) {
          print('Own leave via Bye');
        } else {
          print('${bye.peerLeftId} left via Bye');
          final leavingPlayer =
              server.players.where((element) => element.id == bye.peerLeftId);
          if (leavingPlayer.isNotEmpty) {
            server.onLeave(leavingPlayer.first);
          }
          final closingSession = _sessions[bye.peerLeftId];
          if (closingSession != null) {
            closingSession.closeSession(reason: bye.reason);
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
        if (singleSessionHandler is SingleNetworkSessionHandler<PlayerGameEvent, ServerGameEvent>) {
          singleSessionHandler.setRemoteDescription(answer.parsedData!);
        } else {
          print('');
        }
      },
      onOffer: (offer) {
        print('Server received connection offer - no action define by Game Protocol');
      },
      gameConfig: server.game.config,
      onClosed: () {
        print('Signaler closed');
        // Auto closes Session Handler
        server.close();
      }
    );
  }

  kickPlayer(Player p, [String? reason]) {
    final session = _sessions[p.id];
    session?.closeSession(reason: reason);
    _sessions.remove(p.id);
  }

  addSession(SingleSessionHandler<PlayerGameEvent, ServerGameEvent> session, String peerName, bool isAdmin) {
    _sessions[session.sessionId] = session;
    final p = Player<PlayerGameEvent, ServerGameEvent, G>(session, server, peerName, isAdmin);
    server.onJoin(p);
  }

  close() {
    _sessions.forEach((key, value) {
      value.closeSession();
    });
    _sessions.clear();
    socket.close();
  }

  _createNewNetworkSession(String peerId, String peerName) {
    // TODO: get real ice servers
    final session =
        SingleNetworkSessionHandler<PlayerGameEvent, ServerGameEvent>(
      _selfId,
      peerId,
      defaultIceServer,
      channelConnected: () {},
      playerGameEventFromMap: server.playerGameEventFromJson,
      onCandidate: (value) {
        socket.send(
          ToWebsocketPacket(ToWebsocketPacketType.candidate,
                  PassThroughPacket(peerId, _selfId, CandidatePacket(value).toJson()).toJson())
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
    );

    sessionCounter++;

    addSession(session, peerName, false);
  }
}
