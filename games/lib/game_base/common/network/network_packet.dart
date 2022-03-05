
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games/game_base/helper/network_helper.dart';

part 'network_packet.g.dart';

@JsonSerializable()
class NetworkPacket {
  final NetworkOperator op;
  final Map<String, dynamic> data;

  NetworkPacket({required this.op, required this.data});

  factory NetworkPacket.fromJson(Map<String, dynamic> json) => _$NetworkPacketFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPacketToJson(this);
}