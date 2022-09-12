// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$$ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$ExceedingLengthCopyWith(_$ExceedingLength<T> value,
          $Res Function(_$ExceedingLength<T>) then) =
      __$$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

/// @nodoc
class __$$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$ExceedingLengthCopyWith<T, $Res> {
  __$$ExceedingLengthCopyWithImpl(
      _$ExceedingLength<T> _value, $Res Function(_$ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as _$ExceedingLength<T>));

  @override
  _$ExceedingLength<T> get _value => super._value as _$ExceedingLength<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
    Object? max = freezed,
  }) {
    return _then(_$ExceedingLength<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExceedingLength<T> implements ExceedingLength<T> {
  const _$ExceedingLength({required this.failedValue, required this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceedingLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            const DeepCollectionEquality().equals(other.max, max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failedValue),
      const DeepCollectionEquality().hash(max));

  @JsonKey(ignore: true)
  @override
  _$$ExceedingLengthCopyWith<T, _$ExceedingLength<T>> get copyWith =>
      __$$ExceedingLengthCopyWithImpl<T, _$ExceedingLength<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return exceedingLength?.call(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return exceedingLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength(
      {required final T failedValue,
      required final int max}) = _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  @JsonKey(ignore: true)
  _$$ExceedingLengthCopyWith<T, _$ExceedingLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$EmptyCopyWith(_$Empty<T> value, $Res Function(_$Empty<T>) then) =
      __$$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$EmptyCopyWith<T, $Res> {
  __$$EmptyCopyWithImpl(_$Empty<T> _value, $Res Function(_$Empty<T>) _then)
      : super(_value, (v) => _then(v as _$Empty<T>));

  @override
  _$Empty<T> get _value => super._value as _$Empty<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$Empty<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Empty<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$EmptyCopyWith<T, _$Empty<T>> get copyWith =>
      __$$EmptyCopyWithImpl<T, _$Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({required final T failedValue}) = _$Empty<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$EmptyCopyWith<T, _$Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidEmail<T>));

  @override
  _$InvalidEmail<T> get _value => super._value as _$InvalidEmail<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({required final T failedValue}) =
      _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$ShortPasswordCopyWith(
          _$ShortPassword<T> value, $Res Function(_$ShortPassword<T>) then) =
      __$$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$ShortPasswordCopyWith<T, $Res> {
  __$$ShortPasswordCopyWithImpl(
      _$ShortPassword<T> _value, $Res Function(_$ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as _$ShortPassword<T>));

  @override
  _$ShortPassword<T> get _value => super._value as _$ShortPassword<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$ShortPassword<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      __$$ShortPasswordCopyWithImpl<T, _$ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({required final T failedValue}) =
      _$ShortPassword<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailAuthCodeCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailAuthCodeCopyWith(_$InvalidEmailAuthCode<T> value,
          $Res Function(_$InvalidEmailAuthCode<T>) then) =
      __$$InvalidEmailAuthCodeCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidEmailAuthCodeCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidEmailAuthCodeCopyWith<T, $Res> {
  __$$InvalidEmailAuthCodeCopyWithImpl(_$InvalidEmailAuthCode<T> _value,
      $Res Function(_$InvalidEmailAuthCode<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidEmailAuthCode<T>));

  @override
  _$InvalidEmailAuthCode<T> get _value =>
      super._value as _$InvalidEmailAuthCode<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmailAuthCode<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmailAuthCode<T> implements InvalidEmailAuthCode<T> {
  const _$InvalidEmailAuthCode({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmailAuthCode(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailAuthCode<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidEmailAuthCodeCopyWith<T, _$InvalidEmailAuthCode<T>> get copyWith =>
      __$$InvalidEmailAuthCodeCopyWithImpl<T, _$InvalidEmailAuthCode<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return invalidEmailAuthCode(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return invalidEmailAuthCode?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidEmailAuthCode != null) {
      return invalidEmailAuthCode(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return invalidEmailAuthCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return invalidEmailAuthCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidEmailAuthCode != null) {
      return invalidEmailAuthCode(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailAuthCode<T> implements ValueFailure<T> {
  const factory InvalidEmailAuthCode({required final T failedValue}) =
      _$InvalidEmailAuthCode<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailAuthCodeCopyWith<T, _$InvalidEmailAuthCode<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPhoneNumCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidPhoneNumCopyWith(_$InvalidPhoneNum<T> value,
          $Res Function(_$InvalidPhoneNum<T>) then) =
      __$$InvalidPhoneNumCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidPhoneNumCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidPhoneNumCopyWith<T, $Res> {
  __$$InvalidPhoneNumCopyWithImpl(
      _$InvalidPhoneNum<T> _value, $Res Function(_$InvalidPhoneNum<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidPhoneNum<T>));

  @override
  _$InvalidPhoneNum<T> get _value => super._value as _$InvalidPhoneNum<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidPhoneNum<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidPhoneNum<T> implements InvalidPhoneNum<T> {
  const _$InvalidPhoneNum({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPhoneNum(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPhoneNum<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidPhoneNumCopyWith<T, _$InvalidPhoneNum<T>> get copyWith =>
      __$$InvalidPhoneNumCopyWithImpl<T, _$InvalidPhoneNum<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return invalidPhoneNum(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return invalidPhoneNum?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidPhoneNum != null) {
      return invalidPhoneNum(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return invalidPhoneNum(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return invalidPhoneNum?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidPhoneNum != null) {
      return invalidPhoneNum(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneNum<T> implements ValueFailure<T> {
  const factory InvalidPhoneNum({required final T failedValue}) =
      _$InvalidPhoneNum<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPhoneNumCopyWith<T, _$InvalidPhoneNum<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPhoneNumberCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidPhoneNumberCopyWith(_$InvalidPhoneNumber<T> value,
          $Res Function(_$InvalidPhoneNumber<T>) then) =
      __$$InvalidPhoneNumberCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidPhoneNumberCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidPhoneNumberCopyWith<T, $Res> {
  __$$InvalidPhoneNumberCopyWithImpl(_$InvalidPhoneNumber<T> _value,
      $Res Function(_$InvalidPhoneNumber<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidPhoneNumber<T>));

  @override
  _$InvalidPhoneNumber<T> get _value => super._value as _$InvalidPhoneNumber<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidPhoneNumber<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidPhoneNumber<T> implements InvalidPhoneNumber<T> {
  const _$InvalidPhoneNumber({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUserName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPhoneNumber<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidPhoneNumberCopyWith<T, _$InvalidPhoneNumber<T>> get copyWith =>
      __$$InvalidPhoneNumberCopyWithImpl<T, _$InvalidPhoneNumber<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return invalidUserName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return invalidUserName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return invalidUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return invalidUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneNumber<T> implements ValueFailure<T> {
  const factory InvalidPhoneNumber({required final T failedValue}) =
      _$InvalidPhoneNumber<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPhoneNumberCopyWith<T, _$InvalidPhoneNumber<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WrongPasswordConfirmCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$WrongPasswordConfirmCopyWith(_$WrongPasswordConfirm<T> value,
          $Res Function(_$WrongPasswordConfirm<T>) then) =
      __$$WrongPasswordConfirmCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$WrongPasswordConfirmCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$WrongPasswordConfirmCopyWith<T, $Res> {
  __$$WrongPasswordConfirmCopyWithImpl(_$WrongPasswordConfirm<T> _value,
      $Res Function(_$WrongPasswordConfirm<T>) _then)
      : super(_value, (v) => _then(v as _$WrongPasswordConfirm<T>));

  @override
  _$WrongPasswordConfirm<T> get _value =>
      super._value as _$WrongPasswordConfirm<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$WrongPasswordConfirm<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$WrongPasswordConfirm<T> implements WrongPasswordConfirm<T> {
  const _$WrongPasswordConfirm({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.wrongPasswordConfirm(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongPasswordConfirm<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$WrongPasswordConfirmCopyWith<T, _$WrongPasswordConfirm<T>> get copyWith =>
      __$$WrongPasswordConfirmCopyWithImpl<T, _$WrongPasswordConfirm<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return wrongPasswordConfirm(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return wrongPasswordConfirm?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (wrongPasswordConfirm != null) {
      return wrongPasswordConfirm(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return wrongPasswordConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return wrongPasswordConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (wrongPasswordConfirm != null) {
      return wrongPasswordConfirm(this);
    }
    return orElse();
  }
}

abstract class WrongPasswordConfirm<T> implements ValueFailure<T> {
  const factory WrongPasswordConfirm({required final T failedValue}) =
      _$WrongPasswordConfirm<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$WrongPasswordConfirmCopyWith<T, _$WrongPasswordConfirm<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidUrlCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidUrlCopyWith(
          _$InvalidUrl<T> value, $Res Function(_$InvalidUrl<T>) then) =
      __$$InvalidUrlCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidUrlCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidUrlCopyWith<T, $Res> {
  __$$InvalidUrlCopyWithImpl(
      _$InvalidUrl<T> _value, $Res Function(_$InvalidUrl<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidUrl<T>));

  @override
  _$InvalidUrl<T> get _value => super._value as _$InvalidUrl<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidUrl<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidUrl<T> implements InvalidUrl<T> {
  const _$InvalidUrl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUrl(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidUrl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidUrlCopyWith<T, _$InvalidUrl<T>> get copyWith =>
      __$$InvalidUrlCopyWithImpl<T, _$InvalidUrl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) empty,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) invalidEmailAuthCode,
    required TResult Function(T failedValue) invalidPhoneNum,
    required TResult Function(T failedValue) invalidUserName,
    required TResult Function(T failedValue) wrongPasswordConfirm,
    required TResult Function(T failedValue) invalidUrl,
  }) {
    return invalidUrl(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
  }) {
    return invalidUrl?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? empty,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? invalidEmailAuthCode,
    TResult Function(T failedValue)? invalidPhoneNum,
    TResult Function(T failedValue)? invalidUserName,
    TResult Function(T failedValue)? wrongPasswordConfirm,
    TResult Function(T failedValue)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidUrl != null) {
      return invalidUrl(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(InvalidEmailAuthCode<T> value)
        invalidEmailAuthCode,
    required TResult Function(InvalidPhoneNum<T> value) invalidPhoneNum,
    required TResult Function(InvalidPhoneNumber<T> value) invalidUserName,
    required TResult Function(WrongPasswordConfirm<T> value)
        wrongPasswordConfirm,
    required TResult Function(InvalidUrl<T> value) invalidUrl,
  }) {
    return invalidUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
  }) {
    return invalidUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(InvalidEmailAuthCode<T> value)? invalidEmailAuthCode,
    TResult Function(InvalidPhoneNum<T> value)? invalidPhoneNum,
    TResult Function(InvalidPhoneNumber<T> value)? invalidUserName,
    TResult Function(WrongPasswordConfirm<T> value)? wrongPasswordConfirm,
    TResult Function(InvalidUrl<T> value)? invalidUrl,
    required TResult orElse(),
  }) {
    if (invalidUrl != null) {
      return invalidUrl(this);
    }
    return orElse();
  }
}

abstract class InvalidUrl<T> implements ValueFailure<T> {
  const factory InvalidUrl({required final T failedValue}) = _$InvalidUrl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidUrlCopyWith<T, _$InvalidUrl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
