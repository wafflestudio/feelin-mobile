// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streaming_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreamingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnectMyAccount,
    required TResult Function() getMyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnectMyAccount,
    TResult? Function()? getMyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnectMyAccount,
    TResult Function()? getMyAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisconnectMyAccount value) disconnectMyAccount,
    required TResult Function(_GetMyAccount value) getMyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult? Function(_GetMyAccount value)? getMyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult Function(_GetMyAccount value)? getMyAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamingEventCopyWith<$Res> {
  factory $StreamingEventCopyWith(
          StreamingEvent value, $Res Function(StreamingEvent) then) =
      _$StreamingEventCopyWithImpl<$Res, StreamingEvent>;
}

/// @nodoc
class _$StreamingEventCopyWithImpl<$Res, $Val extends StreamingEvent>
    implements $StreamingEventCopyWith<$Res> {
  _$StreamingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DisconnectMyAccountCopyWith<$Res> {
  factory _$$_DisconnectMyAccountCopyWith(_$_DisconnectMyAccount value,
          $Res Function(_$_DisconnectMyAccount) then) =
      __$$_DisconnectMyAccountCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectMyAccountCopyWithImpl<$Res>
    extends _$StreamingEventCopyWithImpl<$Res, _$_DisconnectMyAccount>
    implements _$$_DisconnectMyAccountCopyWith<$Res> {
  __$$_DisconnectMyAccountCopyWithImpl(_$_DisconnectMyAccount _value,
      $Res Function(_$_DisconnectMyAccount) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisconnectMyAccount implements _DisconnectMyAccount {
  const _$_DisconnectMyAccount();

  @override
  String toString() {
    return 'StreamingEvent.disconnectMyAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DisconnectMyAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnectMyAccount,
    required TResult Function() getMyAccount,
  }) {
    return disconnectMyAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnectMyAccount,
    TResult? Function()? getMyAccount,
  }) {
    return disconnectMyAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnectMyAccount,
    TResult Function()? getMyAccount,
    required TResult orElse(),
  }) {
    if (disconnectMyAccount != null) {
      return disconnectMyAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisconnectMyAccount value) disconnectMyAccount,
    required TResult Function(_GetMyAccount value) getMyAccount,
  }) {
    return disconnectMyAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult? Function(_GetMyAccount value)? getMyAccount,
  }) {
    return disconnectMyAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult Function(_GetMyAccount value)? getMyAccount,
    required TResult orElse(),
  }) {
    if (disconnectMyAccount != null) {
      return disconnectMyAccount(this);
    }
    return orElse();
  }
}

abstract class _DisconnectMyAccount implements StreamingEvent {
  const factory _DisconnectMyAccount() = _$_DisconnectMyAccount;
}

/// @nodoc
abstract class _$$_GetMyAccountCopyWith<$Res> {
  factory _$$_GetMyAccountCopyWith(
          _$_GetMyAccount value, $Res Function(_$_GetMyAccount) then) =
      __$$_GetMyAccountCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMyAccountCopyWithImpl<$Res>
    extends _$StreamingEventCopyWithImpl<$Res, _$_GetMyAccount>
    implements _$$_GetMyAccountCopyWith<$Res> {
  __$$_GetMyAccountCopyWithImpl(
      _$_GetMyAccount _value, $Res Function(_$_GetMyAccount) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMyAccount implements _GetMyAccount {
  const _$_GetMyAccount();

  @override
  String toString() {
    return 'StreamingEvent.getMyAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMyAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnectMyAccount,
    required TResult Function() getMyAccount,
  }) {
    return getMyAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnectMyAccount,
    TResult? Function()? getMyAccount,
  }) {
    return getMyAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnectMyAccount,
    TResult Function()? getMyAccount,
    required TResult orElse(),
  }) {
    if (getMyAccount != null) {
      return getMyAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisconnectMyAccount value) disconnectMyAccount,
    required TResult Function(_GetMyAccount value) getMyAccount,
  }) {
    return getMyAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult? Function(_GetMyAccount value)? getMyAccount,
  }) {
    return getMyAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisconnectMyAccount value)? disconnectMyAccount,
    TResult Function(_GetMyAccount value)? getMyAccount,
    required TResult orElse(),
  }) {
    if (getMyAccount != null) {
      return getMyAccount(this);
    }
    return orElse();
  }
}

abstract class _GetMyAccount implements StreamingEvent {
  const factory _GetMyAccount() = _$_GetMyAccount;
}

