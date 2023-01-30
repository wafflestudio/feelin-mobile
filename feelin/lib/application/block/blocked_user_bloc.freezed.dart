// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockedUserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequest,
    required TResult Function() resetRequest,
    required TResult Function(int index) unblockRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequest,
    TResult? Function()? resetRequest,
    TResult? Function(int index)? unblockRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequest,
    TResult Function()? resetRequest,
    TResult Function(int index)? unblockRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ResetRequest value) resetRequest,
    required TResult Function(_UnBlockRequest value) unblockRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
    TResult? Function(_UnBlockRequest value)? unblockRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    TResult Function(_UnBlockRequest value)? unblockRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUserEventCopyWith<$Res> {
  factory $BlockedUserEventCopyWith(
          BlockedUserEvent value, $Res Function(BlockedUserEvent) then) =
      _$BlockedUserEventCopyWithImpl<$Res, BlockedUserEvent>;
}

/// @nodoc
class _$BlockedUserEventCopyWithImpl<$Res, $Val extends BlockedUserEvent>
    implements $BlockedUserEventCopyWith<$Res> {
  _$BlockedUserEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$_LoadRequestCopyWithImpl<$Res>
    extends _$BlockedUserEventCopyWithImpl<$Res, _$_LoadRequest>
    implements _$$_LoadRequestCopyWith<$Res> {
  __$$_LoadRequestCopyWithImpl(
      _$_LoadRequest _value, $Res Function(_$_LoadRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadRequest implements _LoadRequest {
  const _$_LoadRequest();

  @override
  String toString() {
    return 'BlockedUserEvent.loadRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequest,
    required TResult Function() resetRequest,
    required TResult Function(int index) unblockRequest,
  }) {
    return loadRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequest,
    TResult? Function()? resetRequest,
    TResult? Function(int index)? unblockRequest,
  }) {
    return loadRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequest,
    TResult Function()? resetRequest,
    TResult Function(int index)? unblockRequest,
    required TResult orElse(),
  }) {
    if (loadRequest != null) {
      return loadRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ResetRequest value) resetRequest,
    required TResult Function(_UnBlockRequest value) unblockRequest,
  }) {
    return loadRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
    TResult? Function(_UnBlockRequest value)? unblockRequest,
  }) {
    return loadRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    TResult Function(_UnBlockRequest value)? unblockRequest,
    required TResult orElse(),
  }) {
    if (loadRequest != null) {
      return loadRequest(this);
    }
    return orElse();
  }
}

abstract class _LoadRequest implements BlockedUserEvent {
  const factory _LoadRequest() = _$_LoadRequest;
}

/// @nodoc
abstract class _$$_ResetRequestCopyWith<$Res> {
  factory _$$_ResetRequestCopyWith(
          _$_ResetRequest value, $Res Function(_$_ResetRequest) then) =
      __$$_ResetRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetRequestCopyWithImpl<$Res>
    extends _$BlockedUserEventCopyWithImpl<$Res, _$_ResetRequest>
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
    return 'BlockedUserEvent.resetRequest()';
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
    required TResult Function() loadRequest,
    required TResult Function() resetRequest,
    required TResult Function(int index) unblockRequest,
  }) {
    return resetRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequest,
    TResult? Function()? resetRequest,
    TResult? Function(int index)? unblockRequest,
  }) {
    return resetRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequest,
    TResult Function()? resetRequest,
    TResult Function(int index)? unblockRequest,
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
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ResetRequest value) resetRequest,
    required TResult Function(_UnBlockRequest value) unblockRequest,
  }) {
    return resetRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
    TResult? Function(_UnBlockRequest value)? unblockRequest,
  }) {
    return resetRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    TResult Function(_UnBlockRequest value)? unblockRequest,
    required TResult orElse(),
  }) {
    if (resetRequest != null) {
      return resetRequest(this);
    }
    return orElse();
  }
}

abstract class _ResetRequest implements BlockedUserEvent {
  const factory _ResetRequest() = _$_ResetRequest;
}

/// @nodoc
abstract class _$$_UnBlockRequestCopyWith<$Res> {
  factory _$$_UnBlockRequestCopyWith(
          _$_UnBlockRequest value, $Res Function(_$_UnBlockRequest) then) =
      __$$_UnBlockRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_UnBlockRequestCopyWithImpl<$Res>
    extends _$BlockedUserEventCopyWithImpl<$Res, _$_UnBlockRequest>
    implements _$$_UnBlockRequestCopyWith<$Res> {
  __$$_UnBlockRequestCopyWithImpl(
      _$_UnBlockRequest _value, $Res Function(_$_UnBlockRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_UnBlockRequest(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UnBlockRequest implements _UnBlockRequest {
  const _$_UnBlockRequest(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'BlockedUserEvent.unblockRequest(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnBlockRequest &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnBlockRequestCopyWith<_$_UnBlockRequest> get copyWith =>
      __$$_UnBlockRequestCopyWithImpl<_$_UnBlockRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequest,
    required TResult Function() resetRequest,
    required TResult Function(int index) unblockRequest,
  }) {
    return unblockRequest(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequest,
    TResult? Function()? resetRequest,
    TResult? Function(int index)? unblockRequest,
  }) {
    return unblockRequest?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequest,
    TResult Function()? resetRequest,
    TResult Function(int index)? unblockRequest,
    required TResult orElse(),
  }) {
    if (unblockRequest != null) {
      return unblockRequest(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequest value) loadRequest,
    required TResult Function(_ResetRequest value) resetRequest,
    required TResult Function(_UnBlockRequest value) unblockRequest,
  }) {
    return unblockRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequest value)? loadRequest,
    TResult? Function(_ResetRequest value)? resetRequest,
    TResult? Function(_UnBlockRequest value)? unblockRequest,
  }) {
    return unblockRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequest value)? loadRequest,
    TResult Function(_ResetRequest value)? resetRequest,
    TResult Function(_UnBlockRequest value)? unblockRequest,
    required TResult orElse(),
  }) {
    if (unblockRequest != null) {
      return unblockRequest(this);
    }
    return orElse();
  }
}

