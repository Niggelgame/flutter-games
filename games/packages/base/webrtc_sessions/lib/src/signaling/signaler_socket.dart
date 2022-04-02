import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:webrtc_sessions/src/config.dart';
import 'package:webrtc_sessions/src/signaling/websocket_packet.dart';

class SignalerSocket {
  late final WebSocketChannel channel;

  final ValueChanged<InvitePacket> onInvite;
  final ValueChanged<InitPacket> onInit;
  final ValueChanged<PassThroughPacket<CandidatePacket>> onCandidate;
  final ValueChanged<ByebyePacket> onByebye;
  final ValueChanged<ErrorPacket> onError;
  final ValueChanged<PassThroughPacket<OfferAnswerPacket>> onAnswer;
  final ValueChanged<PassThroughPacket<OfferAnswerPacket>> onOffer;
  final VoidCallback onClosed;

  Timer? _keepAliveTimer;

  SignalerSocket({
    required WebrtcApiConfig config,
    required String selfId,
    required String name,
    required bool isServer,
    required String type,
    required Map<String, dynamic> gameConfig,
    required this.onInvite,
    required this.onInit,
    required this.onCandidate,
    required this.onByebye,
    required this.onError,
    required this.onAnswer,
    required this.onOffer,
    required this.onClosed,
  }) {
    channel = WebSocketChannel.connect(
      Uri(
        scheme: config.secureTraffic ? 'wss' : 'ws',
        host: config.apiHost,
        port: config.apiPort,
        path: '/ws',
      ),
    );

    channel.stream.listen(_onData, onDone: onClosed);

    channel.sink.add(
      jsonEncode(ToWebsocketPacket(
        ToWebsocketPacketType.hello,
        ServerHelloPacket(isServer, type, selfId, name, gameConfig).toJson(),
      ).toJson()),
    );

    _keepAliveTimer = Timer.periodic(
      const Duration(seconds: 60),
      (timer) {
        channel.sink.add(
          jsonEncode(ToWebsocketPacket(
            ToWebsocketPacketType.keepalive,
            {},
          ).toJson()),
        );
      },
    );
  }

  void _onData(dynamic event) {
    final packet = FromWebsocketPacket.fromJson(jsonDecode(event.toString()));

    print("Received packet: ${packet.type} - ${packet.data}");

    switch (packet.type) {
      case FromWebsocketPacketType.init:
        {
          final initPacket = InitPacket.fromJson(packet.data);
          onInit(initPacket);
          break;
        }
      case FromWebsocketPacketType.invite:
        {
          onInvite(InvitePacket.fromJson(packet.data));
          break;
        }
      case FromWebsocketPacketType.candidate:
        {
          final passThroughPacket =
              PassThroughPacket<CandidatePacket>.fromJson(packet.data);
          passThroughPacket.parsedData =
              CandidatePacket.fromJson(passThroughPacket.data);
          onCandidate(passThroughPacket);
          break;
        }
      case FromWebsocketPacketType.keepalive:
        break;
      case FromWebsocketPacketType.bye:
        {
          onByebye(ByebyePacket.fromJson(packet.data));
          break;
        }
      case FromWebsocketPacketType.error:
        {
          final errorPacket = ErrorPacket.fromJson(packet.data);
          onError(errorPacket);
          break;
        }
      case FromWebsocketPacketType.offer:
        final passThroughPacket = PassThroughPacket<OfferAnswerPacket>.fromJson(packet.data);
        passThroughPacket.parsedData =
            OfferAnswerPacket.fromJson(passThroughPacket.data);
        onOffer(passThroughPacket);
        break;
      case FromWebsocketPacketType.answer:
        final passThroughPacket =
            PassThroughPacket<OfferAnswerPacket>.fromJson(packet.data);
        passThroughPacket.parsedData =
            OfferAnswerPacket.fromJson(passThroughPacket.data);
        onAnswer(passThroughPacket);
        break;
    }
  }

  void close({int? closeCode, String? reason}) {
    channel.sink.close(closeCode, reason);
    _keepAliveTimer?.cancel();
  }

  void send(Map<String, dynamic> data) {
    channel.sink.add(jsonEncode(data));
  }
}
