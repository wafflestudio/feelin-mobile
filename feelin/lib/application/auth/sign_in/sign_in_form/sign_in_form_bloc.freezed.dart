// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(String accountStr) accountChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class _$$_AccountChangedCopyWith<$Res> {
  factory _$$_AccountChangedCopyWith(
          _$_AccountChanged value, $Res Function(_$_AccountChanged) then) =
      __$$_AccountChangedCopyWithImpl<$Res>;
  $Res call({String accountStr});
}

/// @nodoc
class __$$_AccountChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements _$$_AccountChangedCopyWith<$Res> {
  __$$_AccountChangedCopyWithImpl(
      _$_AccountChanged _value, $Res Function(_$_AccountChanged) _then)
      : super(_value, (v) => _then(v as _$_AccountChanged));

  @override
  _$_AccountChanged get _value => super._value as _$_AccountChanged;

  @override
  $Res call({
    Object? accountStr = freezed,
  }) {
    return _then(_$_AccountChanged(
      accountStr == freezed
          ? _value.accountStr
          : accountStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountChanged implements _AccountChanged {
  const _$_AccountChanged(this.accountStr);

  @override
  final String accountStr;

  @override
  String toString() {
    return 'SignInFormEvent.accountChanged(accountStr: $accountStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountChanged &&
            const DeepCollectionEquality()
                .equals(other.accountStr, accountStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(accountStr));

  @JsonKey(ignore: true)
  @override
  _$$_AccountChangedCopyWith<_$_AccountChanged> get copyWith =>
      __$$_AccountChangedCopyWithImpl<_$_AccountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountStr) accountChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
  }) {
    return accountChanged(accountStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
  }) {
    return accountChanged?.call(accountStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(accountStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return accountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return accountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(this);
    }
    return orElse();
  }
}

abstract class _AccountChanged implements SignInFormEvent {
  const factory _AccountChanged(final String accountStr) = _$_AccountChanged;

  String get accountStr;
  @JsonKey(ignore: true)
  _$$_AccountChangedCopyWith<_$_AccountChanged> get copyWith =>
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
    extends _$SignInFormEventCopyWithImpl<$Res>
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
    return 'SignInFormEvent.passwordChanged(passwordStr: $passwordStr)';
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
    required TResult Function(String accountStr) accountChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
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
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
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
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
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
    required TResult Function(String accountStr) accountChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountStr)? accountChanged,
    TResult Function(String passwordStr)? passwordChanged,
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
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
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
  Account get account => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Token>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {Account account,
      Password password,
      Option<Either<AuthFailure, Token>> authFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? password = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Token>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$_SignInFormStateCopyWith(
          _$_SignInFormState value, $Res Function(_$_SignInFormState) then) =
      __$$_SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Account account,
      Password password,
      Option<Either<AuthFailure, Token>> authFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class __$$_SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$$_SignInFormStateCopyWith<$Res> {
  __$$_SignInFormStateCopyWithImpl(
      _$_SignInFormState _value, $Res Function(_$_SignInFormState) _then)
      : super(_value, (v) => _then(v as _$_SignInFormState));

  @override
  _$_SignInFormState get _value => super._value as _$_SignInFormState;

  @override
  $Res call({
    Object? account = freezed,
    Object? password = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_SignInFormState(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Token>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {required this.account,
      required this.password,
      required this.authFailureOrSuccessOption,
      required this.isSubmitting});

  @override
  final Account account;
  @override
  final Password password;
  @override
  final Option<Either<AuthFailure, Token>> authFailureOrSuccessOption;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'SignInFormState(account: $account, password: $password, authFailureOrSuccessOption: $authFailureOrSuccessOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFormState &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      __$$_SignInFormStateCopyWithImpl<_$_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required final Account account,
      required final Password password,
      required final Option<Either<AuthFailure, Token>>
          authFailureOrSuccessOption,
      required final bool isSubmitting}) = _$_SignInFormState;

  @override
  Account get account;
  @override
  Password get password;
  @override
  Option<Either<AuthFailure, Token>> get authFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
