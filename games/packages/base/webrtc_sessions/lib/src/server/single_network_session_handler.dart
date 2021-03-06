import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:game_base/game_base.dart';
import 'package:webrtc_sessions/src/common/network_packet.dart';
import 'package:webrtc_sessions/src/signaling/api_client.dart';
import 'package:webrtc_sessions/src/signaling/websocket_packet.dart';
import 'package:webrtc_sessions/src/util/network_helper.dart';

class SingleNetworkSessionHandler<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    extends SingleSessionHandler<PlayerGameEvent, ServerGameEvent> {
  final ApiClient _apiClient;
  Map<String, dynamic> _iceServers;
  final VoidCallback channelConnected;
  final ValueChanged<SessionCandidate> onCandidate;
  final ValueChanged<OfferAnswerPacket> onOffer;

  @override
  final String name;

  @override
  final bool isAdmin;

  final PlayerGameEvent Function(Map<String, dynamic>) playerGameEventFromMap;

  late final StreamController<PlayerGameEvent> _eventController;

  late Session session;

  String get sdpSemantics =>
      WebRTC.platformIsWindows ? 'plan-b' : 'unified-plan';

  SingleNetworkSessionHandler(
    String selfId,
    String peerId,
    this._apiClient,
    this._iceServers, {
    required this.channelConnected,
    required this.playerGameEventFromMap,
    required this.onCandidate,
    required this.onOffer,
    required this.name,
    required this.isAdmin,
  }) {
    _eventController = StreamController<PlayerGameEvent>.broadcast();
    _createSession(peerId);
  }

  _createSession(String peerId) async {
    // Has to be initialized first play to initialize `late` variable
    session = Session(pid: peerId);

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

    RTCPeerConnection pc = await createPeerConnection({
      ..._iceServers,
      ...{'sdpSemantics': sdpSemantics}
    }, peerConfig);

    // Add cached ice candidates
    if (session.remoteCandidates.isNotEmpty) {
      for (var candidate in session.remoteCandidates) {
        pc.addCandidate(candidate);
      }
      session.remoteCandidates.clear();
    }

    pc.onIceCandidate = (candidate) async {
      // This delay is needed to allow enough time to try an ICE candidate
      // before skipping to the next one. 1 second is just an heuristic value
      // and should be thoroughly tested in your own environment.

      await Future.delayed(const Duration(seconds: 1));
      onCandidate(SessionCandidate(
          candidate.sdpMLineIndex, candidate.sdpMid, candidate.candidate));
    };

    pc.onIceConnectionState = (state) {};

    pc.onDataChannel = (channel) {
      print('onDataChannel (server)');
      _addDataChannel(session, channel);
    };

    // We do not use any streams
    // pc.onRemoveStream = (stream) {
    //   print('Stream removed $stream');
    // };

    session.pc = pc;

    pc.onConnectionState = (state) {
      print('Connection state: $state');
    };

    pc.onSignalingState = (state) {
      print('Signaling state: $state');
    };

    // Peer Connection was first created, so we create a fitting channel
    RTCDataChannelInit dataChannelDict = RTCDataChannelInit()
      ..maxRetransmits = 30;
    RTCDataChannel channel =
        await session.pc!.createDataChannel('data', dataChannelDict);
    _addDataChannel(session, channel);

    await _createOffer();
  }

  Future<void> _createOffer() async {
    RTCSessionDescription s = await session.pc!.createOffer(dcConstraints);
    await session.pc!.setLocalDescription(s);

    onOffer(OfferAnswerPacket(s.sdp, s.type));
  }

  void _addDataChannel(Session session, RTCDataChannel channel) {
    channel.onDataChannelState = (e) {};
    channel.onMessage = (RTCDataChannelMessage data) {
      _onDataChannelMessage(session, channel, data);
    };
    session.dc = channel;

    // Notify session handler about new channel connection
    channelConnected();
  }

  _onDataChannelMessage(
      Session session, RTCDataChannel channel, RTCDataChannelMessage data) {
    if (data.isBinary) {
      print("Warning: Binary data received over RTCDataChannel");
    } else {
      final packet = NetworkPacket.fromJson(jsonDecode(data.text));

      switch (packet.op) {
        case NetworkOperator.close:
          {
            session.pc?.close();
            break;
          }
        case NetworkOperator.event:
          {
            final event = playerGameEventFromMap(packet.data);
            _eventController.add(event);
            break;
          }
      }
    }
  }

  // Add Ice candidates received via WebSocket
  addIceCandidate(SessionCandidate candidate) {
    final iceCandidate = RTCIceCandidate(
        candidate.candidate, candidate.sdpMid, candidate.sdpMLineIndex);
    if (session.pc == null) {
      session.remoteCandidates.add(iceCandidate);
      return;
    }
    session.pc!.addCandidate(iceCandidate);
  }

  setRemoteDescription(OfferAnswerPacket packet) {
    session.pc!
        .setRemoteDescription(RTCSessionDescription(packet.sdp, packet.type));
  }

  @override
  dispose() {
    _eventController.close();
  }

  @override
  closeSession({String? reason}) {
    session.dc?.send(RTCDataChannelMessage(jsonEncode(NetworkPacket(
            op: NetworkOperator.close, data: CloseData(reason).toJson())
        .toJson())));
    session.pc?.close();

    dispose();
  }

  @override
  Stream<PlayerGameEvent> get playerGameEventStream => _eventController.stream;

  @override
  Future<void> send(Serializable event) async {
    session.dc?.send(RTCDataChannelMessage(jsonEncode(
        NetworkPacket(op: NetworkOperator.event, data: event.toJson())
            .toJson())));
  }

  @override
  String get sessionId => session.pid;
}
