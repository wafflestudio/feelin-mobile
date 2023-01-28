// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_streaming_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectStreamingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String vendorStr) requestLogin,
    required TResult Function() spotifyLogin,
    required TResult Function(String token, String id) appleMusicLogin,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String vendorStr)? requestLogin,
    TResult? Function()? spotifyLogin,
    TResult? Function(String token, String id)? appleMusicLogin,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String vendorStr)? requestLogin,
    TResult Function()? spotifyLogin,
    TResult Function(String token, String id)? appleMusicLogin,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_SpotifyLogin value) spotifyLogin,
    required TResult Function(_AppleMusicLogin value) appleMusicLogin,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_SpotifyLogin value)? spotifyLogin,
    TResult? Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_SpotifyLogin value)? spotifyLogin,
    TResult Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectStreamingEventCopyWith<$Res> {
  factory $ConnectStreamingEventCopyWith(ConnectStreamingEvent value,
          $Res Function(ConnectStreamingEvent) then) =
      _$ConnectStreamingEventCopyWithImpl<$Res, ConnectStreamingEvent>;
}

/// @nodoc
class _$ConnectStreamingEventCopyWithImpl<$Res,
        $Val extends ConnectStreamingEvent>
    implements $ConnectStreamingEventCopyWith<$Res> {
  _$ConnectStreamingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RequestLoginCopyWith<$Res> {
  factory _$$_RequestLoginCopyWith(
          _$_RequestLogin value, $Res Function(_$_RequestLogin) then) =
      __$$_RequestLoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String vendorStr});
}

/// @nodoc
class __$$_RequestLoginCopyWithImpl<$Res>
    extends _$ConnectStreamingEventCopyWithImpl<$Res, _$_RequestLogin>
    implements _$$_RequestLoginCopyWith<$Res> {
  __$$_RequestLoginCopyWithImpl(
      _$_RequestLogin _value, $Res Function(_$_RequestLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorStr = null,
  }) {
    return _then(_$_RequestLogin(
      null == vendorStr
          ? _value.vendorStr
          : vendorStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RequestLogin implements _RequestLogin {
  const _$_RequestLogin(this.vendorStr);

  @override
  final String vendorStr;

  @override
  String toString() {
    return 'ConnectStreamingEvent.requestLogin(vendorStr: $vendorStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestLogin &&
            (identical(other.vendorStr, vendorStr) ||
                other.vendorStr == vendorStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vendorStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestLoginCopyWith<_$_RequestLogin> get copyWith =>
      __$$_RequestLoginCopyWithImpl<_$_RequestLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String vendorStr) requestLogin,
    required TResult Function() spotifyLogin,
    required TResult Function(String token, String id) appleMusicLogin,
    required TResult Function() submitted,
  }) {
    return requestLogin(vendorStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String vendorStr)? requestLogin,
    TResult? Function()? spotifyLogin,
    TResult? Function(String token, String id)? appleMusicLogin,
    TResult? Function()? submitted,
  }) {
    return requestLogin?.call(vendorStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String vendorStr)? requestLogin,
    TResult Function()? spotifyLogin,
    TResult Function(String token, String id)? appleMusicLogin,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (requestLogin != null) {
      return requestLogin(vendorStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_SpotifyLogin value) spotifyLogin,
    required TResult Function(_AppleMusicLogin value) appleMusicLogin,
    required TResult Function(_Submitted value) submitted,
  }) {
    return requestLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_SpotifyLogin value)? spotifyLogin,
    TResult? Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return requestLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_SpotifyLogin value)? spotifyLogin,
    TResult Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (requestLogin != null) {
      return requestLogin(this);
    }
    return orElse();
  }
}

abstract class _RequestLogin implements ConnectStreamingEvent {
  const factory _RequestLogin(final String vendorStr) = _$_RequestLogin;

  String get vendorStr;
  @JsonKey(ignore: true)
  _$$_RequestLoginCopyWith<_$_RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SpotifyLoginCopyWith<$Res> {
  factory _$$_SpotifyLoginCopyWith(
          _$_SpotifyLogin value, $Res Function(_$_SpotifyLogin) then) =
      __$$_SpotifyLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SpotifyLoginCopyWithImpl<$Res>
    extends _$ConnectStreamingEventCopyWithImpl<$Res, _$_SpotifyLogin>
    implements _$$_SpotifyLoginCopyWith<$Res> {
  __$$_SpotifyLoginCopyWithImpl(
      _$_SpotifyLogin _value, $Res Function(_$_SpotifyLogin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SpotifyLogin implements _SpotifyLogin {
  const _$_SpotifyLogin();

  @override
  String toString() {
    return 'ConnectStreamingEvent.spotifyLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SpotifyLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String vendorStr) requestLogin,
    required TResult Function() spotifyLogin,
    required TResult Function(String token, String id) appleMusicLogin,
    required TResult Function() submitted,
  }) {
    return spotifyLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String vendorStr)? requestLogin,
    TResult? Function()? spotifyLogin,
    TResult? Function(String token, String id)? appleMusicLogin,
    TResult? Function()? submitted,
  }) {
    return spotifyLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String vendorStr)? requestLogin,
    TResult Function()? spotifyLogin,
    TResult Function(String token, String id)? appleMusicLogin,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (spotifyLogin != null) {
      return spotifyLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_SpotifyLogin value) spotifyLogin,
    required TResult Function(_AppleMusicLogin value) appleMusicLogin,
    required TResult Function(_Submitted value) submitted,
  }) {
    return spotifyLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_SpotifyLogin value)? spotifyLogin,
    TResult? Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return spotifyLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_SpotifyLogin value)? spotifyLogin,
    TResult Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (spotifyLogin != null) {
      return spotifyLogin(this);
    }
    return orElse();
  }
}

