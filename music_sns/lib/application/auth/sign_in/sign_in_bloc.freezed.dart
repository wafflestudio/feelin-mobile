// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _LoginIdChanged loginIdChanged() {
    return const _LoginIdChanged();
  }

  _EmailChanged emailChanged() {
    return const _EmailChanged();
  }
}

/// @nodoc
const $SignInEvent = _$SignInEventTearOff();

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginIdChanged,
    required TResult Function() emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginIdChanged value) loginIdChanged,
    required TResult Function(_EmailChanged value) emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res> implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  final SignInEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEvent) _then;
}

/// @nodoc
abstract class _$LoginIdChangedCopyWith<$Res> {
  factory _$LoginIdChangedCopyWith(
          _LoginIdChanged value, $Res Function(_LoginIdChanged) then) =
      __$LoginIdChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoginIdChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$LoginIdChangedCopyWith<$Res> {
  __$LoginIdChangedCopyWithImpl(
      _LoginIdChanged _value, $Res Function(_LoginIdChanged) _then)
      : super(_value, (v) => _then(v as _LoginIdChanged));

  @override
  _LoginIdChanged get _value => super._value as _LoginIdChanged;
}

/// @nodoc

class _$_LoginIdChanged implements _LoginIdChanged {
  const _$_LoginIdChanged();

  @override
  String toString() {
    return 'SignInEvent.loginIdChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginIdChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginIdChanged,
    required TResult Function() emailChanged,
  }) {
    return loginIdChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
  }) {
    return loginIdChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
    required TResult orElse(),
  }) {
    if (loginIdChanged != null) {
      return loginIdChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginIdChanged value) loginIdChanged,
    required TResult Function(_EmailChanged value) emailChanged,
  }) {
    return loginIdChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
  }) {
    return loginIdChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) {
    if (loginIdChanged != null) {
      return loginIdChanged(this);
    }
    return orElse();
  }
}

abstract class _LoginIdChanged implements SignInEvent {
  const factory _LoginIdChanged() = _$_LoginIdChanged;
}

/// @nodoc
abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailChangedCopyWithImpl<$Res> extends _$SignInEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged();

  @override
  String toString() {
    return 'SignInEvent.emailChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmailChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginIdChanged,
    required TResult Function() emailChanged,
  }) {
    return emailChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
  }) {
    return emailChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginIdChanged,
    TResult Function()? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginIdChanged value) loginIdChanged,
    required TResult Function(_EmailChanged value) emailChanged,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginIdChanged value)? loginIdChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements SignInEvent {
  const factory _EmailChanged() = _$_EmailChanged;
}

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  _SignInState call() {
    return const _SignInState();
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class _$SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
          _SignInState value, $Res Function(_SignInState) then) =
      __$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(
      _SignInState _value, $Res Function(_SignInState) _then)
      : super(_value, (v) => _then(v as _SignInState));

  @override
  _SignInState get _value => super._value as _SignInState;
}

/// @nodoc

class _$_SignInState implements _SignInState {
  const _$_SignInState();

  @override
  String toString() {
    return 'SignInState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SignInState implements SignInState {
  const factory _SignInState() = _$_SignInState;
}
