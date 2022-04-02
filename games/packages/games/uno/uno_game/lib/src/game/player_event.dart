import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uno_game/src/models/uno_card.dart';
import 'package:game_base/game_base.dart';

part 'player_event.freezed.dart';
part 'player_event.g.dart';

@freezed
class UnoPlayerEvent extends Serializable with _$UnoPlayerEvent {
  factory UnoPlayerEvent.drawCard() = UnoPlayerDrawCardEvent;
  factory UnoPlayerEvent.playCard(UnoCard card) = UnoPlayerPlayCardEvent;
  factory UnoPlayerEvent.selectColor(UnoCardColor color) = UnoPlayerSelectColorEvent;
  factory UnoPlayerEvent.flagUno() = UnoPlayerFlagUnoEvent;
  factory UnoPlayerEvent.skip() = UnoPlayerSkipEvent;

  factory UnoPlayerEvent.start() = UnoPlayerStartEvent;
  // factory UnoPlayerEvent.voteRematch() = UnoPlayerVoteRematchEvent;
  factory UnoPlayerEvent.syncRequest() = UnoPlayerSyncRequestEvent;

  factory UnoPlayerEvent.fromJson(Map<String, dynamic> json) =>
      _$UnoPlayerEventFromJson(json);
}
