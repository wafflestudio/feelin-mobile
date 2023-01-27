// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res, SignInFormEvent>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res, $Val extends SignInFormEvent>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmailAddressChangedCopyWith<$Res> {
  factory _$$_EmailAddressChangedCopyWith(_$_EmailAddressChanged value,
          $Res Function(_$_EmailAddressChanged) then) =
      __$$_EmailAddressChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String emailAddressStr});
}

/// @nodoc
class __$$_EmailAddressChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_EmailAddressChanged>
    implements _$$_EmailAddressChangedCopyWith<$Res> {
  __$$_EmailAddressChangedCopyWithImpl(_$_EmailAddressChanged _value,
      $Res Function(_$_EmailAddressChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddressStr = null,
  }) {
    return _then(_$_EmailAddressChanged(
      null == emailAddressStr
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
    return 'SignInFormEvent.emailAddressChanged(emailAddressStr: $emailAddressStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailAddressChanged &&
            (identical(other.emailAddressStr, emailAddressStr) ||
                other.emailAddressStr == emailAddressStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailAddressStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailAddressChangedCopyWith<_$_EmailAddressChanged> get copyWith =>
      __$$_EmailAddressChangedCopyWithImpl<_$_EmailAddressChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return emailAddressChanged(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return emailAddressChanged?.call(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
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
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return emailAddressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return emailAddressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (emailAddressChanged != null) {
      return emailAddressChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailAddressChanged implements SignInFormEvent {
  const factory _EmailAddressChanged(final String emailAddressStr) =
      _$_EmailAddressChanged;

  String get emailAddressStr;
  @JsonKey(ignore: true)
  _$$_EmailAddressChangedCopyWith<_$_EmailAddressChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String passwordStr});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_PasswordChanged>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordStr = null,
  }) {
    return _then(_$_PasswordChanged(
      null == passwordStr
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
    return 'SignInFormEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            (identical(other.passwordStr, passwordStr) ||
                other.passwordStr == passwordStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
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
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignInFormEvent {
  const factory _PasswordChanged(final String passwordStr) = _$_PasswordChanged;

  String get passwordStr;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PhoneNumberChangedCopyWith<$Res> {
  factory _$$_PhoneNumberChangedCopyWith(_$_PhoneNumberChanged value,
          $Res Function(_$_PhoneNumberChanged) then) =
      __$$_PhoneNumberChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumberStr});
}

/// @nodoc
class __$$_PhoneNumberChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_PhoneNumberChanged>
    implements _$$_PhoneNumberChangedCopyWith<$Res> {
  __$$_PhoneNumberChangedCopyWithImpl(
      _$_PhoneNumberChanged _value, $Res Function(_$_PhoneNumberChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumberStr = null,
  }) {
    return _then(_$_PhoneNumberChanged(
      null == phoneNumberStr
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
    return 'SignInFormEvent.phoneNumberChanged(phoneNumberStr: $phoneNumberStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberChanged &&
            (identical(other.phoneNumberStr, phoneNumberStr) ||
                other.phoneNumberStr == phoneNumberStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumberStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      __$$_PhoneNumberChangedCopyWithImpl<_$_PhoneNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return phoneNumberChanged(phoneNumberStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return phoneNumberChanged?.call(phoneNumberStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
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
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumberChanged implements SignInFormEvent {
  const factory _PhoneNumberChanged(final String phoneNumberStr) =
      _$_PhoneNumberChanged;

  String get phoneNumberStr;
  @JsonKey(ignore: true)
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CountryCodeChangedCopyWith<$Res> {
  factory _$$_CountryCodeChangedCopyWith(_$_CountryCodeChanged value,
          $Res Function(_$_CountryCodeChanged) then) =
      __$$_CountryCodeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String countryCodeStr});
}

/// @nodoc
class __$$_CountryCodeChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_CountryCodeChanged>
    implements _$$_CountryCodeChangedCopyWith<$Res> {
  __$$_CountryCodeChangedCopyWithImpl(
      _$_CountryCodeChanged _value, $Res Function(_$_CountryCodeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCodeStr = null,
  }) {
    return _then(_$_CountryCodeChanged(
      null == countryCodeStr
          ? _value.countryCodeStr
          : countryCodeStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CountryCodeChanged implements _CountryCodeChanged {
  const _$_CountryCodeChanged(this.countryCodeStr);

  @override
  final String countryCodeStr;

  @override
  String toString() {
    return 'SignInFormEvent.countryCodeChanged(countryCodeStr: $countryCodeStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryCodeChanged &&
            (identical(other.countryCodeStr, countryCodeStr) ||
                other.countryCodeStr == countryCodeStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCodeStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCodeChangedCopyWith<_$_CountryCodeChanged> get copyWith =>
      __$$_CountryCodeChangedCopyWithImpl<_$_CountryCodeChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return countryCodeChanged(countryCodeStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return countryCodeChanged?.call(countryCodeStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (countryCodeChanged != null) {
      return countryCodeChanged(countryCodeStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return countryCodeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return countryCodeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (countryCodeChanged != null) {
      return countryCodeChanged(this);
    }
    return orElse();
  }
}

abstract class _CountryCodeChanged implements SignInFormEvent {
  const factory _CountryCodeChanged(final String countryCodeStr) =
      _$_CountryCodeChanged;

  String get countryCodeStr;
  @JsonKey(ignore: true)
  _$$_CountryCodeChangedCopyWith<_$_CountryCodeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetEmailCopyWith<$Res> {
  factory _$$_SetEmailCopyWith(
          _$_SetEmail value, $Res Function(_$_SetEmail) then) =
      __$$_SetEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetEmailCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_SetEmail>
    implements _$$_SetEmailCopyWith<$Res> {
  __$$_SetEmailCopyWithImpl(
      _$_SetEmail _value, $Res Function(_$_SetEmail) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetEmail implements _SetEmail {
  const _$_SetEmail();

  @override
  String toString() {
    return 'SignInFormEvent.setEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return setEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return setEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return setEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return setEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail(this);
    }
    return orElse();
  }
}

abstract class _SetEmail implements SignInFormEvent {
  const factory _SetEmail() = _$_SetEmail;
}

/// @nodoc
abstract class _$$_SetPhoneCopyWith<$Res> {
  factory _$$_SetPhoneCopyWith(
          _$_SetPhone value, $Res Function(_$_SetPhone) then) =
      __$$_SetPhoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetPhoneCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_SetPhone>
    implements _$$_SetPhoneCopyWith<$Res> {
  __$$_SetPhoneCopyWithImpl(
      _$_SetPhone _value, $Res Function(_$_SetPhone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetPhone implements _SetPhone {
  const _$_SetPhone();

  @override
  String toString() {
    return 'SignInFormEvent.setPhone()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetPhone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return setPhone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return setPhone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (setPhone != null) {
      return setPhone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return setPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return setPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (setPhone != null) {
      return setPhone(this);
    }
    return orElse();
  }
}

abstract class _SetPhone implements SignInFormEvent {
  const factory _SetPhone() = _$_SetPhone;
}

/// @nodoc
abstract class _$$_PhoneRequestedCopyWith<$Res> {
  factory _$$_PhoneRequestedCopyWith(
          _$_PhoneRequested value, $Res Function(_$_PhoneRequested) then) =
      __$$_PhoneRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PhoneRequestedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_PhoneRequested>
    implements _$$_PhoneRequestedCopyWith<$Res> {
  __$$_PhoneRequestedCopyWithImpl(
      _$_PhoneRequested _value, $Res Function(_$_PhoneRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PhoneRequested implements _PhoneRequested {
  const _$_PhoneRequested();

  @override
  String toString() {
    return 'SignInFormEvent.phoneRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PhoneRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return phoneRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return phoneRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (phoneRequested != null) {
      return phoneRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return phoneRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return phoneRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (phoneRequested != null) {
      return phoneRequested(this);
    }
    return orElse();
  }
}

abstract class _PhoneRequested implements SignInFormEvent {
  const factory _PhoneRequested() = _$_PhoneRequested;
}

/// @nodoc
abstract class _$$_EmailRequestedCopyWith<$Res> {
  factory _$$_EmailRequestedCopyWith(
          _$_EmailRequested value, $Res Function(_$_EmailRequested) then) =
      __$$_EmailRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailRequestedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_EmailRequested>
    implements _$$_EmailRequestedCopyWith<$Res> {
  __$$_EmailRequestedCopyWithImpl(
      _$_EmailRequested _value, $Res Function(_$_EmailRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EmailRequested implements _EmailRequested {
  const _$_EmailRequested();

  @override
  String toString() {
    return 'SignInFormEvent.emailRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmailRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailAddressChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return emailRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return emailRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (emailRequested != null) {
      return emailRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailAddressChanged value) emailAddressChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return emailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return emailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (emailRequested != null) {
      return emailRequested(this);
    }
    return orElse();
  }
}

abstract class _EmailRequested implements SignInFormEvent {
  const factory _EmailRequested() = _$_EmailRequested;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$_Submitted>
    implements _$$_SubmittedCopyWith<$Res> {
  __$$_SubmittedCopyWithImpl(
      _$_Submitted _value, $Res Function(_$_Submitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Submitted implements _Submitted {
  const _$_Submitted();

  @override
  String toString() {
    return 'SignInFormEvent.submitted()';
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
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function(String phoneNumberStr) phoneNumberChanged,
    required TResult Function(String countryCodeStr) countryCodeChanged,
    required TResult Function() setEmail,
    required TResult Function() setPhone,
    required TResult Function() phoneRequested,
    required TResult Function() emailRequested,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddressStr)? emailAddressChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function(String phoneNumberStr)? phoneNumberChanged,
    TResult? Function(String countryCodeStr)? countryCodeChanged,
    TResult? Function()? setEmail,
    TResult? Function()? setPhone,
    TResult? Function()? phoneRequested,
    TResult? Function()? emailRequested,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailAddressChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function(String phoneNumberStr)? phoneNumberChanged,
    TResult Function(String countryCodeStr)? countryCodeChanged,
    TResult Function()? setEmail,
    TResult Function()? setPhone,
    TResult Function()? phoneRequested,
    TResult Function()? emailRequested,
    TResult Function()? submitted,
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
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_CountryCodeChanged value) countryCodeChanged,
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPhone value) setPhone,
    required TResult Function(_PhoneRequested value) phoneRequested,
    required TResult Function(_EmailRequested value) emailRequested,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPhone value)? setPhone,
    TResult? Function(_PhoneRequested value)? phoneRequested,
    TResult? Function(_EmailRequested value)? emailRequested,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailAddressChanged value)? emailAddressChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_CountryCodeChanged value)? countryCodeChanged,
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPhone value)? setPhone,
    TResult Function(_PhoneRequested value)? phoneRequested,
    TResult Function(_EmailRequested value)? emailRequested,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements SignInFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$SignInFormState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  NotEmptyString get countryCode => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, ExistsUser>> get requestFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isRequesting => throw _privateConstructorUsedError;
  bool get signInWithEmail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res, SignInFormState>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      PhoneNumber phoneNumber,
      NotEmptyString countryCode,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      Option<Either<AuthFailure, ExistsUser>> requestFailureOrSuccessOption,
      bool isSubmitting,
      bool isRequesting,
      bool signInWithEmail});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res, $Val extends SignInFormState>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? countryCode = null,
    Object? authFailureOrSuccessOption = null,
    Object? requestFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isRequesting = null,
    Object? signInWithEmail = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      requestFailureOrSuccessOption: null == requestFailureOrSuccessOption
          ? _value.requestFailureOrSuccessOption
          : requestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, ExistsUser>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequesting: null == isRequesting
          ? _value.isRequesting
          : isRequesting // ignore: cast_nullable_to_non_nullable
              as bool,
      signInWithEmail: null == signInWithEmail
          ? _value.signInWithEmail
          : signInWithEmail // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$_SignInFormStateCopyWith(
          _$_SignInFormState value, $Res Function(_$_SignInFormState) then) =
      __$$_SignInFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      PhoneNumber phoneNumber,
      NotEmptyString countryCode,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      Option<Either<AuthFailure, ExistsUser>> requestFailureOrSuccessOption,
      bool isSubmitting,
      bool isRequesting,
      bool signInWithEmail});
}

/// @nodoc
class __$$_SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res, _$_SignInFormState>
    implements _$$_SignInFormStateCopyWith<$Res> {
  __$$_SignInFormStateCopyWithImpl(
      _$_SignInFormState _value, $Res Function(_$_SignInFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? countryCode = null,
    Object? authFailureOrSuccessOption = null,
    Object? requestFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isRequesting = null,
    Object? signInWithEmail = null,
  }) {
    return _then(_$_SignInFormState(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      requestFailureOrSuccessOption: null == requestFailureOrSuccessOption
          ? _value.requestFailureOrSuccessOption
          : requestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, ExistsUser>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequesting: null == isRequesting
          ? _value.isRequesting
          : isRequesting // ignore: cast_nullable_to_non_nullable
              as bool,
      signInWithEmail: null == signInWithEmail
          ? _value.signInWithEmail
          : signInWithEmail // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {required this.emailAddress,
      required this.password,
      required this.phoneNumber,
      required this.countryCode,
      required this.authFailureOrSuccessOption,
      required this.requestFailureOrSuccessOption,
      required this.isSubmitting,
      required this.isRequesting,
      required this.signInWithEmail});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final PhoneNumber phoneNumber;
  @override
  final NotEmptyString countryCode;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  @override
  final Option<Either<AuthFailure, ExistsUser>> requestFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool isRequesting;
  @override
  final bool signInWithEmail;

  @override
  String toString() {
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, phoneNumber: $phoneNumber, countryCode: $countryCode, authFailureOrSuccessOption: $authFailureOrSuccessOption, requestFailureOrSuccessOption: $requestFailureOrSuccessOption, isSubmitting: $isSubmitting, isRequesting: $isRequesting, signInWithEmail: $signInWithEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption) &&
            (identical(other.requestFailureOrSuccessOption,
                    requestFailureOrSuccessOption) ||
                other.requestFailureOrSuccessOption ==
                    requestFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isRequesting, isRequesting) ||
                other.isRequesting == isRequesting) &&
            (identical(other.signInWithEmail, signInWithEmail) ||
                other.signInWithEmail == signInWithEmail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailAddress,
      password,
      phoneNumber,
      countryCode,
      authFailureOrSuccessOption,
      requestFailureOrSuccessOption,
      isSubmitting,
      isRequesting,
      signInWithEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      __$$_SignInFormStateCopyWithImpl<_$_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required final EmailAddress emailAddress,
      required final Password password,
      required final PhoneNumber phoneNumber,
      required final NotEmptyString countryCode,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption,
      required final Option<Either<AuthFailure, ExistsUser>>
          requestFailureOrSuccessOption,
      required final bool isSubmitting,
      required final bool isRequesting,
      required final bool signInWithEmail}) = _$_SignInFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  PhoneNumber get phoneNumber;
  @override
  NotEmptyString get countryCode;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  Option<Either<AuthFailure, ExistsUser>> get requestFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get isRequesting;
  @override
  bool get signInWithEmail;
  @override
  @JsonKey(ignore: true)
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
