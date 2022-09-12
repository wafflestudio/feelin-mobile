// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String urlStr) urlChanged,
    required TResult Function() submitted,
    required TResult Function() navigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UrlChanged value) urlChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Navigated value) navigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormEventCopyWith<$Res> {
  factory $PostFormEventCopyWith(
          PostFormEvent value, $Res Function(PostFormEvent) then) =
      _$PostFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostFormEventCopyWithImpl<$Res>
    implements $PostFormEventCopyWith<$Res> {
  _$PostFormEventCopyWithImpl(this._value, this._then);

  final PostFormEvent _value;
  // ignore: unused_field
  final $Res Function(PostFormEvent) _then;
}

/// @nodoc
abstract class _$$_UrlChangedCopyWith<$Res> {
  factory _$$_UrlChangedCopyWith(
          _$_UrlChanged value, $Res Function(_$_UrlChanged) then) =
      __$$_UrlChangedCopyWithImpl<$Res>;
  $Res call({String urlStr});
}

/// @nodoc
class __$$_UrlChangedCopyWithImpl<$Res>
    extends _$PostFormEventCopyWithImpl<$Res>
    implements _$$_UrlChangedCopyWith<$Res> {
  __$$_UrlChangedCopyWithImpl(
      _$_UrlChanged _value, $Res Function(_$_UrlChanged) _then)
      : super(_value, (v) => _then(v as _$_UrlChanged));

  @override
  _$_UrlChanged get _value => super._value as _$_UrlChanged;

  @override
  $Res call({
    Object? urlStr = freezed,
  }) {
    return _then(_$_UrlChanged(
      urlStr == freezed
          ? _value.urlStr
          : urlStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UrlChanged implements _UrlChanged {
  const _$_UrlChanged(this.urlStr);

  @override
  final String urlStr;

  @override
  String toString() {
    return 'PostFormEvent.urlChanged(urlStr: $urlStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UrlChanged &&
            const DeepCollectionEquality().equals(other.urlStr, urlStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(urlStr));

  @JsonKey(ignore: true)
  @override
  _$$_UrlChangedCopyWith<_$_UrlChanged> get copyWith =>
      __$$_UrlChangedCopyWithImpl<_$_UrlChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String urlStr) urlChanged,
    required TResult Function() submitted,
    required TResult Function() navigated,
  }) {
    return urlChanged(urlStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
  }) {
    return urlChanged?.call(urlStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
    required TResult orElse(),
  }) {
    if (urlChanged != null) {
      return urlChanged(urlStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UrlChanged value) urlChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Navigated value) navigated,
  }) {
    return urlChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
  }) {
    return urlChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
    required TResult orElse(),
  }) {
    if (urlChanged != null) {
      return urlChanged(this);
    }
    return orElse();
  }
}

abstract class _UrlChanged implements PostFormEvent {
  const factory _UrlChanged(final String urlStr) = _$_UrlChanged;

  String get urlStr;
  @JsonKey(ignore: true)
  _$$_UrlChangedCopyWith<_$_UrlChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res> extends _$PostFormEventCopyWithImpl<$Res>
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
    return 'PostFormEvent.submitted()';
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
    required TResult Function(String urlStr) urlChanged,
    required TResult Function() submitted,
    required TResult Function() navigated,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
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
    required TResult Function(_UrlChanged value) urlChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Navigated value) navigated,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements PostFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
abstract class _$$_NavigatedCopyWith<$Res> {
  factory _$$_NavigatedCopyWith(
          _$_Navigated value, $Res Function(_$_Navigated) then) =
      __$$_NavigatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NavigatedCopyWithImpl<$Res> extends _$PostFormEventCopyWithImpl<$Res>
    implements _$$_NavigatedCopyWith<$Res> {
  __$$_NavigatedCopyWithImpl(
      _$_Navigated _value, $Res Function(_$_Navigated) _then)
      : super(_value, (v) => _then(v as _$_Navigated));

  @override
  _$_Navigated get _value => super._value as _$_Navigated;
}

/// @nodoc

class _$_Navigated implements _Navigated {
  const _$_Navigated();

  @override
  String toString() {
    return 'PostFormEvent.navigated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Navigated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String urlStr) urlChanged,
    required TResult Function() submitted,
    required TResult Function() navigated,
  }) {
    return navigated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
  }) {
    return navigated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String urlStr)? urlChanged,
    TResult Function()? submitted,
    TResult Function()? navigated,
    required TResult orElse(),
  }) {
    if (navigated != null) {
      return navigated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UrlChanged value) urlChanged,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Navigated value) navigated,
  }) {
    return navigated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
  }) {
    return navigated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UrlChanged value)? urlChanged,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Navigated value)? navigated,
    required TResult orElse(),
  }) {
    if (navigated != null) {
      return navigated(this);
    }
    return orElse();
  }
}

