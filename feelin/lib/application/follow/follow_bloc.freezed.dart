// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadFollowingsRequest,
    required TResult Function(String id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? loadFollowingsRequest,
    TResult? Function(String id)? loadFollowersRequest,
    TResult? Function()? resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadFollowingsRequest,
    TResult Function(String id)? loadFollowersRequest,
    TResult Function()? resetRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFollowingsRequest value)
        loadFollowingsRequest,
    required TResult Function(_LoadFollowersRequest value) loadFollowersRequest,
    required TResult Function(_ResetRequest value) resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult? Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowEventCopyWith<$Res> {
  factory $FollowEventCopyWith(
          FollowEvent value, $Res Function(FollowEvent) then) =
      _$FollowEventCopyWithImpl<$Res, FollowEvent>;
}

/// @nodoc
class _$FollowEventCopyWithImpl<$Res, $Val extends FollowEvent>
    implements $FollowEventCopyWith<$Res> {
  _$FollowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadFollowingsRequestCopyWith<$Res> {
  factory _$$_LoadFollowingsRequestCopyWith(_$_LoadFollowingsRequest value,
          $Res Function(_$_LoadFollowingsRequest) then) =
      __$$_LoadFollowingsRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_LoadFollowingsRequestCopyWithImpl<$Res>
    extends _$FollowEventCopyWithImpl<$Res, _$_LoadFollowingsRequest>
    implements _$$_LoadFollowingsRequestCopyWith<$Res> {
  __$$_LoadFollowingsRequestCopyWithImpl(_$_LoadFollowingsRequest _value,
      $Res Function(_$_LoadFollowingsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_LoadFollowingsRequest(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadFollowingsRequest implements _LoadFollowingsRequest {
  const _$_LoadFollowingsRequest(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'FollowEvent.loadFollowingsRequest(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFollowingsRequest &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFollowingsRequestCopyWith<_$_LoadFollowingsRequest> get copyWith =>
      __$$_LoadFollowingsRequestCopyWithImpl<_$_LoadFollowingsRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadFollowingsRequest,
    required TResult Function(String id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return loadFollowingsRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? loadFollowingsRequest,
    TResult? Function(String id)? loadFollowersRequest,
    TResult? Function()? resetRequest,
  }) {
    return loadFollowingsRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadFollowingsRequest,
    TResult Function(String id)? loadFollowersRequest,
    TResult Function()? resetRequest,
    required TResult orElse(),
  }) {
    if (loadFollowingsRequest != null) {
      return loadFollowingsRequest(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFollowingsRequest value)
        loadFollowingsRequest,
    required TResult Function(_LoadFollowersRequest value) loadFollowersRequest,
    required TResult Function(_ResetRequest value) resetRequest,
  }) {
    return loadFollowingsRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult? Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
  }) {
    return loadFollowingsRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    required TResult orElse(),
  }) {
    if (loadFollowingsRequest != null) {
      return loadFollowingsRequest(this);
    }
    return orElse();
  }
}

abstract class _LoadFollowingsRequest implements FollowEvent {
  const factory _LoadFollowingsRequest(final String id) =
      _$_LoadFollowingsRequest;

  String get id;
  @JsonKey(ignore: true)
  _$$_LoadFollowingsRequestCopyWith<_$_LoadFollowingsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFollowersRequestCopyWith<$Res> {
  factory _$$_LoadFollowersRequestCopyWith(_$_LoadFollowersRequest value,
          $Res Function(_$_LoadFollowersRequest) then) =
      __$$_LoadFollowersRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_LoadFollowersRequestCopyWithImpl<$Res>
    extends _$FollowEventCopyWithImpl<$Res, _$_LoadFollowersRequest>
    implements _$$_LoadFollowersRequestCopyWith<$Res> {
  __$$_LoadFollowersRequestCopyWithImpl(_$_LoadFollowersRequest _value,
      $Res Function(_$_LoadFollowersRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_LoadFollowersRequest(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadFollowersRequest implements _LoadFollowersRequest {
  const _$_LoadFollowersRequest(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'FollowEvent.loadFollowersRequest(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFollowersRequest &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFollowersRequestCopyWith<_$_LoadFollowersRequest> get copyWith =>
      __$$_LoadFollowersRequestCopyWithImpl<_$_LoadFollowersRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadFollowingsRequest,
    required TResult Function(String id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return loadFollowersRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? loadFollowingsRequest,
    TResult? Function(String id)? loadFollowersRequest,
    TResult? Function()? resetRequest,
  }) {
    return loadFollowersRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadFollowingsRequest,
    TResult Function(String id)? loadFollowersRequest,
    TResult Function()? resetRequest,
    required TResult orElse(),
  }) {
    if (loadFollowersRequest != null) {
      return loadFollowersRequest(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFollowingsRequest value)
        loadFollowingsRequest,
    required TResult Function(_LoadFollowersRequest value) loadFollowersRequest,
    required TResult Function(_ResetRequest value) resetRequest,
  }) {
    return loadFollowersRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult? Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
  }) {
    return loadFollowersRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    required TResult orElse(),
  }) {
    if (loadFollowersRequest != null) {
      return loadFollowersRequest(this);
    }
    return orElse();
  }
}

abstract class _LoadFollowersRequest implements FollowEvent {
  const factory _LoadFollowersRequest(final String id) =
      _$_LoadFollowersRequest;

  String get id;
  @JsonKey(ignore: true)
  _$$_LoadFollowersRequestCopyWith<_$_LoadFollowersRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetRequestCopyWith<$Res> {
  factory _$$_ResetRequestCopyWith(
          _$_ResetRequest value, $Res Function(_$_ResetRequest) then) =
      __$$_ResetRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetRequestCopyWithImpl<$Res>
    extends _$FollowEventCopyWithImpl<$Res, _$_ResetRequest>
    implements _$$_ResetRequestCopyWith<$Res> {
  __$$_ResetRequestCopyWithImpl(
      _$_ResetRequest _value, $Res Function(_$_ResetRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetRequest implements _ResetRequest {
  const _$_ResetRequest();

  @override
  String toString() {
    return 'FollowEvent.resetRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadFollowingsRequest,
    required TResult Function(String id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return resetRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? loadFollowingsRequest,
    TResult? Function(String id)? loadFollowersRequest,
    TResult? Function()? resetRequest,
  }) {
    return resetRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadFollowingsRequest,
    TResult Function(String id)? loadFollowersRequest,
    TResult Function()? resetRequest,
    required TResult orElse(),
  }) {
    if (resetRequest != null) {
      return resetRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFollowingsRequest value)
        loadFollowingsRequest,
    required TResult Function(_LoadFollowersRequest value) loadFollowersRequest,
    required TResult Function(_ResetRequest value) resetRequest,
  }) {
    return resetRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult? Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
  }) {
    return resetRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    required TResult orElse(),
  }) {
    if (resetRequest != null) {
      return resetRequest(this);
    }
    return orElse();
  }
}

abstract class _ResetRequest implements FollowEvent {
  const factory _ResetRequest() = _$_ResetRequest;
}

/// @nodoc
mixin _$FollowState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ProfileFailure, PageUser>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<Profile> get users => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;
  String? get cursor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowStateCopyWith<FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res, FollowState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res, $Val extends FollowState>
    implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
    Object? users = null,
    Object? isLast = null,
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, PageUser>>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowStateCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$$_FollowStateCopyWith(
          _$_FollowState value, $Res Function(_$_FollowState) then) =
      __$$_FollowStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class __$$_FollowStateCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$_FollowState>
    implements _$$_FollowStateCopyWith<$Res> {
  __$$_FollowStateCopyWithImpl(
      _$_FollowState _value, $Res Function(_$_FollowState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
    Object? users = null,
    Object? isLast = null,
    Object? cursor = freezed,
  }) {
    return _then(_$_FollowState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, PageUser>>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FollowState implements _FollowState {
  const _$_FollowState(
      {required this.isLoading,
      required this.loadFailureOrSuccessOption,
      required final List<Profile> users,
      required this.isLast,
      required this.cursor})
      : _users = users;

  @override
  final bool isLoading;
  @override
  final Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption;
  final List<Profile> _users;
  @override
  List<Profile> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final bool isLast;
  @override
  final String? cursor;

  @override
  String toString() {
    return 'FollowState(isLoading: $isLoading, loadFailureOrSuccessOption: $loadFailureOrSuccessOption, users: $users, isLast: $isLast, cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isLast, isLast) || other.isLast == isLast) &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      loadFailureOrSuccessOption,
      const DeepCollectionEquality().hash(_users),
      isLast,
      cursor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowStateCopyWith<_$_FollowState> get copyWith =>
      __$$_FollowStateCopyWithImpl<_$_FollowState>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState(
      {required final bool isLoading,
      required final Option<Either<ProfileFailure, PageUser>>
          loadFailureOrSuccessOption,
      required final List<Profile> users,
      required final bool isLast,
      required final String? cursor}) = _$_FollowState;

  @override
  bool get isLoading;
  @override
  Option<Either<ProfileFailure, PageUser>> get loadFailureOrSuccessOption;
  @override
  List<Profile> get users;
  @override
  bool get isLast;
  @override
  String? get cursor;
  @override
  @JsonKey(ignore: true)
  _$$_FollowStateCopyWith<_$_FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}
