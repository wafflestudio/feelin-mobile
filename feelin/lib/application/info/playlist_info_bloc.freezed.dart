// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playlist_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistInfoEvent {
  int get postId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) loadRequest,
    required TResult Function(int postId) deleteRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistInfoEventCopyWith<PlaylistInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoEventCopyWith<$Res> {
  factory $PlaylistInfoEventCopyWith(
          PlaylistInfoEvent value, $Res Function(PlaylistInfoEvent) then) =
      _$PlaylistInfoEventCopyWithImpl<$Res>;
  $Res call({int postId});
}

/// @nodoc
class _$PlaylistInfoEventCopyWithImpl<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  _$PlaylistInfoEventCopyWithImpl(this._value, this._then);

  final PlaylistInfoEvent _value;
  // ignore: unused_field
  final $Res Function(PlaylistInfoEvent) _then;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LoadRequestCopyWith<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  factory _$$_LoadRequestCopyWith(
          _$_LoadRequest value, $Res Function(_$_LoadRequest) then) =
      __$$_LoadRequestCopyWithImpl<$Res>;
  @override
  $Res call({int postId});
}

/// @nodoc
class __$$_LoadRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res>
    implements _$$_LoadRequestCopyWith<$Res> {
  __$$_LoadRequestCopyWithImpl(
      _$_LoadRequest _value, $Res Function(_$_LoadRequest) _then)
      : super(_value, (v) => _then(v as _$_LoadRequest));

  @override
  _$_LoadRequest get _value => super._value as _$_LoadRequest;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_$_LoadRequest(
      postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadRequest implements _LoadRequest {
  const _$_LoadRequest(this.postId);

  @override
  final int postId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.loadRequest(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadRequest &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$$_LoadRequestCopyWith<_$_LoadRequest> get copyWith =>
      __$$_LoadRequestCopyWithImpl<_$_LoadRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) loadRequest,
    required TResult Function(int postId) deleteRequest,
  }) {
    return loadRequest(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
  }) {
    return loadRequest?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
    required TResult orElse(),
  }) {
    if (loadRequest != null) {
      return loadRequest(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
  }) {
    return loadRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
  }) {
    return loadRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    required TResult orElse(),
  }) {
    if (loadRequest != null) {
      return loadRequest(this);
    }
    return orElse();
  }
}

abstract class _LoadRequest implements PlaylistInfoEvent {
  const factory _LoadRequest(final int postId) = _$_LoadRequest;

  @override
  int get postId;
  @override
  @JsonKey(ignore: true)
  _$$_LoadRequestCopyWith<_$_LoadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteRequestCopyWith<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  factory _$$_DeleteRequestCopyWith(
          _$_DeleteRequest value, $Res Function(_$_DeleteRequest) then) =
      __$$_DeleteRequestCopyWithImpl<$Res>;
  @override
  $Res call({int postId});
}