abstract class _SpotifyLogin implements ConnectStreamingEvent {
  const factory _SpotifyLogin() = _$_SpotifyLogin;
}

/// @nodoc
abstract class _$$_AppleMusicLoginCopyWith<$Res> {
  factory _$$_AppleMusicLoginCopyWith(
          _$_AppleMusicLogin value, $Res Function(_$_AppleMusicLogin) then) =
      __$$_AppleMusicLoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String id});
}

/// @nodoc
class __$$_AppleMusicLoginCopyWithImpl<$Res>
    extends _$ConnectStreamingEventCopyWithImpl<$Res, _$_AppleMusicLogin>
    implements _$$_AppleMusicLoginCopyWith<$Res> {
  __$$_AppleMusicLoginCopyWithImpl(
      _$_AppleMusicLogin _value, $Res Function(_$_AppleMusicLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? id = null,
  }) {
    return _then(_$_AppleMusicLogin(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppleMusicLogin implements _AppleMusicLogin {
  const _$_AppleMusicLogin(this.token, this.id);

  @override
  final String token;
  @override
  final String id;

  @override
  String toString() {
    return 'ConnectStreamingEvent.appleMusicLogin(token: $token, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppleMusicLogin &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppleMusicLoginCopyWith<_$_AppleMusicLogin> get copyWith =>
      __$$_AppleMusicLoginCopyWithImpl<_$_AppleMusicLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String vendorStr) requestLogin,
    required TResult Function() spotifyLogin,
    required TResult Function(String token, String id) appleMusicLogin,
    required TResult Function() submitted,
  }) {
    return appleMusicLogin(token, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String vendorStr)? requestLogin,
    TResult? Function()? spotifyLogin,
    TResult? Function(String token, String id)? appleMusicLogin,
    TResult? Function()? submitted,
  }) {
    return appleMusicLogin?.call(token, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String vendorStr)? requestLogin,
    TResult Function()? spotifyLogin,
    TResult Function(String token, String id)? appleMusicLogin,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (appleMusicLogin != null) {
      return appleMusicLogin(token, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_SpotifyLogin value) spotifyLogin,
    required TResult Function(_AppleMusicLogin value) appleMusicLogin,
    required TResult Function(_Submitted value) submitted,
  }) {
    return appleMusicLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_SpotifyLogin value)? spotifyLogin,
    TResult? Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return appleMusicLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_SpotifyLogin value)? spotifyLogin,
    TResult Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (appleMusicLogin != null) {
      return appleMusicLogin(this);
    }
    return orElse();
  }
}

abstract class _AppleMusicLogin implements ConnectStreamingEvent {
  const factory _AppleMusicLogin(final String token, final String id) =
      _$_AppleMusicLogin;

