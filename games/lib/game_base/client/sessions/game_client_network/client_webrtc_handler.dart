import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:games/game_base/common/network/network_packet.dart';
import 'package:games/game_base/common/network/websocket_packet.dart';
import 'package:games/game_base/helper/network_helper.dart';
import 'package:games/game_base/helper/serializable.dart';

class ClientWebRTCHandler<PlayerGameEvent extends Serializable,
    ServerGameEvent extends Serializable> {
  final ServerGameEvent Function(Map<String, dynamic>) serverGameEventFromMap;
  final Map<String, dynamic> iceServers;
  final VoidCallback channelConnected;
  final ValueChanged<SessionCandidate> onCandidate;
  final ValueChanged<OfferAnswerPacket> onAnswer;
  final ValueChanged<ServerGameEvent> onServerEvent;

  late Session session;

  String get sdpSemantics =>
      WebRTC.platformIsWindows ? 'plan-b' : 'unified-plan';

  ClientWebRTCHandler(
      {required this.serverGameEventFromMap,
      required this.iceServers,
      required this.channelConnected,
      required this.onCandidate,
      required this.onAnswer,
      required PassThroughPacket<OfferAnswerPacket> initialOfferAnswerPacket,
      required this.onServerEvent}) {
    _createSession(initialOfferAnswerPacket);
  }

  _createSession(
      PassThroughPacket<OfferAnswerPacket> initialOfferAnswerPacket) async {
    session = Session(pid: initialOfferAnswerPacket.from);

    RTCPeerConnection pc = await createPeerConnection({
      ...iceServers,
      ...{'sdpSemantics': sdpSemantics}
    }, peerConfig);

    pc.setRemoteDescription(RTCSessionDescription(
        initialOfferAnswerPacket.parsedData!.sdp,
        initialOfferAnswerPacket.parsedData!.type));

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
          candidate.sdpMlineIndex, candidate.sdpMid, candidate.candidate));
    };

    pc.onIceConnectionState = (state) {};

    pc.onDataChannel = (channel) {
      _addDataChannel(session, channel);
    };

    // We do not have any streams
    // pc.onRemoveStream = (stream) {
    //   print('Stream removed $stream');
    // };

    session.pc = pc;

    await _createAnswer();

    
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

  _createAnswer() async {
    final s = await session.pc!.createAnswer(dcConstraints);
    await session.pc!.setLocalDescription(s);
    onAnswer(OfferAnswerPacket(s.sdp, s.type));
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
            final event = serverGameEventFromMap(packet.data);
            onServerEvent(event);
            break;
          }
      }
    }
  }

  send(PlayerGameEvent event) {
    session.dc!.send(RTCDataChannelMessage(jsonEncode(
        NetworkPacket(op: NetworkOperator.event, data: event.toJson())
            .toJson())));
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
}