/// @nodoc
class __$$_DeleteRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res>
    implements _$$_DeleteRequestCopyWith<$Res> {
  __$$_DeleteRequestCopyWithImpl(
      _$_DeleteRequest _value, $Res Function(_$_DeleteRequest) _then)
      : super(_value, (v) => _then(v as _$_DeleteRequest));

  @override
  _$_DeleteRequest get _value => super._value as _$_DeleteRequest;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_$_DeleteRequest(
      postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteRequest implements _DeleteRequest {
  const _$_DeleteRequest(this.postId);

  @override
  final int postId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.deleteRequest(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteRequest &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteRequestCopyWith<_$_DeleteRequest> get copyWith =>
      __$$_DeleteRequestCopyWithImpl<_$_DeleteRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) loadRequest,
    required TResult Function(int postId) deleteRequest,
  }) {
    return deleteRequest(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
  }) {
    return deleteRequest?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? loadRequest,
    TResult Function(int postId)? deleteRequest,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequest implements PlaylistInfoEvent {
  const factory _DeleteRequest(final int postId) = _$_DeleteRequest;

  @override
  int get postId;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteRequestCopyWith<_$_DeleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaylistInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)
        $default, {
    required TResult Function() loading,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoStateCopyWith<$Res> {
  factory $PlaylistInfoStateCopyWith(
          PlaylistInfoState value, $Res Function(PlaylistInfoState) then) =
      _$PlaylistInfoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaylistInfoStateCopyWithImpl<$Res>
    implements $PlaylistInfoStateCopyWith<$Res> {
  _$PlaylistInfoStateCopyWithImpl(this._value, this._then);

  final PlaylistInfoState _value;
  // ignore: unused_field
  final $Res Function(PlaylistInfoState) _then;
}

/// @nodoc
abstract class _$$_PlaylistInfoStateCopyWith<$Res> {
  factory _$$_PlaylistInfoStateCopyWith(_$_PlaylistInfoState value,
          $Res Function(_$_PlaylistInfoState) then) =
      __$$_PlaylistInfoStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption,
      Post post,
      bool isLoading});
}

/// @nodoc
class __$$_PlaylistInfoStateCopyWithImpl<$Res>
    extends _$PlaylistInfoStateCopyWithImpl<$Res>
    implements _$$_PlaylistInfoStateCopyWith<$Res> {
  __$$_PlaylistInfoStateCopyWithImpl(
      _$_PlaylistInfoState _value, $Res Function(_$_PlaylistInfoState) _then)
      : super(_value, (v) => _then(v as _$_PlaylistInfoState));

  @override
  _$_PlaylistInfoState get _value => super._value as _$_PlaylistInfoState;

  @override
  $Res call({
    Object? loadFailureOrSuccessOption = freezed,
    Object? deleteFailureOrSuccessOption = freezed,
    Object? post = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_PlaylistInfoState(
      loadFailureOrSuccessOption: loadFailureOrSuccessOption == freezed
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Post>>,
      deleteFailureOrSuccessOption: deleteFailureOrSuccessOption == freezed
          ? _value.deleteFailureOrSuccessOption
          : deleteFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Unit>>,
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlaylistInfoState implements _PlaylistInfoState {
  const _$_PlaylistInfoState(
      {required this.loadFailureOrSuccessOption,
      required this.deleteFailureOrSuccessOption,
      required this.post,
      required this.isLoading});

  @override
  final Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption;
  @override
  final Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption;
  @override
  final Post post;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PlaylistInfoState(loadFailureOrSuccessOption: $loadFailureOrSuccessOption, deleteFailureOrSuccessOption: $deleteFailureOrSuccessOption, post: $post, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistInfoState &&
            const DeepCollectionEquality().equals(
                other.loadFailureOrSuccessOption, loadFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(
                other.deleteFailureOrSuccessOption,
                deleteFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other.post, post) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadFailureOrSuccessOption),
      const DeepCollectionEquality().hash(deleteFailureOrSuccessOption),
      const DeepCollectionEquality().hash(post),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      __$$_PlaylistInfoStateCopyWithImpl<_$_PlaylistInfoState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)
        $default, {
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return $default(loadFailureOrSuccessOption, deleteFailureOrSuccessOption,
        post, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return $default?.call(loadFailureOrSuccessOption,
        deleteFailureOrSuccessOption, post, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(loadFailureOrSuccessOption, deleteFailureOrSuccessOption,
          post, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _PlaylistInfoState implements PlaylistInfoState {
  const factory _PlaylistInfoState(
      {required final Option<Either<ExplorePostFailure, Post>>
          loadFailureOrSuccessOption,
      required final Option<Either<ExplorePostFailure, Unit>>
          deleteFailureOrSuccessOption,
      required final Post post,
      required final bool isLoading}) = _$_PlaylistInfoState;

  Option<Either<ExplorePostFailure, Post>> get loadFailureOrSuccessOption;
  Option<Either<ExplorePostFailure, Unit>> get deleteFailureOrSuccessOption;
  Post get post;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$PlaylistInfoStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'PlaylistInfoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)
        $default, {
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements PlaylistInfoState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$LoadedCopyWith<$Res> {
  factory _$$LoadedCopyWith(_$Loaded value, $Res Function(_$Loaded) then) =
      __$$LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedCopyWithImpl<$Res> extends _$PlaylistInfoStateCopyWithImpl<$Res>
    implements _$$LoadedCopyWith<$Res> {
  __$$LoadedCopyWithImpl(_$Loaded _value, $Res Function(_$Loaded) _then)
      : super(_value, (v) => _then(v as _$Loaded));

  @override
  _$Loaded get _value => super._value as _$Loaded;
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded();

  @override
  String toString() {
    return 'PlaylistInfoState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)
        $default, {
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
            Option<Either<ExplorePostFailure, Unit>>
                deleteFailureOrSuccessOption,
            Post post,
            bool isLoading)?
        $default, {
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlaylistInfoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements PlaylistInfoState {
  const factory Loaded() = _$Loaded;
}
