import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_packet.g.dart';

enum FromWebsocketPacketType {
  invite,
  init,
  // PassThroughPacket
  candidate,
  keepalive,
  // PassThroughPacket
  offer,
  // PassThroughPacket
  answer,
  bye,
  error,
}

@JsonSerializable()
class FromWebsocketPacket {
  final FromWebsocketPacketType type;
  final Map<String, dynamic> data;

  FromWebsocketPacket(this.type, this.data);

  factory FromWebsocketPacket.fromJson(Map<String, dynamic> json) =>
      _$FromWebsocketPacketFromJson(json);

  Map<String, dynamic> toJson() => _$FromWebsocketPacketToJson(this);
}

enum ToWebsocketPacketType {
  hello,
  candidate,
  keepalive,
  bye,
  offer,
  answer,
}

@JsonSerializable()
class ToWebsocketPacket {
  final ToWebsocketPacketType type;
  final Map<String, dynamic> data;

  ToWebsocketPacket(this.type, this.data);

  factory ToWebsocketPacket.fromJson(Map<String, dynamic> json) =>
      _$ToWebsocketPacketFromJson(json);

  Map<String, dynamic> toJson() => _$ToWebsocketPacketToJson(this);
}

@JsonSerializable()
class InvitePacket {
  @JsonKey(name: 'peer_id')
  final String peerId;

  InvitePacket(this.peerId);

  factory InvitePacket.fromJson(Map<String, dynamic> json) =>
      _$InvitePacketFromJson(json);

  Map<String, dynamic> toJson() => _$InvitePacketToJson(this);
}

@JsonSerializable()
class InitPacket {
  @JsonKey(name: 'session_code')
  final String sessionCode;

  InitPacket(this.sessionCode);

  factory InitPacket.fromJson(Map<String, dynamic> json) =>
      _$InitPacketFromJson(json);

  Map<String, dynamic> toJson() => _$InitPacketToJson(this);
}

@JsonSerializable()
class ServerHelloPacket {
  @JsonKey(name: 'is_server')
  final bool isServer;
  @JsonKey(name: 'type')
  final String game;
  @JsonKey(name: 'id')
  final String selfId;
  @JsonKey(name: 'game_config')
  final Map<String, dynamic> gameConfig;

  ServerHelloPacket(this.isServer, this.game, this.selfId, this.gameConfig);

  factory ServerHelloPacket.fromJson(Map<String, dynamic> json) =>
      _$ServerHelloPacketFromJson(json);

  Map<String, dynamic> toJson() => _$ServerHelloPacketToJson(this);
}


@JsonSerializable()
class SessionCandidate {
  final int? sdpMLineIndex;
  final String? sdpMid;
  final String? candidate;

  SessionCandidate(this.sdpMLineIndex, this.sdpMid, this.candidate);

  factory SessionCandidate.fromJson(Map<String, dynamic> json) => _$SessionCandidateFromJson(json);

  Map<String, dynamic> toJson() => _$SessionCandidateToJson(this);
}

@JsonSerializable()
class CandidatePacket {
  final SessionCandidate candidate;

  CandidatePacket(this.candidate);

  factory CandidatePacket.fromJson(Map<String, dynamic> json) => _$CandidatePacketFromJson(json);

  Map<String, dynamic> toJson() => _$CandidatePacketToJson(this);
}

@JsonSerializable()
class ByebyePacket {
  final String reason;

  /// peerLeftId is ID of peer who sent Byebye.
  /// If Byes are sent, leave peerLeftId blank
  @JsonKey(name: 'peer_left_id')
  final String peerLeftId;

  ByebyePacket(this.reason, this.peerLeftId);

  factory ByebyePacket.fromJson(Map<String, dynamic> json) => _$ByebyePacketFromJson(json);

  Map<String, dynamic> toJson() => _$ByebyePacketToJson(this);
}

@JsonSerializable()
class ErrorPacket  {
  final String request;
  final String reason;

  ErrorPacket(this.request, this.reason);

  factory ErrorPacket.fromJson(Map<String, dynamic> json) => _$ErrorPacketFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorPacketToJson(this);
}

@JsonSerializable()
class OfferAnswerPacket {
  final String? sdp;
  final String? type;

  OfferAnswerPacket(this.sdp, this.type);

  factory OfferAnswerPacket.fromJson(Map<String, dynamic> json) => _$OfferAnswerPacketFromJson(json);

  Map<String, dynamic> toJson() => _$OfferAnswerPacketToJson(this);
}

@JsonSerializable()
class PassThroughPacket<T> {
  final String to;
  final String from;
  final Map<String, dynamic> data;

  PassThroughPacket(this.to, this.from, this.data);

  factory PassThroughPacket.fromJson(Map<String, dynamic> json) => _$PassThroughPacketFromJson(json);

  Map<String, dynamic> toJson() => _$PassThroughPacketToJson(this);

  @JsonKey(ignore: true)
  T? parsedData;
}