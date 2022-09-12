// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_auth_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailAuthFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailChanged,
    required TResult Function(String codeStr) codeChanged,
    required TResult Function() submitted,
    required TResult Function() requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Requested value) requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAuthFormEventCopyWith<$Res> {
  factory $EmailAuthFormEventCopyWith(
          EmailAuthFormEvent value, $Res Function(EmailAuthFormEvent) then) =
      _$EmailAuthFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailAuthFormEventCopyWithImpl<$Res>
    implements $EmailAuthFormEventCopyWith<$Res> {
  _$EmailAuthFormEventCopyWithImpl(this._value, this._then);

  final EmailAuthFormEvent _value;
  // ignore: unused_field
  final $Res Function(EmailAuthFormEvent) _then;
}

/// @nodoc
abstract class _$$_EmailChangedCopyWith<$Res> {
  factory _$$_EmailChangedCopyWith(
          _$_EmailChanged value, $Res Function(_$_EmailChanged) then) =
      __$$_EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailAddressStr});
}

/// @nodoc
class __$$_EmailChangedCopyWithImpl<$Res>
    extends _$EmailAuthFormEventCopyWithImpl<$Res>
    implements _$$_EmailChangedCopyWith<$Res> {
  __$$_EmailChangedCopyWithImpl(
      _$_EmailChanged _value, $Res Function(_$_EmailChanged) _then)
      : super(_value, (v) => _then(v as _$_EmailChanged));

  @override
  _$_EmailChanged get _value => super._value as _$_EmailChanged;

  @override
  $Res call({
    Object? emailAddressStr = freezed,
  }) {
    return _then(_$_EmailChanged(
      emailAddressStr == freezed
          ? _value.emailAddressStr
          : emailAddressStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.emailAddressStr);

  @override
  final String emailAddressStr;

  @override
  String toString() {
    return 'EmailAuthFormEvent.emailChanged(emailAddressStr: $emailAddressStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailChanged &&
            const DeepCollectionEquality()
                .equals(other.emailAddressStr, emailAddressStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(emailAddressStr));

  @JsonKey(ignore: true)
  @override
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      __$$_EmailChangedCopyWithImpl<_$_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailChanged,
    required TResult Function(String codeStr) codeChanged,
    required TResult Function() submitted,
    required TResult Function() requested,
  }) {
    return emailChanged(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
  }) {
    return emailChanged?.call(emailAddressStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailAddressStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Requested value) requested,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements EmailAuthFormEvent {
  const factory _EmailChanged(final String emailAddressStr) = _$_EmailChanged;

  String get emailAddressStr;
  @JsonKey(ignore: true)
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CodeChangedCopyWith<$Res> {
  factory _$$_CodeChangedCopyWith(
          _$_CodeChanged value, $Res Function(_$_CodeChanged) then) =
      __$$_CodeChangedCopyWithImpl<$Res>;
  $Res call({String codeStr});
}

/// @nodoc
class __$$_CodeChangedCopyWithImpl<$Res>
    extends _$EmailAuthFormEventCopyWithImpl<$Res>
    implements _$$_CodeChangedCopyWith<$Res> {
  __$$_CodeChangedCopyWithImpl(
      _$_CodeChanged _value, $Res Function(_$_CodeChanged) _then)
      : super(_value, (v) => _then(v as _$_CodeChanged));

  @override
  _$_CodeChanged get _value => super._value as _$_CodeChanged;

  @override
  $Res call({
    Object? codeStr = freezed,
  }) {
    return _then(_$_CodeChanged(
      codeStr == freezed
          ? _value.codeStr
          : codeStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CodeChanged implements _CodeChanged {
  const _$_CodeChanged(this.codeStr);

  @override
  final String codeStr;

  @override
  String toString() {
    return 'EmailAuthFormEvent.codeChanged(codeStr: $codeStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeChanged &&
            const DeepCollectionEquality().equals(other.codeStr, codeStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(codeStr));

  @JsonKey(ignore: true)
  @override
  _$$_CodeChangedCopyWith<_$_CodeChanged> get copyWith =>
      __$$_CodeChangedCopyWithImpl<_$_CodeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailChanged,
    required TResult Function(String codeStr) codeChanged,
    required TResult Function() submitted,
    required TResult Function() requested,
  }) {
    return codeChanged(codeStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
  }) {
    return codeChanged?.call(codeStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(codeStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Requested value) requested,
  }) {
    return codeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
  }) {
    return codeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(this);
    }
    return orElse();
  }
}

abstract class _CodeChanged implements EmailAuthFormEvent {
  const factory _CodeChanged(final String codeStr) = _$_CodeChanged;

  String get codeStr;
  @JsonKey(ignore: true)
  _$$_CodeChangedCopyWith<_$_CodeChanged> get copyWith =>
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
    extends _$EmailAuthFormEventCopyWithImpl<$Res>
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
    return 'EmailAuthFormEvent.submitted()';
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
    required TResult Function(String emailAddressStr) emailChanged,
    required TResult Function(String codeStr) codeChanged,
    required TResult Function() submitted,
    required TResult Function() requested,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
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
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Requested value) requested,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements EmailAuthFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
abstract class _$$_RequestedCopyWith<$Res> {
  factory _$$_RequestedCopyWith(
          _$_Requested value, $Res Function(_$_Requested) then) =
      __$$_RequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RequestedCopyWithImpl<$Res>
    extends _$EmailAuthFormEventCopyWithImpl<$Res>
    implements _$$_RequestedCopyWith<$Res> {
  __$$_RequestedCopyWithImpl(
      _$_Requested _value, $Res Function(_$_Requested) _then)
      : super(_value, (v) => _then(v as _$_Requested));

  @override
  _$_Requested get _value => super._value as _$_Requested;
}

/// @nodoc

class _$_Requested implements _Requested {
  const _$_Requested();

  @override
  String toString() {
    return 'EmailAuthFormEvent.requested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Requested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddressStr) emailChanged,
    required TResult Function(String codeStr) codeChanged,
    required TResult Function() submitted,
    required TResult Function() requested,
  }) {
    return requested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
  }) {
    return requested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddressStr)? emailChanged,
    TResult Function(String codeStr)? codeChanged,
    TResult Function()? submitted,
    TResult Function()? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Requested value) requested,
  }) {
    return requested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
  }) {
    return requested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Requested value)? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested(this);
    }
    return orElse();
  }
}

