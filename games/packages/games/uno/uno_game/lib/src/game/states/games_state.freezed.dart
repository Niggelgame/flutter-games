// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'games_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GamePlayerStateTearOff {
  const _$GamePlayerStateTearOff();

  _GamePlayerState call(List<UnoCard> hand, String name) {
    return _GamePlayerState(
      hand,
      name,
    );
  }
}

/// @nodoc
const $GamePlayerState = _$GamePlayerStateTearOff();

/// @nodoc
mixin _$GamePlayerState {
  List<UnoCard> get hand => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamePlayerStateCopyWith<GamePlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePlayerStateCopyWith<$Res> {
  factory $GamePlayerStateCopyWith(
          GamePlayerState value, $Res Function(GamePlayerState) then) =
      _$GamePlayerStateCopyWithImpl<$Res>;
  $Res call({List<UnoCard> hand, String name});
}

/// @nodoc
class _$GamePlayerStateCopyWithImpl<$Res>
    implements $GamePlayerStateCopyWith<$Res> {
  _$GamePlayerStateCopyWithImpl(this._value, this._then);

  final GamePlayerState _value;
  // ignore: unused_field
  final $Res Function(GamePlayerState) _then;

  @override
  $Res call({
    Object? hand = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      hand: hand == freezed
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GamePlayerStateCopyWith<$Res>
    implements $GamePlayerStateCopyWith<$Res> {
  factory _$GamePlayerStateCopyWith(
          _GamePlayerState value, $Res Function(_GamePlayerState) then) =
      __$GamePlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UnoCard> hand, String name});
}

/// @nodoc
class __$GamePlayerStateCopyWithImpl<$Res>
    extends _$GamePlayerStateCopyWithImpl<$Res>
    implements _$GamePlayerStateCopyWith<$Res> {
  __$GamePlayerStateCopyWithImpl(
      _GamePlayerState _value, $Res Function(_GamePlayerState) _then)
      : super(_value, (v) => _then(v as _GamePlayerState));

  @override
  _GamePlayerState get _value => super._value as _GamePlayerState;

  @override
  $Res call({
    Object? hand = freezed,
    Object? name = freezed,
  }) {
    return _then(_GamePlayerState(
      hand == freezed
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GamePlayerState
    with DiagnosticableTreeMixin
    implements _GamePlayerState {
  _$_GamePlayerState(this.hand, this.name);

  @override
  final List<UnoCard> hand;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GamePlayerState(hand: $hand, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GamePlayerState'))
      ..add(DiagnosticsProperty('hand', hand))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GamePlayerState &&
            const DeepCollectionEquality().equals(other.hand, hand) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hand),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$GamePlayerStateCopyWith<_GamePlayerState> get copyWith =>
      __$GamePlayerStateCopyWithImpl<_GamePlayerState>(this, _$identity);
}

abstract class _GamePlayerState implements GamePlayerState {
  factory _GamePlayerState(List<UnoCard> hand, String name) =
      _$_GamePlayerState;

  @override
  List<UnoCard> get hand;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$GamePlayerStateCopyWith<_GamePlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _GameState call(
      SimpleGameState state,
      Map<String, GamePlayerState> players,
      String currentPlayer,
      List<UnoCard> stack,
      List<UnoCard> cardsPutDown,
      String playerRequestingColor,
      Direction currentDirection,
      UnoCardColor currentColor,
      bool currentPlayerFlaggedForUno,
      bool currentPlayerDrewCard,
      int cardsInAddDraw) {
    return _GameState(
      state,
      players,
      currentPlayer,
      stack,
      cardsPutDown,
      playerRequestingColor,
      currentDirection,
      currentColor,
      currentPlayerFlaggedForUno,
      currentPlayerDrewCard,
      cardsInAddDraw,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  SimpleGameState get state => throw _privateConstructorUsedError;
  Map<String, GamePlayerState> get players =>
      throw _privateConstructorUsedError;
  String get currentPlayer => throw _privateConstructorUsedError;
  List<UnoCard> get stack => throw _privateConstructorUsedError;
  List<UnoCard> get cardsPutDown => throw _privateConstructorUsedError;
  String get playerRequestingColor => throw _privateConstructorUsedError;
  Direction get currentDirection => throw _privateConstructorUsedError;
  UnoCardColor get currentColor => throw _privateConstructorUsedError;
  bool get currentPlayerFlaggedForUno => throw _privateConstructorUsedError;
  bool get currentPlayerDrewCard => throw _privateConstructorUsedError;
  int get cardsInAddDraw => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {SimpleGameState state,
      Map<String, GamePlayerState> players,
      String currentPlayer,
      List<UnoCard> stack,
      List<UnoCard> cardsPutDown,
      String playerRequestingColor,
      Direction currentDirection,
      UnoCardColor currentColor,
      bool currentPlayerFlaggedForUno,
      bool currentPlayerDrewCard,
      int cardsInAddDraw});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? players = freezed,
    Object? currentPlayer = freezed,
    Object? stack = freezed,
    Object? cardsPutDown = freezed,
    Object? playerRequestingColor = freezed,
    Object? currentDirection = freezed,
    Object? currentColor = freezed,
    Object? currentPlayerFlaggedForUno = freezed,
    Object? currentPlayerDrewCard = freezed,
    Object? cardsInAddDraw = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SimpleGameState,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, GamePlayerState>,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      stack: stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      cardsPutDown: cardsPutDown == freezed
          ? _value.cardsPutDown
          : cardsPutDown // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      playerRequestingColor: playerRequestingColor == freezed
          ? _value.playerRequestingColor
          : playerRequestingColor // ignore: cast_nullable_to_non_nullable
              as String,
      currentDirection: currentDirection == freezed
          ? _value.currentDirection
          : currentDirection // ignore: cast_nullable_to_non_nullable
              as Direction,
      currentColor: currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
      currentPlayerFlaggedForUno: currentPlayerFlaggedForUno == freezed
          ? _value.currentPlayerFlaggedForUno
          : currentPlayerFlaggedForUno // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPlayerDrewCard: currentPlayerDrewCard == freezed
          ? _value.currentPlayerDrewCard
          : currentPlayerDrewCard // ignore: cast_nullable_to_non_nullable
              as bool,
      cardsInAddDraw: cardsInAddDraw == freezed
          ? _value.cardsInAddDraw
          : cardsInAddDraw // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SimpleGameState state,
      Map<String, GamePlayerState> players,
      String currentPlayer,
      List<UnoCard> stack,
      List<UnoCard> cardsPutDown,
      String playerRequestingColor,
      Direction currentDirection,
      UnoCardColor currentColor,
      bool currentPlayerFlaggedForUno,
      bool currentPlayerDrewCard,
      int cardsInAddDraw});
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? state = freezed,
    Object? players = freezed,
    Object? currentPlayer = freezed,
    Object? stack = freezed,
    Object? cardsPutDown = freezed,
    Object? playerRequestingColor = freezed,
    Object? currentDirection = freezed,
    Object? currentColor = freezed,
    Object? currentPlayerFlaggedForUno = freezed,
    Object? currentPlayerDrewCard = freezed,
    Object? cardsInAddDraw = freezed,
  }) {
    return _then(_GameState(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SimpleGameState,
      players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, GamePlayerState>,
      currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      cardsPutDown == freezed
          ? _value.cardsPutDown
          : cardsPutDown // ignore: cast_nullable_to_non_nullable
              as List<UnoCard>,
      playerRequestingColor == freezed
          ? _value.playerRequestingColor
          : playerRequestingColor // ignore: cast_nullable_to_non_nullable
              as String,
      currentDirection == freezed
          ? _value.currentDirection
          : currentDirection // ignore: cast_nullable_to_non_nullable
              as Direction,
      currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
      currentPlayerFlaggedForUno == freezed
          ? _value.currentPlayerFlaggedForUno
          : currentPlayerFlaggedForUno // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPlayerDrewCard == freezed
          ? _value.currentPlayerDrewCard
          : currentPlayerDrewCard // ignore: cast_nullable_to_non_nullable
              as bool,
      cardsInAddDraw == freezed
          ? _value.cardsInAddDraw
          : cardsInAddDraw // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GameState extends _GameState with DiagnosticableTreeMixin {
  _$_GameState(
      this.state,
      this.players,
      this.currentPlayer,
      this.stack,
      this.cardsPutDown,
      this.playerRequestingColor,
      this.currentDirection,
      this.currentColor,
      this.currentPlayerFlaggedForUno,
      this.currentPlayerDrewCard,
      this.cardsInAddDraw)
      : super._();

  @override
  final SimpleGameState state;
  @override
  final Map<String, GamePlayerState> players;
  @override
  final String currentPlayer;
  @override
  final List<UnoCard> stack;
  @override
  final List<UnoCard> cardsPutDown;
  @override
  final String playerRequestingColor;
  @override
  final Direction currentDirection;
  @override
  final UnoCardColor currentColor;
  @override
  final bool currentPlayerFlaggedForUno;
  @override
  final bool currentPlayerDrewCard;
  @override
  final int cardsInAddDraw;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameState(state: $state, players: $players, currentPlayer: $currentPlayer, stack: $stack, cardsPutDown: $cardsPutDown, playerRequestingColor: $playerRequestingColor, currentDirection: $currentDirection, currentColor: $currentColor, currentPlayerFlaggedForUno: $currentPlayerFlaggedForUno, currentPlayerDrewCard: $currentPlayerDrewCard, cardsInAddDraw: $cardsInAddDraw)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameState'))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('currentPlayer', currentPlayer))
      ..add(DiagnosticsProperty('stack', stack))
      ..add(DiagnosticsProperty('cardsPutDown', cardsPutDown))
      ..add(DiagnosticsProperty('playerRequestingColor', playerRequestingColor))
      ..add(DiagnosticsProperty('currentDirection', currentDirection))
      ..add(DiagnosticsProperty('currentColor', currentColor))
      ..add(DiagnosticsProperty(
          'currentPlayerFlaggedForUno', currentPlayerFlaggedForUno))
      ..add(DiagnosticsProperty('currentPlayerDrewCard', currentPlayerDrewCard))
      ..add(DiagnosticsProperty('cardsInAddDraw', cardsInAddDraw));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameState &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.currentPlayer, currentPlayer) &&
            const DeepCollectionEquality().equals(other.stack, stack) &&
            const DeepCollectionEquality()
                .equals(other.cardsPutDown, cardsPutDown) &&
            const DeepCollectionEquality()
                .equals(other.playerRequestingColor, playerRequestingColor) &&
            const DeepCollectionEquality()
                .equals(other.currentDirection, currentDirection) &&
            const DeepCollectionEquality()
                .equals(other.currentColor, currentColor) &&
            const DeepCollectionEquality().equals(
                other.currentPlayerFlaggedForUno, currentPlayerFlaggedForUno) &&
            const DeepCollectionEquality()
                .equals(other.currentPlayerDrewCard, currentPlayerDrewCard) &&
            const DeepCollectionEquality()
                .equals(other.cardsInAddDraw, cardsInAddDraw));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(currentPlayer),
      const DeepCollectionEquality().hash(stack),
      const DeepCollectionEquality().hash(cardsPutDown),
      const DeepCollectionEquality().hash(playerRequestingColor),
      const DeepCollectionEquality().hash(currentDirection),
      const DeepCollectionEquality().hash(currentColor),
      const DeepCollectionEquality().hash(currentPlayerFlaggedForUno),
      const DeepCollectionEquality().hash(currentPlayerDrewCard),
      const DeepCollectionEquality().hash(cardsInAddDraw));

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState extends GameState {
  factory _GameState(
      SimpleGameState state,
      Map<String, GamePlayerState> players,
      String currentPlayer,
      List<UnoCard> stack,
      List<UnoCard> cardsPutDown,
      String playerRequestingColor,
      Direction currentDirection,
      UnoCardColor currentColor,
      bool currentPlayerFlaggedForUno,
      bool currentPlayerDrewCard,
      int cardsInAddDraw) = _$_GameState;
  _GameState._() : super._();

  @override
  SimpleGameState get state;
  @override
  Map<String, GamePlayerState> get players;
  @override
  String get currentPlayer;
  @override
  List<UnoCard> get stack;
  @override
  List<UnoCard> get cardsPutDown;
  @override
  String get playerRequestingColor;
  @override
  Direction get currentDirection;
  @override
  UnoCardColor get currentColor;
  @override
  bool get currentPlayerFlaggedForUno;
  @override
  bool get currentPlayerDrewCard;
  @override
  int get cardsInAddDraw;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