abstract class _Navigated implements PostFormEvent {
  const factory _Navigated() = _$_Navigated;
}

/// @nodoc
mixin _$PostFormState {
  PlaylistUrl get playlistUrl => throw _privateConstructorUsedError;
  Option<Either<PostFailure, Playlist>> get postFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isNavigated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostFormStateCopyWith<PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormStateCopyWith<$Res> {
  factory $PostFormStateCopyWith(
          PostFormState value, $Res Function(PostFormState) then) =
      _$PostFormStateCopyWithImpl<$Res>;
  $Res call(
      {PlaylistUrl playlistUrl,
      Option<Either<PostFailure, Playlist>> postFailureOrSuccessOption,
      bool isSubmitting,
      bool isNavigated});
}

/// @nodoc
class _$PostFormStateCopyWithImpl<$Res>
    implements $PostFormStateCopyWith<$Res> {
  _$PostFormStateCopyWithImpl(this._value, this._then);

  final PostFormState _value;
  // ignore: unused_field
  final $Res Function(PostFormState) _then;

  @override
  $Res call({
    Object? playlistUrl = freezed,
    Object? postFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? isNavigated = freezed,
  }) {
    return _then(_value.copyWith(
      playlistUrl: playlistUrl == freezed
          ? _value.playlistUrl
          : playlistUrl // ignore: cast_nullable_to_non_nullable
              as PlaylistUrl,
      postFailureOrSuccessOption: postFailureOrSuccessOption == freezed
          ? _value.postFailureOrSuccessOption
          : postFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Playlist>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isNavigated: isNavigated == freezed
          ? _value.isNavigated
          : isNavigated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PostFormStateCopyWith<$Res>
    implements $PostFormStateCopyWith<$Res> {
  factory _$$_PostFormStateCopyWith(
          _$_PostFormState value, $Res Function(_$_PostFormState) then) =
      __$$_PostFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PlaylistUrl playlistUrl,
      Option<Either<PostFailure, Playlist>> postFailureOrSuccessOption,
      bool isSubmitting,
      bool isNavigated});
}

/// @nodoc
class __$$_PostFormStateCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res>
    implements _$$_PostFormStateCopyWith<$Res> {
  __$$_PostFormStateCopyWithImpl(
      _$_PostFormState _value, $Res Function(_$_PostFormState) _then)
      : super(_value, (v) => _then(v as _$_PostFormState));

  @override
  _$_PostFormState get _value => super._value as _$_PostFormState;

  @override
  $Res call({
    Object? playlistUrl = freezed,
    Object? postFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? isNavigated = freezed,
  }) {
    return _then(_$_PostFormState(
      playlistUrl: playlistUrl == freezed
          ? _value.playlistUrl
          : playlistUrl // ignore: cast_nullable_to_non_nullable
              as PlaylistUrl,
      postFailureOrSuccessOption: postFailureOrSuccessOption == freezed
          ? _value.postFailureOrSuccessOption
          : postFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Playlist>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isNavigated: isNavigated == freezed
          ? _value.isNavigated
          : isNavigated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostFormState implements _PostFormState {
  const _$_PostFormState(
      {required this.playlistUrl,
      required this.postFailureOrSuccessOption,
      required this.isSubmitting,
      required this.isNavigated});

  @override
  final PlaylistUrl playlistUrl;
  @override
  final Option<Either<PostFailure, Playlist>> postFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool isNavigated;

  @override
  String toString() {
    return 'PostFormState(playlistUrl: $playlistUrl, postFailureOrSuccessOption: $postFailureOrSuccessOption, isSubmitting: $isSubmitting, isNavigated: $isNavigated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostFormState &&
            const DeepCollectionEquality()
                .equals(other.playlistUrl, playlistUrl) &&
            const DeepCollectionEquality().equals(
                other.postFailureOrSuccessOption, postFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isNavigated, isNavigated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playlistUrl),
      const DeepCollectionEquality().hash(postFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isNavigated));

  @JsonKey(ignore: true)
  @override
  _$$_PostFormStateCopyWith<_$_PostFormState> get copyWith =>
      __$$_PostFormStateCopyWithImpl<_$_PostFormState>(this, _$identity);
}

abstract class _PostFormState implements PostFormState {
  const factory _PostFormState(
      {required final PlaylistUrl playlistUrl,
      required final Option<Either<PostFailure, Playlist>>
          postFailureOrSuccessOption,
      required final bool isSubmitting,
      required final bool isNavigated}) = _$_PostFormState;

  @override
  PlaylistUrl get playlistUrl;
  @override
  Option<Either<PostFailure, Playlist>> get postFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get isNavigated;
  @override
  @JsonKey(ignore: true)
  _$$_PostFormStateCopyWith<_$_PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