abstract class _Requested implements EmailAuthFormEvent {
  const factory _Requested() = _$_Requested;
}

/// @nodoc
mixin _$EmailAuthFormState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  EmailAuthCode get code => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isRequested => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailAuthFormStateCopyWith<EmailAuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAuthFormStateCopyWith<$Res> {
  factory $EmailAuthFormStateCopyWith(
          EmailAuthFormState value, $Res Function(EmailAuthFormState) then) =
      _$EmailAuthFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      EmailAuthCode code,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isSubmitting,
      bool isRequested});
}

/// @nodoc
class _$EmailAuthFormStateCopyWithImpl<$Res>
    implements $EmailAuthFormStateCopyWith<$Res> {
  _$EmailAuthFormStateCopyWithImpl(this._value, this._then);

  final EmailAuthFormState _value;
  // ignore: unused_field
  final $Res Function(EmailAuthFormState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? code = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? isRequested = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as EmailAuthCode,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequested: isRequested == freezed
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_EmailAuthFormStateCopyWith<$Res>
    implements $EmailAuthFormStateCopyWith<$Res> {
  factory _$$_EmailAuthFormStateCopyWith(_$_EmailAuthFormState value,
          $Res Function(_$_EmailAuthFormState) then) =
      __$$_EmailAuthFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      EmailAuthCode code,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isSubmitting,
      bool isRequested});
}

/// @nodoc
class __$$_EmailAuthFormStateCopyWithImpl<$Res>
    extends _$EmailAuthFormStateCopyWithImpl<$Res>
    implements _$$_EmailAuthFormStateCopyWith<$Res> {
  __$$_EmailAuthFormStateCopyWithImpl(
      _$_EmailAuthFormState _value, $Res Function(_$_EmailAuthFormState) _then)
      : super(_value, (v) => _then(v as _$_EmailAuthFormState));

  @override
  _$_EmailAuthFormState get _value => super._value as _$_EmailAuthFormState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? code = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? isRequested = freezed,
  }) {
    return _then(_$_EmailAuthFormState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as EmailAuthCode,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequested: isRequested == freezed
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EmailAuthFormState implements _EmailAuthFormState {
  const _$_EmailAuthFormState(
      {required this.emailAddress,
      required this.code,
      required this.authFailureOrSuccessOption,
      required this.isSubmitting,
      required this.isRequested});

  @override
  final EmailAddress emailAddress;
  @override
  final EmailAuthCode code;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool isRequested;

  @override
  String toString() {
    return 'EmailAuthFormState(emailAddress: $emailAddress, code: $code, authFailureOrSuccessOption: $authFailureOrSuccessOption, isSubmitting: $isSubmitting, isRequested: $isRequested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailAuthFormState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isRequested, isRequested));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isRequested));

  @JsonKey(ignore: true)
  @override
  _$$_EmailAuthFormStateCopyWith<_$_EmailAuthFormState> get copyWith =>
      __$$_EmailAuthFormStateCopyWithImpl<_$_EmailAuthFormState>(
          this, _$identity);
}

abstract class _EmailAuthFormState implements EmailAuthFormState {
  const factory _EmailAuthFormState(
      {required final EmailAddress emailAddress,
      required final EmailAuthCode code,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption,
      required final bool isSubmitting,
      required final bool isRequested}) = _$_EmailAuthFormState;

  @override
  EmailAddress get emailAddress;
  @override
  EmailAuthCode get code;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get isRequested;
  @override
  @JsonKey(ignore: true)
  _$$_EmailAuthFormStateCopyWith<_$_EmailAuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