  String get token;
  String get id;
  @JsonKey(ignore: true)
  _$$_AppleMusicLoginCopyWith<_$_AppleMusicLogin> get copyWith =>
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
    extends _$ConnectStreamingEventCopyWithImpl<$Res, _$_Submitted>
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
    return 'ConnectStreamingEvent.submitted()';
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
    required TResult Function(String vendorStr) requestLogin,
    required TResult Function() spotifyLogin,
    required TResult Function(String token, String id) appleMusicLogin,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String vendorStr)? requestLogin,
    TResult? Function()? spotifyLogin,
    TResult? Function(String token, String id)? appleMusicLogin,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String vendorStr)? requestLogin,
    TResult Function()? spotifyLogin,
    TResult Function(String token, String id)? appleMusicLogin,
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
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_SpotifyLogin value) spotifyLogin,
    required TResult Function(_AppleMusicLogin value) appleMusicLogin,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_SpotifyLogin value)? spotifyLogin,
    TResult? Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_SpotifyLogin value)? spotifyLogin,
    TResult Function(_AppleMusicLogin value)? appleMusicLogin,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements ConnectStreamingEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$ConnectStreamingState {
  Option<Either<ConnectFailure, RedirectUrl>>
      get urlRequestFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  Option<Either<ConnectFailure, Unit>> get requestFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectStreamingStateCopyWith<ConnectStreamingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectStreamingStateCopyWith<$Res> {
  factory $ConnectStreamingStateCopyWith(ConnectStreamingState value,
          $Res Function(ConnectStreamingState) then) =
      _$ConnectStreamingStateCopyWithImpl<$Res, ConnectStreamingState>;
  @useResult
  $Res call(
      {Option<Either<ConnectFailure, RedirectUrl>>
          urlRequestFailureOrSuccessOption,
      Option<Either<ConnectFailure, Unit>> requestFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class _$ConnectStreamingStateCopyWithImpl<$Res,
        $Val extends ConnectStreamingState>
    implements $ConnectStreamingStateCopyWith<$Res> {
  _$ConnectStreamingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlRequestFailureOrSuccessOption = null,
    Object? requestFailureOrSuccessOption = null,
    Object? isSubmitting = null,
  }) {
    return _then(_value.copyWith(
      urlRequestFailureOrSuccessOption: null == urlRequestFailureOrSuccessOption
          ? _value.urlRequestFailureOrSuccessOption
          : urlRequestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, RedirectUrl>>,
      requestFailureOrSuccessOption: null == requestFailureOrSuccessOption
          ? _value.requestFailureOrSuccessOption
          : requestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, Unit>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectStreamingStateCopyWith<$Res>
    implements $ConnectStreamingStateCopyWith<$Res> {
  factory _$$_ConnectStreamingStateCopyWith(_$_ConnectStreamingState value,
          $Res Function(_$_ConnectStreamingState) then) =
      __$$_ConnectStreamingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ConnectFailure, RedirectUrl>>
          urlRequestFailureOrSuccessOption,
      Option<Either<ConnectFailure, Unit>> requestFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class __$$_ConnectStreamingStateCopyWithImpl<$Res>
    extends _$ConnectStreamingStateCopyWithImpl<$Res, _$_ConnectStreamingState>
    implements _$$_ConnectStreamingStateCopyWith<$Res> {
  __$$_ConnectStreamingStateCopyWithImpl(_$_ConnectStreamingState _value,
      $Res Function(_$_ConnectStreamingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlRequestFailureOrSuccessOption = null,
    Object? requestFailureOrSuccessOption = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$_ConnectStreamingState(
      urlRequestFailureOrSuccessOption: null == urlRequestFailureOrSuccessOption
          ? _value.urlRequestFailureOrSuccessOption
          : urlRequestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, RedirectUrl>>,
      requestFailureOrSuccessOption: null == requestFailureOrSuccessOption
          ? _value.requestFailureOrSuccessOption
          : requestFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ConnectFailure, Unit>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConnectStreamingState implements _ConnectStreamingState {
  const _$_ConnectStreamingState(
      {required this.urlRequestFailureOrSuccessOption,
      required this.requestFailureOrSuccessOption,
      required this.isSubmitting});

  @override
  final Option<Either<ConnectFailure, RedirectUrl>>
      urlRequestFailureOrSuccessOption;
  @override
  final Option<Either<ConnectFailure, Unit>> requestFailureOrSuccessOption;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'ConnectStreamingState(urlRequestFailureOrSuccessOption: $urlRequestFailureOrSuccessOption, requestFailureOrSuccessOption: $requestFailureOrSuccessOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectStreamingState &&
            (identical(other.urlRequestFailureOrSuccessOption,
                    urlRequestFailureOrSuccessOption) ||
                other.urlRequestFailureOrSuccessOption ==
                    urlRequestFailureOrSuccessOption) &&
            (identical(other.requestFailureOrSuccessOption,
                    requestFailureOrSuccessOption) ||
                other.requestFailureOrSuccessOption ==
                    requestFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, urlRequestFailureOrSuccessOption,
      requestFailureOrSuccessOption, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectStreamingStateCopyWith<_$_ConnectStreamingState> get copyWith =>
      __$$_ConnectStreamingStateCopyWithImpl<_$_ConnectStreamingState>(
          this, _$identity);
}

abstract class _ConnectStreamingState implements ConnectStreamingState {
  const factory _ConnectStreamingState(
      {required final Option<Either<ConnectFailure, RedirectUrl>>
          urlRequestFailureOrSuccessOption,
      required final Option<Either<ConnectFailure, Unit>>
          requestFailureOrSuccessOption,
      required final bool isSubmitting}) = _$_ConnectStreamingState;

  @override
  Option<Either<ConnectFailure, RedirectUrl>>
      get urlRequestFailureOrSuccessOption;
  @override
  Option<Either<ConnectFailure, Unit>> get requestFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectStreamingStateCopyWith<_$_ConnectStreamingState> get copyWith =>
      throw _privateConstructorUsedError;
}
