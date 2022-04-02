// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnoPlayerEvent _$UnoPlayerEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'drawCard':
      return UnoPlayerDrawCardEvent.fromJson(json);
    case 'playCard':
      return UnoPlayerPlayCardEvent.fromJson(json);
    case 'selectColor':
      return UnoPlayerSelectColorEvent.fromJson(json);
    case 'flagUno':
      return UnoPlayerFlagUnoEvent.fromJson(json);
    case 'skip':
      return UnoPlayerSkipEvent.fromJson(json);
    case 'start':
      return UnoPlayerStartEvent.fromJson(json);
    case 'syncRequest':
      return UnoPlayerSyncRequestEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UnoPlayerEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$UnoPlayerEventTearOff {
  const _$UnoPlayerEventTearOff();

  UnoPlayerDrawCardEvent drawCard() {
    return UnoPlayerDrawCardEvent();
  }

  UnoPlayerPlayCardEvent playCard(UnoCard card) {
    return UnoPlayerPlayCardEvent(
      card,
    );
  }

  UnoPlayerSelectColorEvent selectColor(UnoCardColor color) {
    return UnoPlayerSelectColorEvent(
      color,
    );
  }

  UnoPlayerFlagUnoEvent flagUno() {
    return UnoPlayerFlagUnoEvent();
  }

  UnoPlayerSkipEvent skip() {
    return UnoPlayerSkipEvent();
  }

  UnoPlayerStartEvent start() {
    return UnoPlayerStartEvent();
  }

  UnoPlayerSyncRequestEvent syncRequest() {
    return UnoPlayerSyncRequestEvent();
  }

  UnoPlayerEvent fromJson(Map<String, Object?> json) {
    return UnoPlayerEvent.fromJson(json);
  }
}

/// @nodoc
const $UnoPlayerEvent = _$UnoPlayerEventTearOff();

