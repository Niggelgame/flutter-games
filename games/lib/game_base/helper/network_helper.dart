import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_helper.g.dart';

const defaultIceServer = {
  'iceServers': [
    {'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
        ],},
    /*
       * turn server configuration example.
      {
        'url': 'turn:123.45.67.89:3478',
        'username': 'change_to_real_user',
        'credential': 'change_to_real_secret'
      },
      */
  ]
};

final Map<String, dynamic> peerConfig = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ]
  };

  final Map<String, dynamic> dcConstraints = {
    'mandatory': {
      'OfferToReceiveAudio': false,
      'OfferToReceiveVideo': false,
    },
    'optional': [],
  };

class Session {
  Session({required this.pid});
  String pid;
  RTCPeerConnection? pc;
  RTCDataChannel? dc;
  List<RTCIceCandidate> remoteCandidates = [];
}

enum NetworkOperator {
  close,
  event,
}

@JsonSerializable()
class CloseData {
  final String? reason;

  CloseData(this.reason);

  factory CloseData.fromJson(Map<String, dynamic> json) => _$CloseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CloseDataToJson(this);
}