/// @nodoc
mixin _$StreamingState {
  Option<Either<ConnectFailure, VendorAccounts>>
      get fetchAccountFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  Option<Either<ConnectFailure, Unit>> get disconnectFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  Vendor get vendor => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamingStateCopyWith<StreamingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamingStateCopyWith<$Res> {
  factory $StreamingStateCopyWith(
          StreamingState value, $Res Function(StreamingState) then) =
      _$StreamingStateCopyWithImpl<$Res, StreamingState>;
  @useResult
  $Res call(
      {Option<Either<ConnectFailure, VendorAccounts>>
          fetchAccountFailureOrSuccessOption,
      Option<Either<ConnectFailure, Unit>> disconnectFailureOrSuccessOption,
      bool isConnected,
      Vendor vendor,
      String vendorId});
}

/// @nodoc
class _$StreamingStateCopyWithImpl<$Res, $Val extends StreamingState>
    implements $StreamingStateCopyWith<$Res> {
  _$StreamingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchAccountFailureOrSuccessOption = null,
    Object? disconnectFailureOrSuccessOption = null,
    Object? isConnected = null,
    Object? vendor = null,
    Object? vendorId = null,
  }) {
    return _then(_value.copyWith(
      fetchAccountFailureOrSuccessOption: null ==
              fetchAccountFailureOrSuccessOption
          ? _value.fetchAccountFailureOrSuccessOption
          : fetchAccountFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, VendorAccounts>>,
      disconnectFailureOrSuccessOption: null == disconnectFailureOrSuccessOption
          ? _value.disconnectFailureOrSuccessOption
          : disconnectFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, Unit>>,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StreamingStateCopyWith<$Res>
    implements $StreamingStateCopyWith<$Res> {
  factory _$$_StreamingStateCopyWith(
          _$_StreamingState value, $Res Function(_$_StreamingState) then) =
      __$$_StreamingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ConnectFailure, VendorAccounts>>
          fetchAccountFailureOrSuccessOption,
      Option<Either<ConnectFailure, Unit>> disconnectFailureOrSuccessOption,
      bool isConnected,
      Vendor vendor,
      String vendorId});
}

/// @nodoc
class __$$_StreamingStateCopyWithImpl<$Res>
    extends _$StreamingStateCopyWithImpl<$Res, _$_StreamingState>
    implements _$$_StreamingStateCopyWith<$Res> {
  __$$_StreamingStateCopyWithImpl(
      _$_StreamingState _value, $Res Function(_$_StreamingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchAccountFailureOrSuccessOption = null,
    Object? disconnectFailureOrSuccessOption = null,
    Object? isConnected = null,
    Object? vendor = null,
    Object? vendorId = null,
  }) {
    return _then(_$_StreamingState(
      fetchAccountFailureOrSuccessOption: null ==
              fetchAccountFailureOrSuccessOption
          ? _value.fetchAccountFailureOrSuccessOption
          : fetchAccountFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, VendorAccounts>>,
      disconnectFailureOrSuccessOption: null == disconnectFailureOrSuccessOption
          ? _value.disconnectFailureOrSuccessOption
          : disconnectFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, Unit>>,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StreamingState implements _StreamingState {
  const _$_StreamingState(
      {required this.fetchAccountFailureOrSuccessOption,
      required this.disconnectFailureOrSuccessOption,
      required this.isConnected,
      required this.vendor,
      required this.vendorId});

  @override
  final Option<Either<ConnectFailure, VendorAccounts>>
      fetchAccountFailureOrSuccessOption;
  @override
  final Option<Either<ConnectFailure, Unit>> disconnectFailureOrSuccessOption;
  @override
  final bool isConnected;
  @override
  final Vendor vendor;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'StreamingState(fetchAccountFailureOrSuccessOption: $fetchAccountFailureOrSuccessOption, disconnectFailureOrSuccessOption: $disconnectFailureOrSuccessOption, isConnected: $isConnected, vendor: $vendor, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StreamingState &&
            (identical(other.fetchAccountFailureOrSuccessOption,
                    fetchAccountFailureOrSuccessOption) ||
                other.fetchAccountFailureOrSuccessOption ==
                    fetchAccountFailureOrSuccessOption) &&
            (identical(other.disconnectFailureOrSuccessOption,
                    disconnectFailureOrSuccessOption) ||
                other.disconnectFailureOrSuccessOption ==
                    disconnectFailureOrSuccessOption) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchAccountFailureOrSuccessOption,
      disconnectFailureOrSuccessOption,
      isConnected,
      vendor,
      vendorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StreamingStateCopyWith<_$_StreamingState> get copyWith =>
      __$$_StreamingStateCopyWithImpl<_$_StreamingState>(this, _$identity);
}

abstract class _StreamingState implements StreamingState {
  const factory _StreamingState(
      {required final Option<Either<ConnectFailure, VendorAccounts>>
          fetchAccountFailureOrSuccessOption,
      required final Option<Either<ConnectFailure, Unit>>
          disconnectFailureOrSuccessOption,
      required final bool isConnected,
      required final Vendor vendor,
      required final String vendorId}) = _$_StreamingState;

  @override
  Option<Either<ConnectFailure, VendorAccounts>>
      get fetchAccountFailureOrSuccessOption;
  @override
  Option<Either<ConnectFailure, Unit>> get disconnectFailureOrSuccessOption;
  @override
  bool get isConnected;
  @override
  Vendor get vendor;
  @override
  String get vendorId;
  @override
  @JsonKey(ignore: true)
  _$$_StreamingStateCopyWith<_$_StreamingState> get copyWith =>
      throw _privateConstructorUsedError;
}