/// @nodoc
mixin _$UnoPlayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoPlayerEventCopyWith<$Res> {
  factory $UnoPlayerEventCopyWith(
          UnoPlayerEvent value, $Res Function(UnoPlayerEvent) then) =
      _$UnoPlayerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerEventCopyWith<$Res> {
  _$UnoPlayerEventCopyWithImpl(this._value, this._then);

  final UnoPlayerEvent _value;
  // ignore: unused_field
  final $Res Function(UnoPlayerEvent) _then;
}

/// @nodoc
abstract class $UnoPlayerDrawCardEventCopyWith<$Res> {
  factory $UnoPlayerDrawCardEventCopyWith(UnoPlayerDrawCardEvent value,
          $Res Function(UnoPlayerDrawCardEvent) then) =
      _$UnoPlayerDrawCardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerDrawCardEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerDrawCardEventCopyWith<$Res> {
  _$UnoPlayerDrawCardEventCopyWithImpl(UnoPlayerDrawCardEvent _value,
      $Res Function(UnoPlayerDrawCardEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerDrawCardEvent));

  @override
  UnoPlayerDrawCardEvent get _value => super._value as UnoPlayerDrawCardEvent;
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerDrawCardEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerDrawCardEvent {
  _$UnoPlayerDrawCardEvent({String? $type}) : $type = $type ?? 'drawCard';

  factory _$UnoPlayerDrawCardEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerDrawCardEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.drawCard()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UnoPlayerEvent.drawCard'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnoPlayerDrawCardEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return drawCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return drawCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (drawCard != null) {
      return drawCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return drawCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return drawCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (drawCard != null) {
      return drawCard(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerDrawCardEventToJson(this);
  }
}

abstract class UnoPlayerDrawCardEvent implements UnoPlayerEvent {
  factory UnoPlayerDrawCardEvent() = _$UnoPlayerDrawCardEvent;

  factory UnoPlayerDrawCardEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerDrawCardEvent.fromJson;
}

/// @nodoc
abstract class $UnoPlayerPlayCardEventCopyWith<$Res> {
  factory $UnoPlayerPlayCardEventCopyWith(UnoPlayerPlayCardEvent value,
          $Res Function(UnoPlayerPlayCardEvent) then) =
      _$UnoPlayerPlayCardEventCopyWithImpl<$Res>;
  $Res call({UnoCard card});
}

/// @nodoc
class _$UnoPlayerPlayCardEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerPlayCardEventCopyWith<$Res> {
  _$UnoPlayerPlayCardEventCopyWithImpl(UnoPlayerPlayCardEvent _value,
      $Res Function(UnoPlayerPlayCardEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerPlayCardEvent));

  @override
  UnoPlayerPlayCardEvent get _value => super._value as UnoPlayerPlayCardEvent;

  @override
  $Res call({
    Object? card = freezed,
  }) {
    return _then(UnoPlayerPlayCardEvent(
      card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as UnoCard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerPlayCardEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerPlayCardEvent {
  _$UnoPlayerPlayCardEvent(this.card, {String? $type})
      : $type = $type ?? 'playCard';

  factory _$UnoPlayerPlayCardEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerPlayCardEventFromJson(json);

  @override
  final UnoCard card;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.playCard(card: $card)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoPlayerEvent.playCard'))
      ..add(DiagnosticsProperty('card', card));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoPlayerPlayCardEvent &&
            const DeepCollectionEquality().equals(other.card, card));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(card));

  @JsonKey(ignore: true)
  @override
  $UnoPlayerPlayCardEventCopyWith<UnoPlayerPlayCardEvent> get copyWith =>
      _$UnoPlayerPlayCardEventCopyWithImpl<UnoPlayerPlayCardEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return playCard(card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return playCard?.call(card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (playCard != null) {
      return playCard(card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return playCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return playCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (playCard != null) {
      return playCard(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerPlayCardEventToJson(this);
  }
}

abstract class UnoPlayerPlayCardEvent implements UnoPlayerEvent {
  factory UnoPlayerPlayCardEvent(UnoCard card) = _$UnoPlayerPlayCardEvent;

  factory UnoPlayerPlayCardEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerPlayCardEvent.fromJson;

  UnoCard get card;
  @JsonKey(ignore: true)
  $UnoPlayerPlayCardEventCopyWith<UnoPlayerPlayCardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoPlayerSelectColorEventCopyWith<$Res> {
  factory $UnoPlayerSelectColorEventCopyWith(UnoPlayerSelectColorEvent value,
          $Res Function(UnoPlayerSelectColorEvent) then) =
      _$UnoPlayerSelectColorEventCopyWithImpl<$Res>;
  $Res call({UnoCardColor color});
}

/// @nodoc
class _$UnoPlayerSelectColorEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerSelectColorEventCopyWith<$Res> {
  _$UnoPlayerSelectColorEventCopyWithImpl(UnoPlayerSelectColorEvent _value,
      $Res Function(UnoPlayerSelectColorEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerSelectColorEvent));

  @override
  UnoPlayerSelectColorEvent get _value =>
      super._value as UnoPlayerSelectColorEvent;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(UnoPlayerSelectColorEvent(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as UnoCardColor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerSelectColorEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerSelectColorEvent {
  _$UnoPlayerSelectColorEvent(this.color, {String? $type})
      : $type = $type ?? 'selectColor';

  factory _$UnoPlayerSelectColorEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerSelectColorEventFromJson(json);

  @override
  final UnoCardColor color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.selectColor(color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnoPlayerEvent.selectColor'))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoPlayerSelectColorEvent &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  $UnoPlayerSelectColorEventCopyWith<UnoPlayerSelectColorEvent> get copyWith =>
      _$UnoPlayerSelectColorEventCopyWithImpl<UnoPlayerSelectColorEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return selectColor(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return selectColor?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (selectColor != null) {
      return selectColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return selectColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return selectColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (selectColor != null) {
      return selectColor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerSelectColorEventToJson(this);
  }
}

abstract class UnoPlayerSelectColorEvent implements UnoPlayerEvent {
  factory UnoPlayerSelectColorEvent(UnoCardColor color) =
      _$UnoPlayerSelectColorEvent;

  factory UnoPlayerSelectColorEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerSelectColorEvent.fromJson;

  UnoCardColor get color;
  @JsonKey(ignore: true)
  $UnoPlayerSelectColorEventCopyWith<UnoPlayerSelectColorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnoPlayerFlagUnoEventCopyWith<$Res> {
  factory $UnoPlayerFlagUnoEventCopyWith(UnoPlayerFlagUnoEvent value,
          $Res Function(UnoPlayerFlagUnoEvent) then) =
      _$UnoPlayerFlagUnoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerFlagUnoEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerFlagUnoEventCopyWith<$Res> {
  _$UnoPlayerFlagUnoEventCopyWithImpl(
      UnoPlayerFlagUnoEvent _value, $Res Function(UnoPlayerFlagUnoEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerFlagUnoEvent));

  @override
  UnoPlayerFlagUnoEvent get _value => super._value as UnoPlayerFlagUnoEvent;
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerFlagUnoEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerFlagUnoEvent {
  _$UnoPlayerFlagUnoEvent({String? $type}) : $type = $type ?? 'flagUno';

  factory _$UnoPlayerFlagUnoEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerFlagUnoEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.flagUno()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UnoPlayerEvent.flagUno'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnoPlayerFlagUnoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return flagUno();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return flagUno?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (flagUno != null) {
      return flagUno();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return flagUno(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return flagUno?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (flagUno != null) {
      return flagUno(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerFlagUnoEventToJson(this);
  }
}

abstract class UnoPlayerFlagUnoEvent implements UnoPlayerEvent {
  factory UnoPlayerFlagUnoEvent() = _$UnoPlayerFlagUnoEvent;

  factory UnoPlayerFlagUnoEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerFlagUnoEvent.fromJson;
}

/// @nodoc
abstract class $UnoPlayerSkipEventCopyWith<$Res> {
  factory $UnoPlayerSkipEventCopyWith(
          UnoPlayerSkipEvent value, $Res Function(UnoPlayerSkipEvent) then) =
      _$UnoPlayerSkipEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerSkipEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerSkipEventCopyWith<$Res> {
  _$UnoPlayerSkipEventCopyWithImpl(
      UnoPlayerSkipEvent _value, $Res Function(UnoPlayerSkipEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerSkipEvent));

  @override
  UnoPlayerSkipEvent get _value => super._value as UnoPlayerSkipEvent;
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerSkipEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerSkipEvent {
  _$UnoPlayerSkipEvent({String? $type}) : $type = $type ?? 'skip';

  factory _$UnoPlayerSkipEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerSkipEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.skip()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UnoPlayerEvent.skip'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnoPlayerSkipEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return skip();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return skip?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return skip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return skip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerSkipEventToJson(this);
  }
}

abstract class UnoPlayerSkipEvent implements UnoPlayerEvent {
  factory UnoPlayerSkipEvent() = _$UnoPlayerSkipEvent;

  factory UnoPlayerSkipEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerSkipEvent.fromJson;
}

/// @nodoc
abstract class $UnoPlayerStartEventCopyWith<$Res> {
  factory $UnoPlayerStartEventCopyWith(
          UnoPlayerStartEvent value, $Res Function(UnoPlayerStartEvent) then) =
      _$UnoPlayerStartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerStartEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerStartEventCopyWith<$Res> {
  _$UnoPlayerStartEventCopyWithImpl(
      UnoPlayerStartEvent _value, $Res Function(UnoPlayerStartEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerStartEvent));

  @override
  UnoPlayerStartEvent get _value => super._value as UnoPlayerStartEvent;
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerStartEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerStartEvent {
  _$UnoPlayerStartEvent({String? $type}) : $type = $type ?? 'start';

  factory _$UnoPlayerStartEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerStartEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.start()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UnoPlayerEvent.start'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnoPlayerStartEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerStartEventToJson(this);
  }
}

abstract class UnoPlayerStartEvent implements UnoPlayerEvent {
  factory UnoPlayerStartEvent() = _$UnoPlayerStartEvent;

  factory UnoPlayerStartEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerStartEvent.fromJson;
}

/// @nodoc
abstract class $UnoPlayerSyncRequestEventCopyWith<$Res> {
  factory $UnoPlayerSyncRequestEventCopyWith(UnoPlayerSyncRequestEvent value,
          $Res Function(UnoPlayerSyncRequestEvent) then) =
      _$UnoPlayerSyncRequestEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnoPlayerSyncRequestEventCopyWithImpl<$Res>
    extends _$UnoPlayerEventCopyWithImpl<$Res>
    implements $UnoPlayerSyncRequestEventCopyWith<$Res> {
  _$UnoPlayerSyncRequestEventCopyWithImpl(UnoPlayerSyncRequestEvent _value,
      $Res Function(UnoPlayerSyncRequestEvent) _then)
      : super(_value, (v) => _then(v as UnoPlayerSyncRequestEvent));

  @override
  UnoPlayerSyncRequestEvent get _value =>
      super._value as UnoPlayerSyncRequestEvent;
}

/// @nodoc
@JsonSerializable()
class _$UnoPlayerSyncRequestEvent
    with DiagnosticableTreeMixin
    implements UnoPlayerSyncRequestEvent {
  _$UnoPlayerSyncRequestEvent({String? $type}) : $type = $type ?? 'syncRequest';

  factory _$UnoPlayerSyncRequestEvent.fromJson(Map<String, dynamic> json) =>
      _$$UnoPlayerSyncRequestEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnoPlayerEvent.syncRequest()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UnoPlayerEvent.syncRequest'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnoPlayerSyncRequestEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() drawCard,
    required TResult Function(UnoCard card) playCard,
    required TResult Function(UnoCardColor color) selectColor,
    required TResult Function() flagUno,
    required TResult Function() skip,
    required TResult Function() start,
    required TResult Function() syncRequest,
  }) {
    return syncRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
  }) {
    return syncRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? drawCard,
    TResult Function(UnoCard card)? playCard,
    TResult Function(UnoCardColor color)? selectColor,
    TResult Function()? flagUno,
    TResult Function()? skip,
    TResult Function()? start,
    TResult Function()? syncRequest,
    required TResult orElse(),
  }) {
    if (syncRequest != null) {
      return syncRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnoPlayerDrawCardEvent value) drawCard,
    required TResult Function(UnoPlayerPlayCardEvent value) playCard,
    required TResult Function(UnoPlayerSelectColorEvent value) selectColor,
    required TResult Function(UnoPlayerFlagUnoEvent value) flagUno,
    required TResult Function(UnoPlayerSkipEvent value) skip,
    required TResult Function(UnoPlayerStartEvent value) start,
    required TResult Function(UnoPlayerSyncRequestEvent value) syncRequest,
  }) {
    return syncRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
  }) {
    return syncRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnoPlayerDrawCardEvent value)? drawCard,
    TResult Function(UnoPlayerPlayCardEvent value)? playCard,
    TResult Function(UnoPlayerSelectColorEvent value)? selectColor,
    TResult Function(UnoPlayerFlagUnoEvent value)? flagUno,
    TResult Function(UnoPlayerSkipEvent value)? skip,
    TResult Function(UnoPlayerStartEvent value)? start,
    TResult Function(UnoPlayerSyncRequestEvent value)? syncRequest,
    required TResult orElse(),
  }) {
    if (syncRequest != null) {
      return syncRequest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnoPlayerSyncRequestEventToJson(this);
  }
}

abstract class UnoPlayerSyncRequestEvent implements UnoPlayerEvent {
  factory UnoPlayerSyncRequestEvent() = _$UnoPlayerSyncRequestEvent;

  factory UnoPlayerSyncRequestEvent.fromJson(Map<String, dynamic> json) =
      _$UnoPlayerSyncRequestEvent.fromJson;
}
