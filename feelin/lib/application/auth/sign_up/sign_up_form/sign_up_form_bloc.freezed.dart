// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormEventCopyWith<$Res> {
  factory $SignUpFormEventCopyWith(
          SignUpFormEvent value, $Res Function(SignUpFormEvent) then) =
      _$SignUpFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpFormEventCopyWithImpl<$Res>
    implements $SignUpFormEventCopyWith<$Res> {
  _$SignUpFormEventCopyWithImpl(this._value, this._then);

  final SignUpFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpFormEvent) _then;
}

/// @nodoc
abstract class _$$_EmailAddressChangedCopyWith<$Res> {
  factory _$$_EmailAddressChangedCopyWith(_$_EmailAddressChanged value,
          $Res Function(_$_EmailAddressChanged) then) =
      __$$_EmailAddressChangedCopyWithImpl<$Res>;
  $Res call({String emailAddressStr});
}

/// @nodoc
class __$$_EmailAddressChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_EmailAddressChangedCopyWith<$Res> {
  __$$_EmailAddressChangedCopyWithImpl(_$_EmailAddressChanged _value,
      $Res Function(_$_EmailAddressChanged) _then)
      : super(_value, (v) => _then(v as _$_EmailAddressChanged));

  @override
  _$_EmailAddressChanged get _value => super._value as _$_EmailAddressChanged;