abstract class _UnBlockRequest implements BlockedUserEvent {
  const factory _UnBlockRequest(final int index) = _$_UnBlockRequest;

  int get index;
  @JsonKey(ignore: true)
  _$$_UnBlockRequestCopyWith<_$_UnBlockRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlockedUserState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<BlockFailure, PageUser>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<BlockFailure, Unit>> get unblockFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<Profile> get users => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;
  String? get cursor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockedUserStateCopyWith<BlockedUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUserStateCopyWith<$Res> {
  factory $BlockedUserStateCopyWith(
          BlockedUserState value, $Res Function(BlockedUserState) then) =
      _$BlockedUserStateCopyWithImpl<$Res, BlockedUserState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<BlockFailure, PageUser>> loadFailureOrSuccessOption,
      Option<Either<BlockFailure, Unit>> unblockFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class _$BlockedUserStateCopyWithImpl<$Res, $Val extends BlockedUserState>
    implements $BlockedUserStateCopyWith<$Res> {
  _$BlockedUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
    Object? unblockFailureOrSuccessOption = null,
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
              as Option<Either<BlockFailure, PageUser>>,
      unblockFailureOrSuccessOption: null == unblockFailureOrSuccessOption
          ? _value.unblockFailureOrSuccessOption
          : unblockFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BlockFailure, Unit>>,
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
abstract class _$$_BlockedUserStateCopyWith<$Res>
    implements $BlockedUserStateCopyWith<$Res> {
  factory _$$_BlockedUserStateCopyWith(
          _$_BlockedUserState value, $Res Function(_$_BlockedUserState) then) =
      __$$_BlockedUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<BlockFailure, PageUser>> loadFailureOrSuccessOption,
      Option<Either<BlockFailure, Unit>> unblockFailureOrSuccessOption,
      List<Profile> users,
      bool isLast,
      String? cursor});
}

/// @nodoc
class __$$_BlockedUserStateCopyWithImpl<$Res>
    extends _$BlockedUserStateCopyWithImpl<$Res, _$_BlockedUserState>
    implements _$$_BlockedUserStateCopyWith<$Res> {
  __$$_BlockedUserStateCopyWithImpl(
      _$_BlockedUserState _value, $Res Function(_$_BlockedUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
    Object? unblockFailureOrSuccessOption = null,
    Object? users = null,
    Object? isLast = null,
    Object? cursor = freezed,
  }) {
    return _then(_$_BlockedUserState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BlockFailure, PageUser>>,
      unblockFailureOrSuccessOption: null == unblockFailureOrSuccessOption
          ? _value.unblockFailureOrSuccessOption
          : unblockFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BlockFailure, Unit>>,
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

class _$_BlockedUserState implements _BlockedUserState {
  const _$_BlockedUserState(
      {required this.isLoading,
      required this.loadFailureOrSuccessOption,
      required this.unblockFailureOrSuccessOption,
      required final List<Profile> users,
      required this.isLast,
      required this.cursor})
      : _users = users;

  @override
  final bool isLoading;
  @override
  final Option<Either<BlockFailure, PageUser>> loadFailureOrSuccessOption;
  @override
  final Option<Either<BlockFailure, Unit>> unblockFailureOrSuccessOption;
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
    return 'BlockedUserState(isLoading: $isLoading, loadFailureOrSuccessOption: $loadFailureOrSuccessOption, unblockFailureOrSuccessOption: $unblockFailureOrSuccessOption, users: $users, isLast: $isLast, cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockedUserState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption) &&
            (identical(other.unblockFailureOrSuccessOption,
                    unblockFailureOrSuccessOption) ||
                other.unblockFailureOrSuccessOption ==
                    unblockFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isLast, isLast) || other.isLast == isLast) &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      loadFailureOrSuccessOption,
      unblockFailureOrSuccessOption,
      const DeepCollectionEquality().hash(_users),
      isLast,
      cursor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockedUserStateCopyWith<_$_BlockedUserState> get copyWith =>
      __$$_BlockedUserStateCopyWithImpl<_$_BlockedUserState>(this, _$identity);
}

abstract class _BlockedUserState implements BlockedUserState {
  const factory _BlockedUserState(
      {required final bool isLoading,
      required final Option<Either<BlockFailure, PageUser>>
          loadFailureOrSuccessOption,
      required final Option<Either<BlockFailure, Unit>>
          unblockFailureOrSuccessOption,
      required final List<Profile> users,
      required final bool isLast,
      required final String? cursor}) = _$_BlockedUserState;

  @override
  bool get isLoading;
  @override
  Option<Either<BlockFailure, PageUser>> get loadFailureOrSuccessOption;
  @override
  Option<Either<BlockFailure, Unit>> get unblockFailureOrSuccessOption;
  @override
  List<Profile> get users;
  @override
  bool get isLast;
  @override
  String? get cursor;
  @override
  @JsonKey(ignore: true)
  _$$_BlockedUserStateCopyWith<_$_BlockedUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
