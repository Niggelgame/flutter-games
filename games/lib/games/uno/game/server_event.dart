import 'package:games/game_base/helper/serializable.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:games/games/uno/models/uno_card.dart';

part 'server_event.freezed.dart';
part 'server_event.g.dart';

@freezed
class UnoServerEvent extends Serializable with _$UnoServerEvent {
  factory UnoServerEvent.syncData(PlayerState state) = UnoServerSyncDataEvent;

  // Passthrough events. These are not needed, since syncData <could> potentially be used to
  // update the state of the game. This however will ensure the client interprets the changes corrently
  factory UnoServerEvent.playerJoined(String playerId, PlayerState state) = UnoServerPlayerJoinedEvent;
  factory UnoServerEvent.playerLeft(String playerId, PlayerState state) = UnoServerPlayerLeftEvent;
  
  factory UnoServerEvent.cardsDrawn(String playerId, int amount, List<UnoCard>? cards, String? reason, PlayerState state) = UnoServerCardsDrawnEvent;
  factory UnoServerEvent.cardPlayed(String playerId, UnoCard card, PlayerState state) = UnoServerCardPlayedEvent;
  factory UnoServerEvent.playerSkipped(String playerId, PlayerState state) = UnoServerPlayerSkippedEvent;
  factory UnoServerEvent.playerUnoed(String playerId, PlayerState state) = UnoServerPlayerUnoedEvent;
  factory UnoServerEvent.playerSelectingColor(String playerId, PlayerState state) = UnoServerPlayerSelectingColorEvent;
  factory UnoServerEvent.playerSelectedColor(String playerId, UnoCardColor color, PlayerState state) = UnoServerPlayerSelectedColorEvent;

  factory UnoServerEvent.actionError(String error) = UnoServerActionErrorEvent;
  factory UnoServerEvent.simpleMessage(String message) = UnoServerSimpleMessageEvent;
  factory UnoServerEvent.end(String winnerId) = UnoServerEndEvent;

  factory UnoServerEvent.fromJson(Map<String, dynamic> json) => _$UnoServerEventFromJson(json);
}