  @override
  $Res call({
    Object? emailAddressStr = freezed,
  }) {
    return _then(_$_EmailAddressChanged(
      emailAddressStr == freezed
          ? _value.emailAddressStr
          : emailAddressStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailAddressChanged implements _EmailAddressChanged {
  const _$_EmailAddressChanged(this.emailAddressStr);

  @override
  final String emailAddressStr;

  @override
  String toString() {
    return 'SignUpFormEvent.emailAddressChanged(emailAddressStr: $emailAddressStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailAddressChanged &&
            const DeepCollectionEquality()
                .equals(other.emailAddressStr, emailAddressStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(emailAddressStr));

  @JsonKey(ignore: true)
  @override
  _$$_EmailAddressChangedCopyWith<_$_EmailAddressChanged> get copyWith =>
      __$$_EmailAddressChangedCopyWithImpl<_$_EmailAddressChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return emailAddressChanged(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return emailAddressChanged?.call(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (emailAddressChanged != null) {
      return emailAddressChanged(emailAddressStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return emailAddressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return emailAddressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (emailAddressChanged != null) {
      return emailAddressChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailAddressChanged implements SignUpFormEvent {
  const factory _EmailAddressChanged(final String emailAddressStr) =
      _$_EmailAddressChanged;

  String get emailAddressStr;
  @JsonKey(ignore: true)
  _$$_EmailAddressChangedCopyWith<_$_EmailAddressChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordConfirmChangedCopyWith<$Res> {
  factory _$$_PasswordConfirmChangedCopyWith(_$_PasswordConfirmChanged value,
          $Res Function(_$_PasswordConfirmChanged) then) =
      __$$_PasswordConfirmChangedCopyWithImpl<$Res>;
  $Res call({String passwordConfirmStr});
}

/// @nodoc
class __$$_PasswordConfirmChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_PasswordConfirmChangedCopyWith<$Res> {
  __$$_PasswordConfirmChangedCopyWithImpl(_$_PasswordConfirmChanged _value,
      $Res Function(_$_PasswordConfirmChanged) _then)
      : super(_value, (v) => _then(v as _$_PasswordConfirmChanged));

  @override
  _$_PasswordConfirmChanged get _value =>
      super._value as _$_PasswordConfirmChanged;

  @override
  $Res call({
    Object? passwordConfirmStr = freezed,
  }) {
    return _then(_$_PasswordConfirmChanged(
      passwordConfirmStr == freezed
          ? _value.passwordConfirmStr
          : passwordConfirmStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordConfirmChanged implements _PasswordConfirmChanged {
  const _$_PasswordConfirmChanged(this.passwordConfirmStr);

  @override
  final String passwordConfirmStr;

  @override
  String toString() {
    return 'SignUpFormEvent.passwordConfirmChanged(passwordConfirmStr: $passwordConfirmStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordConfirmChanged &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirmStr, passwordConfirmStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(passwordConfirmStr));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordConfirmChangedCopyWith<_$_PasswordConfirmChanged> get copyWith =>
      __$$_PasswordConfirmChangedCopyWithImpl<_$_PasswordConfirmChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return passwordConfirmChanged(passwordConfirmStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return passwordConfirmChanged?.call(passwordConfirmStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (passwordConfirmChanged != null) {
      return passwordConfirmChanged(passwordConfirmStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return passwordConfirmChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return passwordConfirmChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (passwordConfirmChanged != null) {
      return passwordConfirmChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordConfirmChanged implements SignUpFormEvent {
  const factory _PasswordConfirmChanged(final String passwordConfirmStr) =
      _$_PasswordConfirmChanged;

  String get passwordConfirmStr;
  @JsonKey(ignore: true)
  _$$_PasswordConfirmChangedCopyWith<_$_PasswordConfirmChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _$_PasswordChanged));

  @override
  _$_PasswordChanged get _value => super._value as _$_PasswordChanged;

  @override
  $Res call({
    Object? passwordStr = freezed,
  }) {
    return _then(_$_PasswordChanged(
      passwordStr == freezed
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'SignUpFormEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            const DeepCollectionEquality()
                .equals(other.passwordStr, passwordStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(passwordStr));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignUpFormEvent {
  const factory _PasswordChanged(final String passwordStr) = _$_PasswordChanged;

  String get passwordStr;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_SubmittedCopyWith<$Res> {
  __$$_SubmittedCopyWithImpl(
      _$_Submitted _value, $Res Function(_$_Submitted) _then)
      : super(_value, (v) => _then(v as _$_Submitted));

  @override
  _$_Submitted get _value => super._value as _$_Submitted;
}

/// @nodoc

class _$_Submitted implements _Submitted {
  const _$_Submitted();

  @override
  String toString() {
    return 'SignUpFormEvent.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements SignUpFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
abstract class _$$_FirstNameChangedCopyWith<$Res> {
  factory _$$_FirstNameChangedCopyWith(
          _$_FirstNameChanged value, $Res Function(_$_FirstNameChanged) then) =
      __$$_FirstNameChangedCopyWithImpl<$Res>;
  $Res call({String firstNameStr});
}

/// @nodoc
class __$$_FirstNameChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_FirstNameChangedCopyWith<$Res> {
  __$$_FirstNameChangedCopyWithImpl(
      _$_FirstNameChanged _value, $Res Function(_$_FirstNameChanged) _then)
      : super(_value, (v) => _then(v as _$_FirstNameChanged));

  @override
  _$_FirstNameChanged get _value => super._value as _$_FirstNameChanged;

  @override
  $Res call({
    Object? firstNameStr = freezed,
  }) {
    return _then(_$_FirstNameChanged(
      firstNameStr == freezed
          ? _value.firstNameStr
          : firstNameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FirstNameChanged implements _FirstNameChanged {
  const _$_FirstNameChanged(this.firstNameStr);

  @override
  final String firstNameStr;

  @override
  String toString() {
    return 'SignUpFormEvent.firstNameChanged(firstNameStr: $firstNameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirstNameChanged &&
            const DeepCollectionEquality()
                .equals(other.firstNameStr, firstNameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(firstNameStr));

  @JsonKey(ignore: true)
  @override
  _$$_FirstNameChangedCopyWith<_$_FirstNameChanged> get copyWith =>
      __$$_FirstNameChangedCopyWithImpl<_$_FirstNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return firstNameChanged(firstNameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return firstNameChanged?.call(firstNameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(firstNameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return firstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return firstNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(this);
    }
    return orElse();
  }
}

abstract class _FirstNameChanged implements SignUpFormEvent {
  const factory _FirstNameChanged(final String firstNameStr) =
      _$_FirstNameChanged;

  String get firstNameStr;
  @JsonKey(ignore: true)
  _$$_FirstNameChangedCopyWith<_$_FirstNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LastNameChangedCopyWith<$Res> {
  factory _$$_LastNameChangedCopyWith(
          _$_LastNameChanged value, $Res Function(_$_LastNameChanged) then) =
      __$$_LastNameChangedCopyWithImpl<$Res>;
  $Res call({String lastNameStr});
}

/// @nodoc
class __$$_LastNameChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_LastNameChangedCopyWith<$Res> {
  __$$_LastNameChangedCopyWithImpl(
      _$_LastNameChanged _value, $Res Function(_$_LastNameChanged) _then)
      : super(_value, (v) => _then(v as _$_LastNameChanged));

  @override
  _$_LastNameChanged get _value => super._value as _$_LastNameChanged;

  @override
  $Res call({
    Object? lastNameStr = freezed,
  }) {
    return _then(_$_LastNameChanged(
      lastNameStr == freezed
          ? _value.lastNameStr
          : lastNameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LastNameChanged implements _LastNameChanged {
  const _$_LastNameChanged(this.lastNameStr);

  @override
  final String lastNameStr;

  @override
  String toString() {
    return 'SignUpFormEvent.lastNameChanged(lastNameStr: $lastNameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastNameChanged &&
            const DeepCollectionEquality()
                .equals(other.lastNameStr, lastNameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lastNameStr));

  @JsonKey(ignore: true)
  @override
  _$$_LastNameChangedCopyWith<_$_LastNameChanged> get copyWith =>
      __$$_LastNameChangedCopyWithImpl<_$_LastNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return lastNameChanged(lastNameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return lastNameChanged?.call(lastNameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(lastNameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return lastNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class _LastNameChanged implements SignUpFormEvent {
  const factory _LastNameChanged(final String lastNameStr) = _$_LastNameChanged;

  String get lastNameStr;
  @JsonKey(ignore: true)
  _$$_LastNameChangedCopyWith<_$_LastNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserNameChangedCopyWith<$Res> {
  factory _$$_UserNameChangedCopyWith(
          _$_UserNameChanged value, $Res Function(_$_UserNameChanged) then) =
      __$$_UserNameChangedCopyWithImpl<$Res>;
  $Res call({String userNameStr});
}

/// @nodoc
class __$$_UserNameChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_UserNameChangedCopyWith<$Res> {
  __$$_UserNameChangedCopyWithImpl(
      _$_UserNameChanged _value, $Res Function(_$_UserNameChanged) _then)
      : super(_value, (v) => _then(v as _$_UserNameChanged));

  @override
  _$_UserNameChanged get _value => super._value as _$_UserNameChanged;

  @override
  $Res call({
    Object? userNameStr = freezed,
  }) {
    return _then(_$_UserNameChanged(
      userNameStr == freezed
          ? _value.userNameStr
          : userNameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserNameChanged implements _UserNameChanged {
  const _$_UserNameChanged(this.userNameStr);

  @override
  final String userNameStr;

  @override
  String toString() {
    return 'SignUpFormEvent.userNameChanged(userNameStr: $userNameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserNameChanged &&
            const DeepCollectionEquality()
                .equals(other.userNameStr, userNameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userNameStr));

  @JsonKey(ignore: true)
  @override
  _$$_UserNameChangedCopyWith<_$_UserNameChanged> get copyWith =>
      __$$_UserNameChangedCopyWithImpl<_$_UserNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return userNameChanged(userNameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return userNameChanged?.call(userNameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (userNameChanged != null) {
      return userNameChanged(userNameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return userNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return userNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (userNameChanged != null) {
      return userNameChanged(this);
    }
    return orElse();
  }
}

abstract class _UserNameChanged implements SignUpFormEvent {
  const factory _UserNameChanged(final String userNameStr) = _$_UserNameChanged;

  String get userNameStr;
  @JsonKey(ignore: true)
  _$$_UserNameChangedCopyWith<_$_UserNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PhoneNumberChangedCopyWith<$Res> {
  factory _$$_PhoneNumberChangedCopyWith(_$_PhoneNumberChanged value,
          $Res Function(_$_PhoneNumberChanged) then) =
      __$$_PhoneNumberChangedCopyWithImpl<$Res>;
  $Res call({String phoneNumberStr});
}

/// @nodoc
class __$$_PhoneNumberChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res>
    implements _$$_PhoneNumberChangedCopyWith<$Res> {
  __$$_PhoneNumberChangedCopyWithImpl(
      _$_PhoneNumberChanged _value, $Res Function(_$_PhoneNumberChanged) _then)
      : super(_value, (v) => _then(v as _$_PhoneNumberChanged));

  @override
  _$_PhoneNumberChanged get _value => super._value as _$_PhoneNumberChanged;

  @override
  $Res call({
    Object? phoneNumberStr = freezed,
  }) {
    return _then(_$_PhoneNumberChanged(
      phoneNumberStr == freezed
          ? _value.phoneNumberStr
          : phoneNumberStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneNumberChanged implements _PhoneNumberChanged {
  const _$_PhoneNumberChanged(this.phoneNumberStr);

  @override
  final String phoneNumberStr;

  @override
  String toString() {
    return 'SignUpFormEvent.phoneNumberChanged(phoneNumberStr: $phoneNumberStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberChanged &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberStr, phoneNumberStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumberStr));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      __$$_PhoneNumberChangedCopyWithImpl<_$_PhoneNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordConfirmStr) passwordConfirmChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
    required TResult Function(String firstNameStr) firstNameChanged,
    required TResult Function(String lastNameStr) lastNameChanged,
    required TResult Function(String userNameStr) userNameChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
  }) {
    return phoneNumberChanged(phoneNumberStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
  }) {
    return phoneNumberChanged?.call(phoneNumberStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordConfirmStr)? passwordConfirmChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    TResult Function(String firstNameStr)? firstNameChanged,
    TResult Function(String lastNameStr)? lastNameChanged,
    TResult Function(String userNameStr)? userNameChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(phoneNumberStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordConfirmChanged value)
        passwordConfirmChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_UserNameChanged value) userNameChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordConfirmChanged value)? passwordConfirmChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_UserNameChanged value)? userNameChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumberChanged implements SignUpFormEvent {
  const factory _PhoneNumberChanged(final String phoneNumberStr) =
      _$_PhoneNumberChanged;

  String get phoneNumberStr;
  @JsonKey(ignore: true)
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpFormState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get passwordConfirm => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  NotEmptyString get firstName => throw _privateConstructorUsedError;
  NotEmptyString get lastName => throw _privateConstructorUsedError;
  UserName get userName => throw _privateConstructorUsedError;
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpFormStateCopyWith<SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormStateCopyWith<$Res> {
  factory $SignUpFormStateCopyWith(
          SignUpFormState value, $Res Function(SignUpFormState) then) =
      _$SignUpFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Password passwordConfirm,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isSubmitting,
      NotEmptyString firstName,
      NotEmptyString lastName,
      UserName userName,
      PhoneNumber phoneNumber});
}

/// @nodoc
class _$SignUpFormStateCopyWithImpl<$Res>
    implements $SignUpFormStateCopyWith<$Res> {
  _$SignUpFormStateCopyWithImpl(this._value, this._then);

  final SignUpFormState _value;
  // ignore: unused_field
  final $Res Function(SignUpFormState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirm = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirm: passwordConfirm == freezed
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as Password,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpFormStateCopyWith<$Res>
    implements $SignUpFormStateCopyWith<$Res> {
  factory _$$_SignUpFormStateCopyWith(
          _$_SignUpFormState value, $Res Function(_$_SignUpFormState) then) =
      __$$_SignUpFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Password passwordConfirm,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isSubmitting,
      NotEmptyString firstName,
      NotEmptyString lastName,
      UserName userName,
      PhoneNumber phoneNumber});
}

/// @nodoc
class __$$_SignUpFormStateCopyWithImpl<$Res>
    extends _$SignUpFormStateCopyWithImpl<$Res>
    implements _$$_SignUpFormStateCopyWith<$Res> {
  __$$_SignUpFormStateCopyWithImpl(
      _$_SignUpFormState _value, $Res Function(_$_SignUpFormState) _then)
      : super(_value, (v) => _then(v as _$_SignUpFormState));

  @override
  _$_SignUpFormState get _value => super._value as _$_SignUpFormState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirm = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_SignUpFormState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirm: passwordConfirm == freezed
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as Password,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc

class _$_SignUpFormState implements _SignUpFormState {
  const _$_SignUpFormState(
      {required this.emailAddress,
      required this.password,
      required this.passwordConfirm,
      required this.authFailureOrSuccessOption,
      required this.isSubmitting,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phoneNumber});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Password passwordConfirm;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final NotEmptyString firstName;
  @override
  final NotEmptyString lastName;
  @override
  final UserName userName;
  @override
  final PhoneNumber phoneNumber;

  @override
  String toString() {
    return 'SignUpFormState(emailAddress: $emailAddress, password: $password, passwordConfirm: $passwordConfirm, authFailureOrSuccessOption: $authFailureOrSuccessOption, isSubmitting: $isSubmitting, firstName: $firstName, lastName: $lastName, userName: $userName, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpFormState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirm, passwordConfirm) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(passwordConfirm),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpFormStateCopyWith<_$_SignUpFormState> get copyWith =>
      __$$_SignUpFormStateCopyWithImpl<_$_SignUpFormState>(this, _$identity);
}

abstract class _SignUpFormState implements SignUpFormState {
  const factory _SignUpFormState(
      {required final EmailAddress emailAddress,
      required final Password password,
      required final Password passwordConfirm,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption,
      required final bool isSubmitting,
      required final NotEmptyString firstName,
      required final NotEmptyString lastName,
      required final UserName userName,
      required final PhoneNumber phoneNumber}) = _$_SignUpFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Password get passwordConfirm;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  NotEmptyString get firstName;
  @override
  NotEmptyString get lastName;
  @override
  UserName get userName;
  @override
  PhoneNumber get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpFormStateCopyWith<_$_SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
