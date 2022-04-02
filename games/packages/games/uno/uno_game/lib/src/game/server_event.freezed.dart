// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnoServerEvent _$UnoServerEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'syncData':
      return UnoServerSyncDataEvent.fromJson(json);
    case 'playerJoined':
      return UnoServerPlayerJoinedEvent.fromJson(json);
    case 'playerLeft':
      return UnoServerPlayerLeftEvent.fromJson(json);
    case 'cardsDrawn':
      return UnoServerCardsDrawnEvent.fromJson(json);
    case 'cardPlayed':
      return UnoServerCardPlayedEvent.fromJson(json);
    case 'playerSkipped':
      return UnoServerPlayerSkippedEvent.fromJson(json);
    case 'playerUnoed':
      return UnoServerPlayerUnoedEvent.fromJson(json);
    case 'playerSelectingColor':
      return UnoServerPlayerSelectingColorEvent.fromJson(json);
    case 'playerSelectedColor':
      return UnoServerPlayerSelectedColorEvent.fromJson(json);
    case 'actionError':
      return UnoServerActionErrorEvent.fromJson(json);
    case 'simpleMessage':
      return UnoServerSimpleMessageEvent.fromJson(json);
    case 'end':
      return UnoServerEndEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UnoServerEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$UnoServerEventTearOff {
  const _$UnoServerEventTearOff();

  UnoServerSyncDataEvent syncData(PlayerState state) {
    return UnoServerSyncDataEvent(
      state,
    );
  }

  UnoServerPlayerJoinedEvent playerJoined(String playerId, PlayerState state) {
    return UnoServerPlayerJoinedEvent(
      playerId,
      state,
    );
  }

  UnoServerPlayerLeftEvent playerLeft(String playerId, PlayerState state) {
    return UnoServerPlayerLeftEvent(
      playerId,
      state,
    );
  }

  UnoServerCardsDrawnEvent cardsDrawn(String playerId, int amount,
      List<UnoCard>? cards, String? reason, PlayerState state) {
    return UnoServerCardsDrawnEvent(
      playerId,
      amount,
      cards,
      reason,
      state,
    );
  }

  UnoServerCardPlayedEvent cardPlayed(
      String playerId, UnoCard card, PlayerState state) {
    return UnoServerCardPlayedEvent(
      playerId,
      card,
      state,
    );
  }

  UnoServerPlayerSkippedEvent playerSkipped(
      String playerId, PlayerState state) {
    return UnoServerPlayerSkippedEvent(
      playerId,
      state,
    );
  }

  UnoServerPlayerUnoedEvent playerUnoed(String playerId, PlayerState state) {
    return UnoServerPlayerUnoedEvent(
      playerId,
      state,
    );
  }

  UnoServerPlayerSelectingColorEvent playerSelectingColor(
      String playerId, PlayerState state) {
    return UnoServerPlayerSelectingColorEvent(
      playerId,
      state,
    );
  }

  UnoServerPlayerSelectedColorEvent playerSelectedColor(
      String playerId, UnoCardColor color, PlayerState state) {
    return UnoServerPlayerSelectedColorEvent(
      playerId,
      color,
      state,
    );
  }

  UnoServerActionErrorEvent actionError(String error) {
    return UnoServerActionErrorEvent(
      error,
    );
  }

  UnoServerSimpleMessageEvent simpleMessage(String message) {
    return UnoServerSimpleMessageEvent(
      message,
    );
  }

  UnoServerEndEvent end(String winnerId) {
    return UnoServerEndEvent(
      winnerId,
    );
  }

  UnoServerEvent fromJson(Map<String, Object?> json) {
    return UnoServerEvent.fromJson(json);
  }
}

/// @nodoc
const $UnoServerEvent = _$UnoServerEventTearOff();

