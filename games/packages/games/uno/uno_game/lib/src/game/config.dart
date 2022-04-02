
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.g.dart';

enum DrawForceStrategy {
  alwaysNext,
  allowSame,
  allowSameOrHigher,
  allowAllFitting,
}

@JsonSerializable()
class UnoGameConfig {
  final int maxPlayers;
  final DrawForceStrategy drawForceStrategy;
  final int startHandLength;
  final bool allowPlayerAfterForcedDraw;

  UnoGameConfig({required this.maxPlayers, required this.drawForceStrategy, required this.startHandLength, required this.allowPlayerAfterForcedDraw});

  factory UnoGameConfig.fromJson(Map<String, dynamic> json) => _$UnoGameConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UnoGameConfigToJson(this);
}