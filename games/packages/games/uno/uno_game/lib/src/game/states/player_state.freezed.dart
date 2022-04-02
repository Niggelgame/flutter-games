// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerState _$PlayerStateFromJson(Map<String, dynamic> json) {
  return _PlayerState.fromJson(json);
}

/// @nodoc
class _$PlayerStateTearOff {
  const _$PlayerStateTearOff();

  _PlayerState call(
      SimpleGameState gameState,
      String playersTurnId,
      String name,
      List<UnoCard> hand,
      List<OtherPlayerState> otherPlayers,
      UnoCard? lastPlayedCard,
      String? playerRequestingColor,
      UnoCardColor currentColor,
      Direction currentDirection,
      bool allowSkip) {
    return _PlayerState(
      gameState,
      playersTurnId,
      name,
      hand,
      otherPlayers,
      lastPlayedCard,
      playerRequestingColor,
      currentColor,
      currentDirection,
      allowSkip,
    );
  }

  PlayerState fromJson(Map<String, Object?> json) {
    return PlayerState.fromJson(json);
  }
}

/// @nodoc
const $PlayerState = _$PlayerStateTearOff();

/// @nodoc
mixin _$PlayerState {
  SimpleGameState get gameState => throw _privateConstructorUsedError;
  String get playersTurnId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<UnoCard> get hand => throw _privateConstructorUsedError;
  List<OtherPlayerState> get otherPlayers => throw _privateConstructorUsedError;
  UnoCard? get lastPlayedCard => throw _privateConstructorUsedError;
  String? get playerRequestingColor => throw _privateConstructorUsedError;
  UnoCardColor get currentColor => throw _privateConstructorUsedError;
  Direction get currentDirection => throw _privateConstructorUsedError;
  bool get allowSkip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res>;
  $Res call(
      {SimpleGameState gameState,
      String playersTurnId,
      String name,
      List<UnoCard> hand,
      List<OtherPlayerState> otherPlayers,
      UnoCard? lastPlayedCard,
      String? playerRequestingColor,
      UnoCardColor currentColor,
      Direction currentDirection,
      bool allowSkip});
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res> implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  final PlayerState _value;
  // ignore: unused_field
  final $Res Function(PlayerState) _then;

  @override
  $Res call({
    Object? gameState = freezed,
    Object? playersTurnId = freezed,
    Object? name = freezed,
    Object? hand = freezed,
    Object? otherPlayers = freezed,
    Object? lastPlayedCard = freezed,
    Object? playerRequestingColor = freezed,
    Object? currentColor = freezed,
    Object? currentDirection = freezed,
    Object? allowSkip = freezed,
  }) {
    return _then(_value.copyWith(
      gameState: gameState == freezed
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as SimpleGameState,
      playersTurnId: playersTurnId == freezed
          ? _value.playersTurnId
          : playersTurnId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hand: hand == freezed
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      otherPlayers: otherPlayers == freezed
          ? _value.otherPlayers
          : otherPlayers // ignore: cast_nullable_to_non_nullable
              as List<OtherPlayerState>,
      lastPlayedCard: lastPlayedCard == freezed
          ? _value.lastPlayedCard
          : lastPlayedCard // ignore: cast_nullable_to_non_nullable
              as UnoCard?,
      playerRequestingColor: playerRequestingColor == freezed
          ? _value.playerRequestingColor
          : playerRequestingColor // ignore: cast_nullable_to_non_nullable
              as String?,
      currentColor: currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
      currentDirection: currentDirection == freezed
          ? _value.currentDirection
          : currentDirection // ignore: cast_nullable_to_non_nullable
              as Direction,
      allowSkip: allowSkip == freezed
          ? _value.allowSkip
          : allowSkip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(
          _PlayerState value, $Res Function(_PlayerState) then) =
      __$PlayerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SimpleGameState gameState,
      String playersTurnId,
      String name,
      List<UnoCard> hand,
      List<OtherPlayerState> otherPlayers,
      UnoCard? lastPlayedCard,
      String? playerRequestingColor,
      UnoCardColor currentColor,
      Direction currentDirection,
      bool allowSkip});
}

/// @nodoc
class __$PlayerStateCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(
      _PlayerState _value, $Res Function(_PlayerState) _then)
      : super(_value, (v) => _then(v as _PlayerState));

  @override
  _PlayerState get _value => super._value as _PlayerState;

  @override
  $Res call({
    Object? gameState = freezed,
    Object? playersTurnId = freezed,
    Object? name = freezed,
    Object? hand = freezed,
    Object? otherPlayers = freezed,
    Object? lastPlayedCard = freezed,
    Object? playerRequestingColor = freezed,
    Object? currentColor = freezed,
    Object? currentDirection = freezed,
    Object? allowSkip = freezed,
  }) {
    return _then(_PlayerState(
      gameState == freezed
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as SimpleGameState,
      playersTurnId == freezed
          ? _value.playersTurnId
          : playersTurnId // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hand == freezed
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      otherPlayers == freezed
          ? _value.otherPlayers
          : otherPlayers // ignore: cast_nullable_to_non_nullable
              as List<OtherPlayerState>,
      lastPlayedCard == freezed
          ? _value.lastPlayedCard
          : lastPlayedCard // ignore: cast_nullable_to_non_nullable
              as UnoCard?,
      playerRequestingColor == freezed
          ? _value.playerRequestingColor
          : playerRequestingColor // ignore: cast_nullable_to_non_nullable
              as String?,
      currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
      currentDirection == freezed
          ? _value.currentDirection
          : currentDirection // ignore: cast_nullable_to_non_nullable
              as Direction,
      allowSkip == freezed
          ? _value.allowSkip
          : allowSkip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerState with DiagnosticableTreeMixin implements _PlayerState {
  _$_PlayerState(
      this.gameState,
      this.playersTurnId,
      this.name,
      this.hand,
      this.otherPlayers,
      this.lastPlayedCard,
      this.playerRequestingColor,
      this.currentColor,
      this.currentDirection,
      this.allowSkip);

  factory _$_PlayerState.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerStateFromJson(json);

  @override
  final SimpleGameState gameState;
  @override
  final String playersTurnId;
  @override
  final String name;
  @override
  final List<UnoCard> hand;
  @override
  final List<OtherPlayerState> otherPlayers;
  @override
  final UnoCard? lastPlayedCard;
  @override
  final String? playerRequestingColor;
  @override
  final UnoCardColor currentColor;
  @override
  final Direction currentDirection;
  @override
  final bool allowSkip;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerState(gameState: $gameState, playersTurnId: $playersTurnId, name: $name, hand: $hand, otherPlayers: $otherPlayers, lastPlayedCard: $lastPlayedCard, playerRequestingColor: $playerRequestingColor, currentColor: $currentColor, currentDirection: $currentDirection, allowSkip: $allowSkip)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerState'))
      ..add(DiagnosticsProperty('gameState', gameState))
      ..add(DiagnosticsProperty('playersTurnId', playersTurnId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('hand', hand))
      ..add(DiagnosticsProperty('otherPlayers', otherPlayers))
      ..add(DiagnosticsProperty('lastPlayedCard', lastPlayedCard))
      ..add(DiagnosticsProperty('playerRequestingColor', playerRequestingColor))
      ..add(DiagnosticsProperty('currentColor', currentColor))
      ..add(DiagnosticsProperty('currentDirection', currentDirection))
      ..add(DiagnosticsProperty('allowSkip', allowSkip));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerState &&
            const DeepCollectionEquality().equals(other.gameState, gameState) &&
            const DeepCollectionEquality()
                .equals(other.playersTurnId, playersTurnId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.hand, hand) &&
            const DeepCollectionEquality()
                .equals(other.otherPlayers, otherPlayers) &&
            const DeepCollectionEquality()
                .equals(other.lastPlayedCard, lastPlayedCard) &&
            const DeepCollectionEquality()
                .equals(other.playerRequestingColor, playerRequestingColor) &&
            const DeepCollectionEquality()
                .equals(other.currentColor, currentColor) &&
            const DeepCollectionEquality()
                .equals(other.currentDirection, currentDirection) &&
            const DeepCollectionEquality().equals(other.allowSkip, allowSkip));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameState),
      const DeepCollectionEquality().hash(playersTurnId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(hand),
      const DeepCollectionEquality().hash(otherPlayers),
      const DeepCollectionEquality().hash(lastPlayedCard),
      const DeepCollectionEquality().hash(playerRequestingColor),
      const DeepCollectionEquality().hash(currentColor),
      const DeepCollectionEquality().hash(currentDirection),
      const DeepCollectionEquality().hash(allowSkip));

  @JsonKey(ignore: true)
  @override
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerStateToJson(this);
  }
}

abstract class _PlayerState implements PlayerState {
  factory _PlayerState(
      SimpleGameState gameState,
      String playersTurnId,
      String name,
      List<UnoCard> hand,
      List<OtherPlayerState> otherPlayers,
      UnoCard? lastPlayedCard,
      String? playerRequestingColor,
      UnoCardColor currentColor,
      Direction currentDirection,
      bool allowSkip) = _$_PlayerState;

  factory _PlayerState.fromJson(Map<String, dynamic> json) =
      _$_PlayerState.fromJson;

  @override
  SimpleGameState get gameState;
  @override
  String get playersTurnId;
  @override
  String get name;
  @override
  List<UnoCard> get hand;
  @override
  List<OtherPlayerState> get otherPlayers;
  @override
  UnoCard? get lastPlayedCard;
  @override
  String? get playerRequestingColor;
  @override
  UnoCardColor get currentColor;
  @override
  Direction get currentDirection;
  @override
  bool get allowSkip;
  @override
  @JsonKey(ignore: true)
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherPlayerState _$OtherPlayerStateFromJson(Map<String, dynamic> json) {
  return _OtherPlayerState.fromJson(json);
}

/// @nodoc
class _$OtherPlayerStateTearOff {
  const _$OtherPlayerStateTearOff();

  _OtherPlayerState call(String playerId, String name, int handLength) {
    return _OtherPlayerState(
      playerId,
      name,
      handLength,
    );
  }

  OtherPlayerState fromJson(Map<String, Object?> json) {
    return OtherPlayerState.fromJson(json);
  }
}

/// @nodoc
const $OtherPlayerState = _$OtherPlayerStateTearOff();

/// @nodoc
mixin _$OtherPlayerState {
  String get playerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get handLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherPlayerStateCopyWith<OtherPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherPlayerStateCopyWith<$Res> {
  factory $OtherPlayerStateCopyWith(
          OtherPlayerState value, $Res Function(OtherPlayerState) then) =
      _$OtherPlayerStateCopyWithImpl<$Res>;
  $Res call({String playerId, String name, int handLength});
}

/// @nodoc
class _$OtherPlayerStateCopyWithImpl<$Res>
    implements $OtherPlayerStateCopyWith<$Res> {
  _$OtherPlayerStateCopyWithImpl(this._value, this._then);

  final OtherPlayerState _value;
  // ignore: unused_field
  final $Res Function(OtherPlayerState) _then;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? name = freezed,
    Object? handLength = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      handLength: handLength == freezed
          ? _value.handLength
          : handLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$OtherPlayerStateCopyWith<$Res>
    implements $OtherPlayerStateCopyWith<$Res> {
  factory _$OtherPlayerStateCopyWith(
          _OtherPlayerState value, $Res Function(_OtherPlayerState) then) =
      __$OtherPlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({String playerId, String name, int handLength});
}

/// @nodoc
class __$OtherPlayerStateCopyWithImpl<$Res>
    extends _$OtherPlayerStateCopyWithImpl<$Res>
    implements _$OtherPlayerStateCopyWith<$Res> {
  __$OtherPlayerStateCopyWithImpl(
      _OtherPlayerState _value, $Res Function(_OtherPlayerState) _then)
      : super(_value, (v) => _then(v as _OtherPlayerState));

  @override
  _OtherPlayerState get _value => super._value as _OtherPlayerState;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? name = freezed,
    Object? handLength = freezed,
  }) {
    return _then(_OtherPlayerState(
      playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      handLength == freezed
          ? _value.handLength
          : handLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtherPlayerState
    with DiagnosticableTreeMixin
    implements _OtherPlayerState {
  _$_OtherPlayerState(this.playerId, this.name, this.handLength);

  factory _$_OtherPlayerState.fromJson(Map<String, dynamic> json) =>
      _$$_OtherPlayerStateFromJson(json);

  @override
  final String playerId;
  @override
  final String name;
  @override
  final int handLength;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtherPlayerState(playerId: $playerId, name: $name, handLength: $handLength)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtherPlayerState'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('handLength', handLength));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtherPlayerState &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.handLength, handLength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(handLength));

  @JsonKey(ignore: true)
  @override
  _$OtherPlayerStateCopyWith<_OtherPlayerState> get copyWith =>
      __$OtherPlayerStateCopyWithImpl<_OtherPlayerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtherPlayerStateToJson(this);
  }
}

abstract class _OtherPlayerState implements OtherPlayerState {
  factory _OtherPlayerState(String playerId, String name, int handLength) =
      _$_OtherPlayerState;

  factory _OtherPlayerState.fromJson(Map<String, dynamic> json) =
      _$_OtherPlayerState.fromJson;

  @override
  String get playerId;
  @override
  String get name;
  @override
  int get handLength;
  @override
  @JsonKey(ignore: true)
  _$OtherPlayerStateCopyWith<_OtherPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