/// @nodoc
mixin _$UnoServerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerEventCopyWith<$Res> {
  factory $UnoServerEventCopyWith(
          UnoServerEvent value, $Res Function(UnoServerEvent) then) =
      _$UnoServerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerEventCopyWith<$Res> {
  _$UnoServerEventCopyWithImpl(this._value, this._then);

  final UnoServerEvent _value;
  // ignore: unused_field
  final $Res Function(UnoServerEvent) _then;
}

/// @nodoc
abstract class $UnoServerSyncDataEventCopyWith<$Res> {
  factory $UnoServerSyncDataEventCopyWith(UnoServerSyncDataEvent value,
          $Res Function(UnoServerSyncDataEvent) then) =
      _$UnoServerSyncDataEventCopyWithImpl<$Res>;
  $Res call({PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerSyncDataEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerSyncDataEventCopyWith<$Res> {
  _$UnoServerSyncDataEventCopyWithImpl(UnoServerSyncDataEvent _value,
      $Res Function(UnoServerSyncDataEvent) _then)
      : super(_value, (v) => _then(v as UnoServerSyncDataEvent));

  @override
  UnoServerSyncDataEvent get _value => super._value as UnoServerSyncDataEvent;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(UnoServerSyncDataEvent(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerSyncDataEvent
    with DiagnosticableTreeMixin
    implements UnoServerSyncDataEvent {
  _$UnoServerSyncDataEvent(this.state, {String? $type})
      : $type = $type ?? 'syncData';

  factory _$UnoServerSyncDataEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerSyncDataEventFromJson(json);

  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.syncData(state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.syncData'))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerSyncDataEvent &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerSyncDataEventCopyWith<UnoServerSyncDataEvent> get copyWith =>
      _$UnoServerSyncDataEventCopyWithImpl<UnoServerSyncDataEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return syncData(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return syncData?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (syncData != null) {
      return syncData(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return syncData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return syncData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (syncData != null) {
      return syncData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerSyncDataEventToJson(this);
  }
}

abstract class UnoServerSyncDataEvent implements UnoServerEvent {
  factory UnoServerSyncDataEvent(PlayerState state) = _$UnoServerSyncDataEvent;

  factory UnoServerSyncDataEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerSyncDataEvent.fromJson;

  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerSyncDataEventCopyWith<UnoServerSyncDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerJoinedEventCopyWith<$Res> {
  factory $UnoServerPlayerJoinedEventCopyWith(UnoServerPlayerJoinedEvent value,
          $Res Function(UnoServerPlayerJoinedEvent) then) =
      _$UnoServerPlayerJoinedEventCopyWithImpl<$Res>;
  $Res call({String playerId, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerJoinedEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerJoinedEventCopyWith<$Res> {
  _$UnoServerPlayerJoinedEventCopyWithImpl(UnoServerPlayerJoinedEvent _value,
      $Res Function(UnoServerPlayerJoinedEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerJoinedEvent));

  @override
  UnoServerPlayerJoinedEvent get _value =>
      super._value as UnoServerPlayerJoinedEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerJoinedEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerJoinedEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerJoinedEvent {
  _$UnoServerPlayerJoinedEvent(this.playerId, this.state, {String? $type})
      : $type = $type ?? 'playerJoined';

  factory _$UnoServerPlayerJoinedEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerPlayerJoinedEventFromJson(json);

  @override
  final String playerId;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerJoined(playerId: $playerId, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerJoined'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerJoinedEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerJoinedEventCopyWith<UnoServerPlayerJoinedEvent>
      get copyWith =>
          _$UnoServerPlayerJoinedEventCopyWithImpl<UnoServerPlayerJoinedEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerJoined(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerJoined?.call(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerJoined != null) {
      return playerJoined(playerId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerJoined != null) {
      return playerJoined(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerJoinedEventToJson(this);
  }
}

abstract class UnoServerPlayerJoinedEvent implements UnoServerEvent {
  factory UnoServerPlayerJoinedEvent(String playerId, PlayerState state) =
      _$UnoServerPlayerJoinedEvent;

  factory UnoServerPlayerJoinedEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerPlayerJoinedEvent.fromJson;

  String get playerId;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerJoinedEventCopyWith<UnoServerPlayerJoinedEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerLeftEventCopyWith<$Res> {
  factory $UnoServerPlayerLeftEventCopyWith(UnoServerPlayerLeftEvent value,
          $Res Function(UnoServerPlayerLeftEvent) then) =
      _$UnoServerPlayerLeftEventCopyWithImpl<$Res>;
  $Res call({String playerId, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerLeftEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerLeftEventCopyWith<$Res> {
  _$UnoServerPlayerLeftEventCopyWithImpl(UnoServerPlayerLeftEvent _value,
      $Res Function(UnoServerPlayerLeftEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerLeftEvent));

  @override
  UnoServerPlayerLeftEvent get _value =>
      super._value as UnoServerPlayerLeftEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerLeftEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerLeftEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerLeftEvent {
  _$UnoServerPlayerLeftEvent(this.playerId, this.state, {String? $type})
      : $type = $type ?? 'playerLeft';

  factory _$UnoServerPlayerLeftEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerPlayerLeftEventFromJson(json);

  @override
  final String playerId;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerLeft(playerId: $playerId, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerLeft'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerLeftEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerLeftEventCopyWith<UnoServerPlayerLeftEvent> get copyWith =>
      _$UnoServerPlayerLeftEventCopyWithImpl<UnoServerPlayerLeftEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerLeft(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerLeft?.call(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerLeft != null) {
      return playerLeft(playerId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerLeft != null) {
      return playerLeft(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerLeftEventToJson(this);
  }
}

abstract class UnoServerPlayerLeftEvent implements UnoServerEvent {
  factory UnoServerPlayerLeftEvent(String playerId, PlayerState state) =
      _$UnoServerPlayerLeftEvent;

  factory UnoServerPlayerLeftEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerPlayerLeftEvent.fromJson;

  String get playerId;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerLeftEventCopyWith<UnoServerPlayerLeftEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerCardsDrawnEventCopyWith<$Res> {
  factory $UnoServerCardsDrawnEventCopyWith(UnoServerCardsDrawnEvent value,
          $Res Function(UnoServerCardsDrawnEvent) then) =
      _$UnoServerCardsDrawnEventCopyWithImpl<$Res>;
  $Res call(
      {String playerId,
      int amount,
      List<UnoCard>? cards,
      String? reason,
      PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerCardsDrawnEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerCardsDrawnEventCopyWith<$Res> {
  _$UnoServerCardsDrawnEventCopyWithImpl(UnoServerCardsDrawnEvent _value,
      $Res Function(UnoServerCardsDrawnEvent) _then)
      : super(_value, (v) => _then(v as UnoServerCardsDrawnEvent));

  @override
  UnoServerCardsDrawnEvent get _value =>
      super._value as UnoServerCardsDrawnEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? amount = freezed,
    Object? cards = freezed,
    Object? reason = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerCardsDrawnEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>?,
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerCardsDrawnEvent
    with DiagnosticableTreeMixin
    implements UnoServerCardsDrawnEvent {
  _$UnoServerCardsDrawnEvent(
      this.playerId, this.amount, this.cards, this.reason, this.state,
      {String? $type})
      : $type = $type ?? 'cardsDrawn';

  factory _$UnoServerCardsDrawnEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerCardsDrawnEventFromJson(json);

  @override
  final String playerId;
  @override
  final int amount;
  @override
  final List<UnoCard>? cards;
  @override
  final String? reason;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.cardsDrawn(playerId: $playerId, amount: $amount, cards: $cards, reason: $reason, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.cardsDrawn'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('cards', cards))
      ..add(DiagnosticsProperty('reason', reason))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerCardsDrawnEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(cards),
      const DeepCollectionEquality().hash(reason),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerCardsDrawnEventCopyWith<UnoServerCardsDrawnEvent> get copyWith =>
      _$UnoServerCardsDrawnEventCopyWithImpl<UnoServerCardsDrawnEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return cardsDrawn(playerId, amount, cards, reason, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return cardsDrawn?.call(playerId, amount, cards, reason, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (cardsDrawn != null) {
      return cardsDrawn(playerId, amount, cards, reason, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return cardsDrawn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return cardsDrawn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (cardsDrawn != null) {
      return cardsDrawn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerCardsDrawnEventToJson(this);
  }
}

abstract class UnoServerCardsDrawnEvent implements UnoServerEvent {
  factory UnoServerCardsDrawnEvent(
      String playerId,
      int amount,
      List<UnoCard>? cards,
      String? reason,
      PlayerState state) = _$UnoServerCardsDrawnEvent;

  factory UnoServerCardsDrawnEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerCardsDrawnEvent.fromJson;

  String get playerId;
  int get amount;
  List<UnoCard>? get cards;
  String? get reason;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerCardsDrawnEventCopyWith<UnoServerCardsDrawnEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerCardPlayedEventCopyWith<$Res> {
  factory $UnoServerCardPlayedEventCopyWith(UnoServerCardPlayedEvent value,
          $Res Function(UnoServerCardPlayedEvent) then) =
      _$UnoServerCardPlayedEventCopyWithImpl<$Res>;
  $Res call({String playerId, UnoCard card, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerCardPlayedEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerCardPlayedEventCopyWith<$Res> {
  _$UnoServerCardPlayedEventCopyWithImpl(UnoServerCardPlayedEvent _value,
      $Res Function(UnoServerCardPlayedEvent) _then)
      : super(_value, (v) => _then(v as UnoServerCardPlayedEvent));

  @override
  UnoServerCardPlayedEvent get _value =>
      super._value as UnoServerCardPlayedEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? card = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerCardPlayedEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as UnoCard,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerCardPlayedEvent
    with DiagnosticableTreeMixin
    implements UnoServerCardPlayedEvent {
  _$UnoServerCardPlayedEvent(this.playerId, this.card, this.state,
      {String? $type})
      : $type = $type ?? 'cardPlayed';

  factory _$UnoServerCardPlayedEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerCardPlayedEventFromJson(json);

  @override
  final String playerId;
  @override
  final UnoCard card;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.cardPlayed(playerId: $playerId, card: $card, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.cardPlayed'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('card', card))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerCardPlayedEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.card, card) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(card),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerCardPlayedEventCopyWith<UnoServerCardPlayedEvent> get copyWith =>
      _$UnoServerCardPlayedEventCopyWithImpl<UnoServerCardPlayedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return cardPlayed(playerId, card, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return cardPlayed?.call(playerId, card, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (cardPlayed != null) {
      return cardPlayed(playerId, card, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return cardPlayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return cardPlayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (cardPlayed != null) {
      return cardPlayed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerCardPlayedEventToJson(this);
  }
}

abstract class UnoServerCardPlayedEvent implements UnoServerEvent {
  factory UnoServerCardPlayedEvent(
          String playerId, UnoCard card, PlayerState state) =
      _$UnoServerCardPlayedEvent;

  factory UnoServerCardPlayedEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerCardPlayedEvent.fromJson;

  String get playerId;
  UnoCard get card;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerCardPlayedEventCopyWith<UnoServerCardPlayedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerSkippedEventCopyWith<$Res> {
  factory $UnoServerPlayerSkippedEventCopyWith(
          UnoServerPlayerSkippedEvent value,
          $Res Function(UnoServerPlayerSkippedEvent) then) =
      _$UnoServerPlayerSkippedEventCopyWithImpl<$Res>;
  $Res call({String playerId, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerSkippedEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerSkippedEventCopyWith<$Res> {
  _$UnoServerPlayerSkippedEventCopyWithImpl(UnoServerPlayerSkippedEvent _value,
      $Res Function(UnoServerPlayerSkippedEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerSkippedEvent));

  @override
  UnoServerPlayerSkippedEvent get _value =>
      super._value as UnoServerPlayerSkippedEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerSkippedEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerSkippedEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerSkippedEvent {
  _$UnoServerPlayerSkippedEvent(this.playerId, this.state, {String? $type})
      : $type = $type ?? 'playerSkipped';

  factory _$UnoServerPlayerSkippedEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerPlayerSkippedEventFromJson(json);

  @override
  final String playerId;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerSkipped(playerId: $playerId, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerSkipped'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerSkippedEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerSkippedEventCopyWith<UnoServerPlayerSkippedEvent>
      get copyWith => _$UnoServerPlayerSkippedEventCopyWithImpl<
          UnoServerPlayerSkippedEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerSkipped(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerSkipped?.call(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerSkipped != null) {
      return playerSkipped(playerId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerSkipped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerSkipped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerSkipped != null) {
      return playerSkipped(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerSkippedEventToJson(this);
  }
}

abstract class UnoServerPlayerSkippedEvent implements UnoServerEvent {
  factory UnoServerPlayerSkippedEvent(String playerId, PlayerState state) =
      _$UnoServerPlayerSkippedEvent;

  factory UnoServerPlayerSkippedEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerPlayerSkippedEvent.fromJson;

  String get playerId;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerSkippedEventCopyWith<UnoServerPlayerSkippedEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerUnoedEventCopyWith<$Res> {
  factory $UnoServerPlayerUnoedEventCopyWith(UnoServerPlayerUnoedEvent value,
          $Res Function(UnoServerPlayerUnoedEvent) then) =
      _$UnoServerPlayerUnoedEventCopyWithImpl<$Res>;
  $Res call({String playerId, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerUnoedEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerUnoedEventCopyWith<$Res> {
  _$UnoServerPlayerUnoedEventCopyWithImpl(UnoServerPlayerUnoedEvent _value,
      $Res Function(UnoServerPlayerUnoedEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerUnoedEvent));

  @override
  UnoServerPlayerUnoedEvent get _value =>
      super._value as UnoServerPlayerUnoedEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerUnoedEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerUnoedEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerUnoedEvent {
  _$UnoServerPlayerUnoedEvent(this.playerId, this.state, {String? $type})
      : $type = $type ?? 'playerUnoed';

  factory _$UnoServerPlayerUnoedEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerPlayerUnoedEventFromJson(json);

  @override
  final String playerId;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerUnoed(playerId: $playerId, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerUnoed'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerUnoedEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerUnoedEventCopyWith<UnoServerPlayerUnoedEvent> get copyWith =>
      _$UnoServerPlayerUnoedEventCopyWithImpl<UnoServerPlayerUnoedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerUnoed(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerUnoed?.call(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerUnoed != null) {
      return playerUnoed(playerId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerUnoed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerUnoed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerUnoed != null) {
      return playerUnoed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerUnoedEventToJson(this);
  }
}

abstract class UnoServerPlayerUnoedEvent implements UnoServerEvent {
  factory UnoServerPlayerUnoedEvent(String playerId, PlayerState state) =
      _$UnoServerPlayerUnoedEvent;

  factory UnoServerPlayerUnoedEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerPlayerUnoedEvent.fromJson;

  String get playerId;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerUnoedEventCopyWith<UnoServerPlayerUnoedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerSelectingColorEventCopyWith<$Res> {
  factory $UnoServerPlayerSelectingColorEventCopyWith(
          UnoServerPlayerSelectingColorEvent value,
          $Res Function(UnoServerPlayerSelectingColorEvent) then) =
      _$UnoServerPlayerSelectingColorEventCopyWithImpl<$Res>;
  $Res call({String playerId, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerSelectingColorEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerSelectingColorEventCopyWith<$Res> {
  _$UnoServerPlayerSelectingColorEventCopyWithImpl(
      UnoServerPlayerSelectingColorEvent _value,
      $Res Function(UnoServerPlayerSelectingColorEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerSelectingColorEvent));

  @override
  UnoServerPlayerSelectingColorEvent get _value =>
      super._value as UnoServerPlayerSelectingColorEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerSelectingColorEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerSelectingColorEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerSelectingColorEvent {
  _$UnoServerPlayerSelectingColorEvent(this.playerId, this.state,
      {String? $type})
      : $type = $type ?? 'playerSelectingColor';

  factory _$UnoServerPlayerSelectingColorEvent.fromJson(
          Map<String, dynamic> json) =>
      _$$UnoServerPlayerSelectingColorEventFromJson(json);

  @override
  final String playerId;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerSelectingColor(playerId: $playerId, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerSelectingColor'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerSelectingColorEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerSelectingColorEventCopyWith<
          UnoServerPlayerSelectingColorEvent>
      get copyWith => _$UnoServerPlayerSelectingColorEventCopyWithImpl<
          UnoServerPlayerSelectingColorEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerSelectingColor(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerSelectingColor?.call(playerId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerSelectingColor != null) {
      return playerSelectingColor(playerId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerSelectingColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerSelectingColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerSelectingColor != null) {
      return playerSelectingColor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerSelectingColorEventToJson(this);
  }
}

abstract class UnoServerPlayerSelectingColorEvent implements UnoServerEvent {
  factory UnoServerPlayerSelectingColorEvent(
          String playerId, PlayerState state) =
      _$UnoServerPlayerSelectingColorEvent;

  factory UnoServerPlayerSelectingColorEvent.fromJson(
          Map<String, dynamic> json) =
      _$UnoServerPlayerSelectingColorEvent.fromJson;

  String get playerId;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerSelectingColorEventCopyWith<
          UnoServerPlayerSelectingColorEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerPlayerSelectedColorEventCopyWith<$Res> {
  factory $UnoServerPlayerSelectedColorEventCopyWith(
          UnoServerPlayerSelectedColorEvent value,
          $Res Function(UnoServerPlayerSelectedColorEvent) then) =
      _$UnoServerPlayerSelectedColorEventCopyWithImpl<$Res>;
  $Res call({String playerId, UnoCardColor color, PlayerState state});

  $PlayerStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UnoServerPlayerSelectedColorEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerPlayerSelectedColorEventCopyWith<$Res> {
  _$UnoServerPlayerSelectedColorEventCopyWithImpl(
      UnoServerPlayerSelectedColorEvent _value,
      $Res Function(UnoServerPlayerSelectedColorEvent) _then)
      : super(_value, (v) => _then(v as UnoServerPlayerSelectedColorEvent));

  @override
  UnoServerPlayerSelectedColorEvent get _value =>
      super._value as UnoServerPlayerSelectedColorEvent;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? color = freezed,
    Object? state = freezed,
  }) {
    return _then(UnoServerPlayerSelectedColorEvent(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }

  @override
  $PlayerStateCopyWith<$Res> get state {
    return $PlayerStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerPlayerSelectedColorEvent
    with DiagnosticableTreeMixin
    implements UnoServerPlayerSelectedColorEvent {
  _$UnoServerPlayerSelectedColorEvent(this.playerId, this.color, this.state,
      {String? $type})
      : $type = $type ?? 'playerSelectedColor';

  factory _$UnoServerPlayerSelectedColorEvent.fromJson(
          Map<String, dynamic> json) =>
      _$$UnoServerPlayerSelectedColorEventFromJson(json);

  @override
  final String playerId;
  @override
  final UnoCardColor color;
  @override
  final PlayerState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.playerSelectedColor(playerId: $playerId, color: $color, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.playerSelectedColor'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerPlayerSelectedColorEvent &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $UnoServerPlayerSelectedColorEventCopyWith<UnoServerPlayerSelectedColorEvent>
      get copyWith => _$UnoServerPlayerSelectedColorEventCopyWithImpl<
          UnoServerPlayerSelectedColorEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return playerSelectedColor(playerId, color, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return playerSelectedColor?.call(playerId, color, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (playerSelectedColor != null) {
      return playerSelectedColor(playerId, color, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return playerSelectedColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return playerSelectedColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (playerSelectedColor != null) {
      return playerSelectedColor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerPlayerSelectedColorEventToJson(this);
  }
}

abstract class UnoServerPlayerSelectedColorEvent implements UnoServerEvent {
  factory UnoServerPlayerSelectedColorEvent(
          String playerId, UnoCardColor color, PlayerState state) =
      _$UnoServerPlayerSelectedColorEvent;

  factory UnoServerPlayerSelectedColorEvent.fromJson(
      Map<String, dynamic> json) = _$UnoServerPlayerSelectedColorEvent.fromJson;

  String get playerId;
  UnoCardColor get color;
  PlayerState get state;
  @JsonKey(ignore: true)
  $UnoServerPlayerSelectedColorEventCopyWith<UnoServerPlayerSelectedColorEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerActionErrorEventCopyWith<$Res> {
  factory $UnoServerActionErrorEventCopyWith(UnoServerActionErrorEvent value,
          $Res Function(UnoServerActionErrorEvent) then) =
      _$UnoServerActionErrorEventCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$UnoServerActionErrorEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerActionErrorEventCopyWith<$Res> {
  _$UnoServerActionErrorEventCopyWithImpl(UnoServerActionErrorEvent _value,
      $Res Function(UnoServerActionErrorEvent) _then)
      : super(_value, (v) => _then(v as UnoServerActionErrorEvent));

  @override
  UnoServerActionErrorEvent get _value =>
      super._value as UnoServerActionErrorEvent;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(UnoServerActionErrorEvent(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerActionErrorEvent
    with DiagnosticableTreeMixin
    implements UnoServerActionErrorEvent {
  _$UnoServerActionErrorEvent(this.error, {String? $type})
      : $type = $type ?? 'actionError';

  factory _$UnoServerActionErrorEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerActionErrorEventFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.actionError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.actionError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerActionErrorEvent &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $UnoServerActionErrorEventCopyWith<UnoServerActionErrorEvent> get copyWith =>
      _$UnoServerActionErrorEventCopyWithImpl<UnoServerActionErrorEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return actionError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return actionError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (actionError != null) {
      return actionError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return actionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return actionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (actionError != null) {
      return actionError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerActionErrorEventToJson(this);
  }
}

abstract class UnoServerActionErrorEvent implements UnoServerEvent {
  factory UnoServerActionErrorEvent(String error) = _$UnoServerActionErrorEvent;

  factory UnoServerActionErrorEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerActionErrorEvent.fromJson;

  String get error;
  @JsonKey(ignore: true)
  $UnoServerActionErrorEventCopyWith<UnoServerActionErrorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerSimpleMessageEventCopyWith<$Res> {
  factory $UnoServerSimpleMessageEventCopyWith(
          UnoServerSimpleMessageEvent value,
          $Res Function(UnoServerSimpleMessageEvent) then) =
      _$UnoServerSimpleMessageEventCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$UnoServerSimpleMessageEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerSimpleMessageEventCopyWith<$Res> {
  _$UnoServerSimpleMessageEventCopyWithImpl(UnoServerSimpleMessageEvent _value,
      $Res Function(UnoServerSimpleMessageEvent) _then)
      : super(_value, (v) => _then(v as UnoServerSimpleMessageEvent));

  @override
  UnoServerSimpleMessageEvent get _value =>
      super._value as UnoServerSimpleMessageEvent;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(UnoServerSimpleMessageEvent(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerSimpleMessageEvent
    with DiagnosticableTreeMixin
    implements UnoServerSimpleMessageEvent {
  _$UnoServerSimpleMessageEvent(this.message, {String? $type})
      : $type = $type ?? 'simpleMessage';

  factory _$UnoServerSimpleMessageEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerSimpleMessageEventFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.simpleMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.simpleMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerSimpleMessageEvent &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $UnoServerSimpleMessageEventCopyWith<UnoServerSimpleMessageEvent>
      get copyWith => _$UnoServerSimpleMessageEventCopyWithImpl<
          UnoServerSimpleMessageEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return simpleMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return simpleMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (simpleMessage != null) {
      return simpleMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return simpleMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return simpleMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (simpleMessage != null) {
      return simpleMessage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerSimpleMessageEventToJson(this);
  }
}

abstract class UnoServerSimpleMessageEvent implements UnoServerEvent {
  factory UnoServerSimpleMessageEvent(String message) =
      _$UnoServerSimpleMessageEvent;

  factory UnoServerSimpleMessageEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerSimpleMessageEvent.fromJson;

  String get message;
  @JsonKey(ignore: true)
  $UnoServerSimpleMessageEventCopyWith<UnoServerSimpleMessageEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoServerEndEventCopyWith<$Res> {
  factory $UnoServerEndEventCopyWith(
          UnoServerEndEvent value, $Res Function(UnoServerEndEvent) then) =
      _$UnoServerEndEventCopyWithImpl<$Res>;
  $Res call({String winnerId});
}

/// @nodoc
class _$UnoServerEndEventCopyWithImpl<$Res>
    extends _$UnoServerEventCopyWithImpl<$Res>
    implements $UnoServerEndEventCopyWith<$Res> {
  _$UnoServerEndEventCopyWithImpl(
      UnoServerEndEvent _value, $Res Function(UnoServerEndEvent) _then)
      : super(_value, (v) => _then(v as UnoServerEndEvent));

  @override
  UnoServerEndEvent get _value => super._value as UnoServerEndEvent;

  @override
  $Res call({
    Object? winnerId = freezed,
  }) {
    return _then(UnoServerEndEvent(
      winnerId == freezed
          ? _value.winnerId
          : winnerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoServerEndEvent
    with DiagnosticableTreeMixin
    implements UnoServerEndEvent {
  _$UnoServerEndEvent(this.winnerId, {String? $type}) : $type = $type ?? 'end';

  factory _$UnoServerEndEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoServerEndEventFromJson(json);

  @override
  final String winnerId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoServerEvent.end(winnerId: $winnerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoServerEvent.end'))
      ..add(DiagnosticsProperty('winnerId', winnerId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoServerEndEvent &&
            const DeepCollectionEquality().equals(other.winnerId, winnerId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(winnerId));

  @JsonKey(ignore: true)
  @override
  $UnoServerEndEventCopyWith<UnoServerEndEvent> get copyWith =>
      _$UnoServerEndEventCopyWithImpl<UnoServerEndEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlayerState state) syncData,
    required TResult Function(String playerId, PlayerState state) playerJoined,
    required TResult Function(String playerId, PlayerState state) playerLeft,
    required TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)
        cardsDrawn,
    required TResult Function(String playerId, UnoCard card, PlayerState state)
        cardPlayed,
    required TResult Function(String playerId, PlayerState state) playerSkipped,
    required TResult Function(String playerId, PlayerState state) playerUnoed,
    required TResult Function(String playerId, PlayerState state)
        playerSelectingColor,
    required TResult Function(
            String playerId, UnoCardColor color, PlayerState state)
        playerSelectedColor,
    required TResult Function(String error) actionError,
    required TResult Function(String message) simpleMessage,
    required TResult Function(String winnerId) end,
  }) {
    return end(winnerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
  }) {
    return end?.call(winnerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlayerState state)? syncData,
    TResult Function(String playerId, PlayerState state)? playerJoined,
    TResult Function(String playerId, PlayerState state)? playerLeft,
    TResult Function(String playerId, int amount, List<UnoCard>? cards,
            String? reason, PlayerState state)?
        cardsDrawn,
    TResult Function(String playerId, UnoCard card, PlayerState state)?
        cardPlayed,
    TResult Function(String playerId, PlayerState state)? playerSkipped,
    TResult Function(String playerId, PlayerState state)? playerUnoed,
    TResult Function(String playerId, PlayerState state)? playerSelectingColor,
    TResult Function(String playerId, UnoCardColor color, PlayerState state)?
        playerSelectedColor,
    TResult Function(String error)? actionError,
    TResult Function(String message)? simpleMessage,
    TResult Function(String winnerId)? end,
    required TResult orElse(),
  }) {
    if (end != null) {
      return end(winnerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoServerSyncDataEvent value) syncData,
    required TResult Function(UnoServerPlayerJoinedEvent value) playerJoined,
    required TResult Function(UnoServerPlayerLeftEvent value) playerLeft,
    required TResult Function(UnoServerCardsDrawnEvent value) cardsDrawn,
    required TResult Function(UnoServerCardPlayedEvent value) cardPlayed,
    required TResult Function(UnoServerPlayerSkippedEvent value) playerSkipped,
    required TResult Function(UnoServerPlayerUnoedEvent value) playerUnoed,
    required TResult Function(UnoServerPlayerSelectingColorEvent value)
        playerSelectingColor,
    required TResult Function(UnoServerPlayerSelectedColorEvent value)
        playerSelectedColor,
    required TResult Function(UnoServerActionErrorEvent value) actionError,
    required TResult Function(UnoServerSimpleMessageEvent value) simpleMessage,
    required TResult Function(UnoServerEndEvent value) end,
  }) {
    return end(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
  }) {
    return end?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoServerSyncDataEvent value)? syncData,
    TResult Function(UnoServerPlayerJoinedEvent value)? playerJoined,
    TResult Function(UnoServerPlayerLeftEvent value)? playerLeft,
    TResult Function(UnoServerCardsDrawnEvent value)? cardsDrawn,
    TResult Function(UnoServerCardPlayedEvent value)? cardPlayed,
    TResult Function(UnoServerPlayerSkippedEvent value)? playerSkipped,
    TResult Function(UnoServerPlayerUnoedEvent value)? playerUnoed,
    TResult Function(UnoServerPlayerSelectingColorEvent value)?
        playerSelectingColor,
    TResult Function(UnoServerPlayerSelectedColorEvent value)?
        playerSelectedColor,
    TResult Function(UnoServerActionErrorEvent value)? actionError,
    TResult Function(UnoServerSimpleMessageEvent value)? simpleMessage,
    TResult Function(UnoServerEndEvent value)? end,
    required TResult orElse(),
  }) {
    if (end != null) {
      return end(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoServerEndEventToJson(this);
  }
}

abstract class UnoServerEndEvent implements UnoServerEvent {
  factory UnoServerEndEvent(String winnerId) = _$UnoServerEndEvent;

  factory UnoServerEndEvent.fromJson(Map<String, dynamic> json) =
      _$UnoServerEndEvent.fromJson;

  String get winnerId;
  @JsonKey(ignore: true)
  $UnoServerEndEventCopyWith<UnoServerEndEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
