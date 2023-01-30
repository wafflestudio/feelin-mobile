// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoEventCopyWith<$Res> {
  factory $PlaylistInfoEventCopyWith(
          PlaylistInfoEvent value, $Res Function(PlaylistInfoEvent) then) =
      _$PlaylistInfoEventCopyWithImpl<$Res, PlaylistInfoEvent>;
}

/// @nodoc
class _$PlaylistInfoEventCopyWithImpl<$Res, $Val extends PlaylistInfoEvent>
    implements $PlaylistInfoEventCopyWith<$Res> {
  _$PlaylistInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadRequestCopyWith<$Res> {
  factory _$$_LoadRequestCopyWith(
          _$_LoadRequest value, $Res Function(_$_LoadRequest) then) =
      __$$_LoadRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$_LoadRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_LoadRequest>
    implements _$$_LoadRequestCopyWith<$Res> {
  __$$_LoadRequestCopyWithImpl(
      _$_LoadRequest _value, $Res Function(_$_LoadRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$_LoadRequest(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadRequest implements _LoadRequest {
  const _$_LoadRequest(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.loadRequest(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadRequest &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadRequestCopyWith<_$_LoadRequest> get copyWith =>
      __$$_LoadRequestCopyWithImpl<_$_LoadRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return loadRequest(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return loadRequest?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
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
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return loadRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return loadRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (loadRequest != null) {
      return loadRequest(this);
    }
    return orElse();
  }
}

abstract class _LoadRequest implements PlaylistInfoEvent {
  const factory _LoadRequest(final String postId) = _$_LoadRequest;

  String get postId;
  @JsonKey(ignore: true)
  _$$_LoadRequestCopyWith<_$_LoadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReloadRequestCopyWith<$Res> {
  factory _$$_ReloadRequestCopyWith(
          _$_ReloadRequest value, $Res Function(_$_ReloadRequest) then) =
      __$$_ReloadRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$_ReloadRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_ReloadRequest>
    implements _$$_ReloadRequestCopyWith<$Res> {
  __$$_ReloadRequestCopyWithImpl(
      _$_ReloadRequest _value, $Res Function(_$_ReloadRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$_ReloadRequest(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReloadRequest implements _ReloadRequest {
  const _$_ReloadRequest(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.reloadRequest(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReloadRequest &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReloadRequestCopyWith<_$_ReloadRequest> get copyWith =>
      __$$_ReloadRequestCopyWithImpl<_$_ReloadRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return reloadRequest(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return reloadRequest?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (reloadRequest != null) {
      return reloadRequest(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return reloadRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return reloadRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (reloadRequest != null) {
      return reloadRequest(this);
    }
    return orElse();
  }
}

abstract class _ReloadRequest implements PlaylistInfoEvent {
  const factory _ReloadRequest(final String postId) = _$_ReloadRequest;

  String get postId;
  @JsonKey(ignore: true)
  _$$_ReloadRequestCopyWith<_$_ReloadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteRequestCopyWith<$Res> {
  factory _$$_DeleteRequestCopyWith(
          _$_DeleteRequest value, $Res Function(_$_DeleteRequest) then) =
      __$$_DeleteRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$_DeleteRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_DeleteRequest>
    implements _$$_DeleteRequestCopyWith<$Res> {
  __$$_DeleteRequestCopyWithImpl(
      _$_DeleteRequest _value, $Res Function(_$_DeleteRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$_DeleteRequest(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteRequest implements _DeleteRequest {
  const _$_DeleteRequest(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.deleteRequest(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteRequest &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteRequestCopyWith<_$_DeleteRequest> get copyWith =>
      __$$_DeleteRequestCopyWithImpl<_$_DeleteRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return deleteRequest(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return deleteRequest?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
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
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequest implements PlaylistInfoEvent {
  const factory _DeleteRequest(final String postId) = _$_DeleteRequest;

  String get postId;
  @JsonKey(ignore: true)
  _$$_DeleteRequestCopyWith<_$_DeleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LikeRequestCopyWith<$Res> {
  factory _$$_LikeRequestCopyWith(
          _$_LikeRequest value, $Res Function(_$_LikeRequest) then) =
      __$$_LikeRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LikeRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_LikeRequest>
    implements _$$_LikeRequestCopyWith<$Res> {
  __$$_LikeRequestCopyWithImpl(
      _$_LikeRequest _value, $Res Function(_$_LikeRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LikeRequest implements _LikeRequest {
  const _$_LikeRequest();

  @override
  String toString() {
    return 'PlaylistInfoEvent.likeRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LikeRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return likeRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return likeRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (likeRequest != null) {
      return likeRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return likeRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return likeRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (likeRequest != null) {
      return likeRequest(this);
    }
    return orElse();
  }
}

abstract class _LikeRequest implements PlaylistInfoEvent {
  const factory _LikeRequest() = _$_LikeRequest;
}

/// @nodoc
abstract class _$$_UnlikeRequestCopyWith<$Res> {
  factory _$$_UnlikeRequestCopyWith(
          _$_UnlikeRequest value, $Res Function(_$_UnlikeRequest) then) =
      __$$_UnlikeRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnlikeRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_UnlikeRequest>
    implements _$$_UnlikeRequestCopyWith<$Res> {
  __$$_UnlikeRequestCopyWithImpl(
      _$_UnlikeRequest _value, $Res Function(_$_UnlikeRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnlikeRequest implements _UnlikeRequest {
  const _$_UnlikeRequest();

  @override
  String toString() {
    return 'PlaylistInfoEvent.unlikeRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnlikeRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return unlikeRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return unlikeRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (unlikeRequest != null) {
      return unlikeRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return unlikeRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return unlikeRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (unlikeRequest != null) {
      return unlikeRequest(this);
    }
    return orElse();
  }
}

abstract class _UnlikeRequest implements PlaylistInfoEvent {
  const factory _UnlikeRequest() = _$_UnlikeRequest;
}

/// @nodoc
abstract class _$$_SaveRequestCopyWith<$Res> {
  factory _$$_SaveRequestCopyWith(
          _$_SaveRequest value, $Res Function(_$_SaveRequest) then) =
      __$$_SaveRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String vendorId});
}

/// @nodoc
class __$$_SaveRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_SaveRequest>
    implements _$$_SaveRequestCopyWith<$Res> {
  __$$_SaveRequestCopyWithImpl(
      _$_SaveRequest _value, $Res Function(_$_SaveRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorId = null,
  }) {
    return _then(_$_SaveRequest(
      null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveRequest implements _SaveRequest {
  const _$_SaveRequest(this.vendorId);

  @override
  final String vendorId;

  @override
  String toString() {
    return 'PlaylistInfoEvent.saveRequest(vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveRequest &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vendorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveRequestCopyWith<_$_SaveRequest> get copyWith =>
      __$$_SaveRequestCopyWithImpl<_$_SaveRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return saveRequest(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return saveRequest?.call(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (saveRequest != null) {
      return saveRequest(vendorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return saveRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return saveRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (saveRequest != null) {
      return saveRequest(this);
    }
    return orElse();
  }
}

abstract class _SaveRequest implements PlaylistInfoEvent {
  const factory _SaveRequest(final String vendorId) = _$_SaveRequest;

  String get vendorId;
  @JsonKey(ignore: true)
  _$$_SaveRequestCopyWith<_$_SaveRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportRequestCopyWith<$Res> {
  factory _$$_ReportRequestCopyWith(
          _$_ReportRequest value, $Res Function(_$_ReportRequest) then) =
      __$$_ReportRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String reportType, dynamic description});
}

/// @nodoc
class __$$_ReportRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_ReportRequest>
    implements _$$_ReportRequestCopyWith<$Res> {
  __$$_ReportRequestCopyWithImpl(
      _$_ReportRequest _value, $Res Function(_$_ReportRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportType = null,
    Object? description = freezed,
  }) {
    return _then(_$_ReportRequest(
      null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == description ? _value.description! : description,
    ));
  }
}

/// @nodoc

class _$_ReportRequest implements _ReportRequest {
  const _$_ReportRequest(this.reportType, this.description);

  @override
  final String reportType;
  @override
  final dynamic description;

  @override
  String toString() {
    return 'PlaylistInfoEvent.reportRequest(reportType: $reportType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportRequest &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reportType,
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      __$$_ReportRequestCopyWithImpl<_$_ReportRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return reportRequest(reportType, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return reportRequest?.call(reportType, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (reportRequest != null) {
      return reportRequest(reportType, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return reportRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return reportRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (reportRequest != null) {
      return reportRequest(this);
    }
    return orElse();
  }
}

abstract class _ReportRequest implements PlaylistInfoEvent {
  const factory _ReportRequest(
      final String reportType, final dynamic description) = _$_ReportRequest;

  String get reportType;
  dynamic get description;
  @JsonKey(ignore: true)
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BlockRequestCopyWith<$Res> {
  factory _$$_BlockRequestCopyWith(
          _$_BlockRequest value, $Res Function(_$_BlockRequest) then) =
      __$$_BlockRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BlockRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_BlockRequest>
    implements _$$_BlockRequestCopyWith<$Res> {
  __$$_BlockRequestCopyWithImpl(
      _$_BlockRequest _value, $Res Function(_$_BlockRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BlockRequest implements _BlockRequest {
  const _$_BlockRequest();

  @override
  String toString() {
    return 'PlaylistInfoEvent.blockRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BlockRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return blockRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return blockRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (blockRequest != null) {
      return blockRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return blockRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return blockRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (blockRequest != null) {
      return blockRequest(this);
    }
    return orElse();
  }
}

abstract class _BlockRequest implements PlaylistInfoEvent {
  const factory _BlockRequest() = _$_BlockRequest;
}

/// @nodoc
abstract class _$$_ResetStateRequestCopyWith<$Res> {
  factory _$$_ResetStateRequestCopyWith(_$_ResetStateRequest value,
          $Res Function(_$_ResetStateRequest) then) =
      __$$_ResetStateRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetStateRequestCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res, _$_ResetStateRequest>
    implements _$$_ResetStateRequestCopyWith<$Res> {
  __$$_ResetStateRequestCopyWithImpl(
      _$_ResetStateRequest _value, $Res Function(_$_ResetStateRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetStateRequest implements _ResetStateRequest {
  const _$_ResetStateRequest();

  @override
  String toString() {
    return 'PlaylistInfoEvent.resetStateRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetStateRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadRequest,
    required TResult Function(String postId) reloadRequest,
    required TResult Function(String postId) deleteRequest,
    required TResult Function() likeRequest,
    required TResult Function() unlikeRequest,
    required TResult Function(String vendorId) saveRequest,
    required TResult Function(String reportType, dynamic description)
        reportRequest,
    required TResult Function() blockRequest,
    required TResult Function() resetStateRequest,
  }) {
    return resetStateRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadRequest,
    TResult? Function(String postId)? reloadRequest,
    TResult? Function(String postId)? deleteRequest,
    TResult? Function()? likeRequest,
    TResult? Function()? unlikeRequest,
    TResult? Function(String vendorId)? saveRequest,
    TResult? Function(String reportType, dynamic description)? reportRequest,
    TResult? Function()? blockRequest,
    TResult? Function()? resetStateRequest,
  }) {
    return resetStateRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadRequest,
    TResult Function(String postId)? reloadRequest,
    TResult Function(String postId)? deleteRequest,
    TResult Function()? likeRequest,
    TResult Function()? unlikeRequest,
    TResult Function(String vendorId)? saveRequest,
    TResult Function(String reportType, dynamic description)? reportRequest,
    TResult Function()? blockRequest,
    TResult Function()? resetStateRequest,
    required TResult orElse(),
  }) {
    if (resetStateRequest != null) {
      return resetStateRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ReloadRequest value) reloadRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_LikeRequest value) likeRequest,
    required TResult Function(_UnlikeRequest value) unlikeRequest,
    required TResult Function(_SaveRequest value) saveRequest,
    required TResult Function(_ReportRequest value) reportRequest,
    required TResult Function(_BlockRequest value) blockRequest,
    required TResult Function(_ResetStateRequest value) resetStateRequest,
  }) {
    return resetStateRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ReloadRequest value)? reloadRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_LikeRequest value)? likeRequest,
    TResult? Function(_UnlikeRequest value)? unlikeRequest,
    TResult? Function(_SaveRequest value)? saveRequest,
    TResult? Function(_ReportRequest value)? reportRequest,
    TResult? Function(_BlockRequest value)? blockRequest,
    TResult? Function(_ResetStateRequest value)? resetStateRequest,
  }) {
    return resetStateRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ReloadRequest value)? reloadRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_LikeRequest value)? likeRequest,
    TResult Function(_UnlikeRequest value)? unlikeRequest,
    TResult Function(_SaveRequest value)? saveRequest,
    TResult Function(_ReportRequest value)? reportRequest,
    TResult Function(_BlockRequest value)? blockRequest,
    TResult Function(_ResetStateRequest value)? resetStateRequest,
    required TResult orElse(),
  }) {
    if (resetStateRequest != null) {
      return resetStateRequest(this);
    }
    return orElse();
  }
}

abstract class _ResetStateRequest implements PlaylistInfoEvent {
  const factory _ResetStateRequest() = _$_ResetStateRequest;
}

/// @nodoc
mixin _$PlaylistInfoState {
  Option<Either<ExplorePostFailure, Post>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<ExplorePostFailure, Unit>> get deleteFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<ExplorePostFailure, RedirectUrl>>
      get saveFailureOrSuccessOption => throw _privateConstructorUsedError;
  Option<Either<ExplorePostFailure, Unit>> get reportFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<BlockFailure, Unit>> get blockFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Post get post => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isRestricted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistInfoStateCopyWith<PlaylistInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoStateCopyWith<$Res> {
  factory $PlaylistInfoStateCopyWith(
          PlaylistInfoState value, $Res Function(PlaylistInfoState) then) =
      _$PlaylistInfoStateCopyWithImpl<$Res, PlaylistInfoState>;
  @useResult
  $Res call(
      {Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, RedirectUrl>>
          saveFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, Unit>> reportFailureOrSuccessOption,
      Option<Either<BlockFailure, Unit>> blockFailureOrSuccessOption,
      Post post,
      bool isLoading,
      bool isSaving,
      bool isLiked,
      bool isRestricted});
}

/// @nodoc
class _$PlaylistInfoStateCopyWithImpl<$Res, $Val extends PlaylistInfoState>
    implements $PlaylistInfoStateCopyWith<$Res> {
  _$PlaylistInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadFailureOrSuccessOption = null,
    Object? deleteFailureOrSuccessOption = null,
    Object? saveFailureOrSuccessOption = null,
    Object? reportFailureOrSuccessOption = null,
    Object? blockFailureOrSuccessOption = null,
    Object? post = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isLiked = null,
    Object? isRestricted = null,
  }) {
    return _then(_value.copyWith(
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Post>>,
      deleteFailureOrSuccessOption: null == deleteFailureOrSuccessOption
          ? _value.deleteFailureOrSuccessOption
          : deleteFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Unit>>,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, RedirectUrl>>,
      reportFailureOrSuccessOption: null == reportFailureOrSuccessOption
          ? _value.reportFailureOrSuccessOption
          : reportFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Unit>>,
      blockFailureOrSuccessOption: null == blockFailureOrSuccessOption
          ? _value.blockFailureOrSuccessOption
          : blockFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BlockFailure, Unit>>,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isRestricted: null == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistInfoStateCopyWith<$Res>
    implements $PlaylistInfoStateCopyWith<$Res> {
  factory _$$_PlaylistInfoStateCopyWith(_$_PlaylistInfoState value,
          $Res Function(_$_PlaylistInfoState) then) =
      __$$_PlaylistInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, RedirectUrl>>
          saveFailureOrSuccessOption,
      Option<Either<ExplorePostFailure, Unit>> reportFailureOrSuccessOption,
      Option<Either<BlockFailure, Unit>> blockFailureOrSuccessOption,
      Post post,
      bool isLoading,
      bool isSaving,
      bool isLiked,
      bool isRestricted});
}

/// @nodoc
class __$$_PlaylistInfoStateCopyWithImpl<$Res>
    extends _$PlaylistInfoStateCopyWithImpl<$Res, _$_PlaylistInfoState>
    implements _$$_PlaylistInfoStateCopyWith<$Res> {
  __$$_PlaylistInfoStateCopyWithImpl(
      _$_PlaylistInfoState _value, $Res Function(_$_PlaylistInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadFailureOrSuccessOption = null,
    Object? deleteFailureOrSuccessOption = null,
    Object? saveFailureOrSuccessOption = null,
    Object? reportFailureOrSuccessOption = null,
    Object? blockFailureOrSuccessOption = null,
    Object? post = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isLiked = null,
    Object? isRestricted = null,
  }) {
    return _then(_$_PlaylistInfoState(
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Post>>,
      deleteFailureOrSuccessOption: null == deleteFailureOrSuccessOption
          ? _value.deleteFailureOrSuccessOption
          : deleteFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Unit>>,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, RedirectUrl>>,
      reportFailureOrSuccessOption: null == reportFailureOrSuccessOption
          ? _value.reportFailureOrSuccessOption
          : reportFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ExplorePostFailure, Unit>>,
      blockFailureOrSuccessOption: null == blockFailureOrSuccessOption
          ? _value.blockFailureOrSuccessOption
          : blockFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BlockFailure, Unit>>,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isRestricted: null == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlaylistInfoState implements _PlaylistInfoState {
  const _$_PlaylistInfoState(
      {required this.loadFailureOrSuccessOption,
      required this.deleteFailureOrSuccessOption,
      required this.saveFailureOrSuccessOption,
      required this.reportFailureOrSuccessOption,
      required this.blockFailureOrSuccessOption,
      required this.post,
      required this.isLoading,
      required this.isSaving,
      required this.isLiked,
      required this.isRestricted});

  @override
  final Option<Either<ExplorePostFailure, Post>> loadFailureOrSuccessOption;
  @override
  final Option<Either<ExplorePostFailure, Unit>> deleteFailureOrSuccessOption;
  @override
  final Option<Either<ExplorePostFailure, RedirectUrl>>
      saveFailureOrSuccessOption;
  @override
  final Option<Either<ExplorePostFailure, Unit>> reportFailureOrSuccessOption;
  @override
  final Option<Either<BlockFailure, Unit>> blockFailureOrSuccessOption;
  @override
  final Post post;
  @override
  final bool isLoading;
  @override
  final bool isSaving;
  @override
  final bool isLiked;
  @override
  final bool isRestricted;

  @override
  String toString() {
    return 'PlaylistInfoState(loadFailureOrSuccessOption: $loadFailureOrSuccessOption, deleteFailureOrSuccessOption: $deleteFailureOrSuccessOption, saveFailureOrSuccessOption: $saveFailureOrSuccessOption, reportFailureOrSuccessOption: $reportFailureOrSuccessOption, blockFailureOrSuccessOption: $blockFailureOrSuccessOption, post: $post, isLoading: $isLoading, isSaving: $isSaving, isLiked: $isLiked, isRestricted: $isRestricted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistInfoState &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption) &&
            (identical(other.deleteFailureOrSuccessOption,
                    deleteFailureOrSuccessOption) ||
                other.deleteFailureOrSuccessOption ==
                    deleteFailureOrSuccessOption) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption) &&
            (identical(other.reportFailureOrSuccessOption,
                    reportFailureOrSuccessOption) ||
                other.reportFailureOrSuccessOption ==
                    reportFailureOrSuccessOption) &&
            (identical(other.blockFailureOrSuccessOption,
                    blockFailureOrSuccessOption) ||
                other.blockFailureOrSuccessOption ==
                    blockFailureOrSuccessOption) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isRestricted, isRestricted) ||
                other.isRestricted == isRestricted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadFailureOrSuccessOption,
      deleteFailureOrSuccessOption,
      saveFailureOrSuccessOption,
      reportFailureOrSuccessOption,
      blockFailureOrSuccessOption,
      post,
      isLoading,
      isSaving,
      isLiked,
      isRestricted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      __$$_PlaylistInfoStateCopyWithImpl<_$_PlaylistInfoState>(
          this, _$identity);
}

abstract class _PlaylistInfoState implements PlaylistInfoState {
  const factory _PlaylistInfoState(
      {required final Option<Either<ExplorePostFailure, Post>>
          loadFailureOrSuccessOption,
      required final Option<Either<ExplorePostFailure, Unit>>
          deleteFailureOrSuccessOption,
      required final Option<Either<ExplorePostFailure, RedirectUrl>>
          saveFailureOrSuccessOption,
      required final Option<Either<ExplorePostFailure, Unit>>
          reportFailureOrSuccessOption,
      required final Option<Either<BlockFailure, Unit>>
          blockFailureOrSuccessOption,
      required final Post post,
      required final bool isLoading,
      required final bool isSaving,
      required final bool isLiked,
      required final bool isRestricted}) = _$_PlaylistInfoState;

  @override
  Option<Either<ExplorePostFailure, Post>> get loadFailureOrSuccessOption;
  @override
  Option<Either<ExplorePostFailure, Unit>> get deleteFailureOrSuccessOption;
  @override
  Option<Either<ExplorePostFailure, RedirectUrl>>
      get saveFailureOrSuccessOption;
  @override
  Option<Either<ExplorePostFailure, Unit>> get reportFailureOrSuccessOption;
  @override
  Option<Either<BlockFailure, Unit>> get blockFailureOrSuccessOption;
  @override
  Post get post;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  bool get isLiked;
  @override
  bool get isRestricted;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
