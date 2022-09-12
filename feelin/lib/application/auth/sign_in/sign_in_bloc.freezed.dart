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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_LoginIdChangedCopyWith<$Res> {
  factory _$$_LoginIdChangedCopyWith(
          _$_LoginIdChanged value, $Res Function(_$_LoginIdChanged) then) =
      __$$_LoginIdChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginIdChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$$_LoginIdChangedCopyWith<$Res> {
  __$$_LoginIdChangedCopyWithImpl(
      _$_LoginIdChanged _value, $Res Function(_$_LoginIdChanged) _then)
      : super(_value, (v) => _then(v as _$_LoginIdChanged));

  @override
  _$_LoginIdChanged get _value => super._value as _$_LoginIdChanged;
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
        (other.runtimeType == runtimeType && other is _$_LoginIdChanged);
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
abstract class _$$_EmailChangedCopyWith<$Res> {
  factory _$$_EmailChangedCopyWith(
          _$_EmailChanged value, $Res Function(_$_EmailChanged) then) =
      __$$_EmailChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$$_EmailChangedCopyWith<$Res> {
  __$$_EmailChangedCopyWithImpl(
      _$_EmailChanged _value, $Res Function(_$_EmailChanged) _then)
      : super(_value, (v) => _then(v as _$_EmailChanged));

  @override
  _$_EmailChanged get _value => super._value as _$_EmailChanged;
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
        (other.runtimeType == runtimeType && other is _$_EmailChanged);
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
abstract class _$$_SignInStateCopyWith<$Res> {
  factory _$$_SignInStateCopyWith(
          _$_SignInState value, $Res Function(_$_SignInState) then) =
      __$$_SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$$_SignInStateCopyWith<$Res> {
  __$$_SignInStateCopyWithImpl(
      _$_SignInState _value, $Res Function(_$_SignInState) _then)
      : super(_value, (v) => _then(v as _$_SignInState));

  @override
  _$_SignInState get _value => super._value as _$_SignInState;
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
        (other.runtimeType == runtimeType && other is _$_SignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SignInState implements SignInState {
  const factory _SignInState() = _$_SignInState;
}
