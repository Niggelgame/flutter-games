// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basic_game_state_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BasicGameStateStateTearOff {
  const _$BasicGameStateStateTearOff();

  BasicGameStateInitial initial() {
    return BasicGameStateInitial();
  }

  BasicGameStateRunning running() {
    return BasicGameStateRunning();
  }

  BasicGameStateFinished finished() {
    return BasicGameStateFinished();
  }
}

/// @nodoc
const $BasicGameStateState = _$BasicGameStateStateTearOff();

/// @nodoc
mixin _$BasicGameStateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() running,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicGameStateInitial value) initial,
    required TResult Function(BasicGameStateRunning value) running,
    required TResult Function(BasicGameStateFinished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicGameStateStateCopyWith<$Res> {
  factory $BasicGameStateStateCopyWith(
          BasicGameStateState value, $Res Function(BasicGameStateState) then) =
      _$BasicGameStateStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BasicGameStateStateCopyWithImpl<$Res>
    implements $BasicGameStateStateCopyWith<$Res> {
  _$BasicGameStateStateCopyWithImpl(this._value, this._then);

  final BasicGameStateState _value;
  // ignore: unused_field
  final $Res Function(BasicGameStateState) _then;
}

/// @nodoc
abstract class $BasicGameStateInitialCopyWith<$Res> {
  factory $BasicGameStateInitialCopyWith(BasicGameStateInitial value,
          $Res Function(BasicGameStateInitial) then) =
      _$BasicGameStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BasicGameStateInitialCopyWithImpl<$Res>
    extends _$BasicGameStateStateCopyWithImpl<$Res>
    implements $BasicGameStateInitialCopyWith<$Res> {
  _$BasicGameStateInitialCopyWithImpl(
      BasicGameStateInitial _value, $Res Function(BasicGameStateInitial) _then)
      : super(_value, (v) => _then(v as BasicGameStateInitial));

  @override
  BasicGameStateInitial get _value => super._value as BasicGameStateInitial;
}

/// @nodoc

class _$BasicGameStateInitial implements BasicGameStateInitial {
  _$BasicGameStateInitial();

  @override
  String toString() {
    return 'BasicGameStateState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BasicGameStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() running,
    required TResult Function() finished,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicGameStateInitial value) initial,
    required TResult Function(BasicGameStateRunning value) running,
    required TResult Function(BasicGameStateFinished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BasicGameStateInitial implements BasicGameStateState {
  factory BasicGameStateInitial() = _$BasicGameStateInitial;
}

/// @nodoc
abstract class $BasicGameStateRunningCopyWith<$Res> {
  factory $BasicGameStateRunningCopyWith(BasicGameStateRunning value,
          $Res Function(BasicGameStateRunning) then) =
      _$BasicGameStateRunningCopyWithImpl<$Res>;
}

/// @nodoc
class _$BasicGameStateRunningCopyWithImpl<$Res>
    extends _$BasicGameStateStateCopyWithImpl<$Res>
    implements $BasicGameStateRunningCopyWith<$Res> {
  _$BasicGameStateRunningCopyWithImpl(
      BasicGameStateRunning _value, $Res Function(BasicGameStateRunning) _then)
      : super(_value, (v) => _then(v as BasicGameStateRunning));

  @override
  BasicGameStateRunning get _value => super._value as BasicGameStateRunning;
}

/// @nodoc

class _$BasicGameStateRunning implements BasicGameStateRunning {
  _$BasicGameStateRunning();

  @override
  String toString() {
    return 'BasicGameStateState.running()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BasicGameStateRunning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() running,
    required TResult Function() finished,
  }) {
    return running();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
  }) {
    return running?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicGameStateInitial value) initial,
    required TResult Function(BasicGameStateRunning value) running,
    required TResult Function(BasicGameStateFinished value) finished,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class BasicGameStateRunning implements BasicGameStateState {
  factory BasicGameStateRunning() = _$BasicGameStateRunning;
}

/// @nodoc
abstract class $BasicGameStateFinishedCopyWith<$Res> {
  factory $BasicGameStateFinishedCopyWith(BasicGameStateFinished value,
          $Res Function(BasicGameStateFinished) then) =
      _$BasicGameStateFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BasicGameStateFinishedCopyWithImpl<$Res>
    extends _$BasicGameStateStateCopyWithImpl<$Res>
    implements $BasicGameStateFinishedCopyWith<$Res> {
  _$BasicGameStateFinishedCopyWithImpl(BasicGameStateFinished _value,
      $Res Function(BasicGameStateFinished) _then)
      : super(_value, (v) => _then(v as BasicGameStateFinished));

  @override
  BasicGameStateFinished get _value => super._value as BasicGameStateFinished;
}

/// @nodoc

class _$BasicGameStateFinished implements BasicGameStateFinished {
  _$BasicGameStateFinished();

  @override
  String toString() {
    return 'BasicGameStateState.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BasicGameStateFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() running,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? running,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicGameStateInitial value) initial,
    required TResult Function(BasicGameStateRunning value) running,
    required TResult Function(BasicGameStateFinished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicGameStateInitial value)? initial,
    TResult Function(BasicGameStateRunning value)? running,
    TResult Function(BasicGameStateFinished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class BasicGameStateFinished implements BasicGameStateState {
  factory BasicGameStateFinished() = _$BasicGameStateFinished;
}
