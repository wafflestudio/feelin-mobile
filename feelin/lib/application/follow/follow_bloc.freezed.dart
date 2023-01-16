// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(int id) loadFollowingsRequest,
    required TResult Function(int id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
    TResult Function()? resetRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
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
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
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
      _$FollowEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FollowEventCopyWithImpl<$Res> implements $FollowEventCopyWith<$Res> {
  _$FollowEventCopyWithImpl(this._value, this._then);

  final FollowEvent _value;
  // ignore: unused_field
  final $Res Function(FollowEvent) _then;
}

/// @nodoc
abstract class _$$_LoadFollowingsRequestCopyWith<$Res> {
  factory _$$_LoadFollowingsRequestCopyWith(_$_LoadFollowingsRequest value,
          $Res Function(_$_LoadFollowingsRequest) then) =
      __$$_LoadFollowingsRequestCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$$_LoadFollowingsRequestCopyWithImpl<$Res>
    extends _$FollowEventCopyWithImpl<$Res>
    implements _$$_LoadFollowingsRequestCopyWith<$Res> {
  __$$_LoadFollowingsRequestCopyWithImpl(_$_LoadFollowingsRequest _value,
      $Res Function(_$_LoadFollowingsRequest) _then)
      : super(_value, (v) => _then(v as _$_LoadFollowingsRequest));

  @override
  _$_LoadFollowingsRequest get _value =>
      super._value as _$_LoadFollowingsRequest;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_LoadFollowingsRequest(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadFollowingsRequest implements _LoadFollowingsRequest {
  const _$_LoadFollowingsRequest(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FollowEvent.loadFollowingsRequest(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFollowingsRequest &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_LoadFollowingsRequestCopyWith<_$_LoadFollowingsRequest> get copyWith =>
      __$$_LoadFollowingsRequestCopyWithImpl<_$_LoadFollowingsRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) loadFollowingsRequest,
    required TResult Function(int id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return loadFollowingsRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
    TResult Function()? resetRequest,
  }) {
    return loadFollowingsRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
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
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
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
  const factory _LoadFollowingsRequest(final int id) = _$_LoadFollowingsRequest;

  int get id;
  @JsonKey(ignore: true)
  _$$_LoadFollowingsRequestCopyWith<_$_LoadFollowingsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFollowersRequestCopyWith<$Res> {
  factory _$$_LoadFollowersRequestCopyWith(_$_LoadFollowersRequest value,
          $Res Function(_$_LoadFollowersRequest) then) =
      __$$_LoadFollowersRequestCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$$_LoadFollowersRequestCopyWithImpl<$Res>
    extends _$FollowEventCopyWithImpl<$Res>
    implements _$$_LoadFollowersRequestCopyWith<$Res> {
  __$$_LoadFollowersRequestCopyWithImpl(_$_LoadFollowersRequest _value,
      $Res Function(_$_LoadFollowersRequest) _then)
      : super(_value, (v) => _then(v as _$_LoadFollowersRequest));

  @override
  _$_LoadFollowersRequest get _value => super._value as _$_LoadFollowersRequest;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_LoadFollowersRequest(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadFollowersRequest implements _LoadFollowersRequest {
  const _$_LoadFollowersRequest(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FollowEvent.loadFollowersRequest(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFollowersRequest &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_LoadFollowersRequestCopyWith<_$_LoadFollowersRequest> get copyWith =>
      __$$_LoadFollowersRequestCopyWithImpl<_$_LoadFollowersRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) loadFollowingsRequest,
    required TResult Function(int id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return loadFollowersRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
    TResult Function()? resetRequest,
  }) {
    return loadFollowersRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
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
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
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
  const factory _LoadFollowersRequest(final int id) = _$_LoadFollowersRequest;

  int get id;
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
    extends _$FollowEventCopyWithImpl<$Res>
    implements _$$_ResetRequestCopyWith<$Res> {
  __$$_ResetRequestCopyWithImpl(
      _$_ResetRequest _value, $Res Function(_$_ResetRequest) _then)
      : super(_value, (v) => _then(v as _$_ResetRequest));

  @override
  _$_ResetRequest get _value => super._value as _$_ResetRequest;
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
    required TResult Function(int id) loadFollowingsRequest,
    required TResult Function(int id) loadFollowersRequest,
    required TResult Function() resetRequest,
  }) {
    return resetRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
    TResult Function()? resetRequest,
  }) {
    return resetRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadFollowingsRequest,
    TResult Function(int id)? loadFollowersRequest,
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
    TResult Function(_LoadFollowingsRequest value)? loadFollowingsRequest,
    TResult Function(_LoadFollowersRequest value)? loadFollowersRequest,
    TResult Function(_ResetRequest value)? resetRequest,
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
      _$FollowStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res> implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  final FollowState _value;
  // ignore: unused_field
  final $Res Function(FollowState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? loadFailureOrSuccessOption = freezed,
    Object? users = freezed,
    Object? isLast = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: loadFailureOrSuccessOption == freezed
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, PageUser>>,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      isLast: isLast == freezed
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FollowStateCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$$_FollowStateCopyWith(
          _$_FollowState value, $Res Function(_$_FollowState) then) =
      __$$_FollowStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Option<Either<ProfileFailure, PageUser>> loadFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class __$$_FollowStateCopyWithImpl<$Res> extends _$FollowStateCopyWithImpl<$Res>
    implements _$$_FollowStateCopyWith<$Res> {
  __$$_FollowStateCopyWithImpl(
      _$_FollowState _value, $Res Function(_$_FollowState) _then)
      : super(_value, (v) => _then(v as _$_FollowState));

  @override
  _$_FollowState get _value => super._value as _$_FollowState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? loadFailureOrSuccessOption = freezed,
    Object? users = freezed,
    Object? isLast = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_$_FollowState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: loadFailureOrSuccessOption == freezed
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, PageUser>>,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      isLast: isLast == freezed
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      cursor: cursor == freezed
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
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(
                other.loadFailureOrSuccessOption, loadFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other.isLast, isLast) &&
            const DeepCollectionEquality().equals(other.cursor, cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(loadFailureOrSuccessOption),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(isLast),
      const DeepCollectionEquality().hash(cursor));

  @JsonKey(ignore: true)
  @override
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
