// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileRequest,
    required TResult Function(Profile profile) profileChanged,
    required TResult Function(int page) pageRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileRequest value) profileRequest,
    required TResult Function(_ProfileChanged value) profileChanged,
    required TResult Function(_PageRequest value) pageRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  final ProfileEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileEvent) _then;
}

/// @nodoc
abstract class _$$_ProfileRequestCopyWith<$Res> {
  factory _$$_ProfileRequestCopyWith(
          _$_ProfileRequest value, $Res Function(_$_ProfileRequest) then) =
      __$$_ProfileRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProfileRequestCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements _$$_ProfileRequestCopyWith<$Res> {
  __$$_ProfileRequestCopyWithImpl(
      _$_ProfileRequest _value, $Res Function(_$_ProfileRequest) _then)
      : super(_value, (v) => _then(v as _$_ProfileRequest));

  @override
  _$_ProfileRequest get _value => super._value as _$_ProfileRequest;
}

/// @nodoc

class _$_ProfileRequest implements _ProfileRequest {
  const _$_ProfileRequest();

  @override
  String toString() {
    return 'ProfileEvent.profileRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProfileRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileRequest,
    required TResult Function(Profile profile) profileChanged,
    required TResult Function(int page) pageRequest,
  }) {
    return profileRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
  }) {
    return profileRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
    required TResult orElse(),
  }) {
    if (profileRequest != null) {
      return profileRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileRequest value) profileRequest,
    required TResult Function(_ProfileChanged value) profileChanged,
    required TResult Function(_PageRequest value) pageRequest,
  }) {
    return profileRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
  }) {
    return profileRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
    required TResult orElse(),
  }) {
    if (profileRequest != null) {
      return profileRequest(this);
    }
    return orElse();
  }
}

abstract class _ProfileRequest implements ProfileEvent {
  const factory _ProfileRequest() = _$_ProfileRequest;
}

/// @nodoc
abstract class _$$_ProfileChangedCopyWith<$Res> {
  factory _$$_ProfileChangedCopyWith(
          _$_ProfileChanged value, $Res Function(_$_ProfileChanged) then) =
      __$$_ProfileChangedCopyWithImpl<$Res>;
  $Res call({Profile profile});
}

/// @nodoc
class __$$_ProfileChangedCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements _$$_ProfileChangedCopyWith<$Res> {
  __$$_ProfileChangedCopyWithImpl(
      _$_ProfileChanged _value, $Res Function(_$_ProfileChanged) _then)
      : super(_value, (v) => _then(v as _$_ProfileChanged));

  @override
  _$_ProfileChanged get _value => super._value as _$_ProfileChanged;

  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(_$_ProfileChanged(
      profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc

class _$_ProfileChanged implements _ProfileChanged {
  const _$_ProfileChanged(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.profileChanged(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileChanged &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(profile));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileChangedCopyWith<_$_ProfileChanged> get copyWith =>
      __$$_ProfileChangedCopyWithImpl<_$_ProfileChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileRequest,
    required TResult Function(Profile profile) profileChanged,
    required TResult Function(int page) pageRequest,
  }) {
    return profileChanged(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
  }) {
    return profileChanged?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
    required TResult orElse(),
  }) {
    if (profileChanged != null) {
      return profileChanged(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileRequest value) profileRequest,
    required TResult Function(_ProfileChanged value) profileChanged,
    required TResult Function(_PageRequest value) pageRequest,
  }) {
    return profileChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
  }) {
    return profileChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
    required TResult orElse(),
  }) {
    if (profileChanged != null) {
      return profileChanged(this);
    }
    return orElse();
  }
}

abstract class _ProfileChanged implements ProfileEvent {
  const factory _ProfileChanged(final Profile profile) = _$_ProfileChanged;

  Profile get profile;
  @JsonKey(ignore: true)
  _$$_ProfileChangedCopyWith<_$_ProfileChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PageRequestCopyWith<$Res> {
  factory _$$_PageRequestCopyWith(
          _$_PageRequest value, $Res Function(_$_PageRequest) then) =
      __$$_PageRequestCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class __$$_PageRequestCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements _$$_PageRequestCopyWith<$Res> {
  __$$_PageRequestCopyWithImpl(
      _$_PageRequest _value, $Res Function(_$_PageRequest) _then)
      : super(_value, (v) => _then(v as _$_PageRequest));

  @override
  _$_PageRequest get _value => super._value as _$_PageRequest;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$_PageRequest(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageRequest implements _PageRequest {
  const _$_PageRequest(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'ProfileEvent.pageRequest(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageRequest &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$_PageRequestCopyWith<_$_PageRequest> get copyWith =>
      __$$_PageRequestCopyWithImpl<_$_PageRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileRequest,
    required TResult Function(Profile profile) profileChanged,
    required TResult Function(int page) pageRequest,
  }) {
    return pageRequest(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
  }) {
    return pageRequest?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileRequest,
    TResult Function(Profile profile)? profileChanged,
    TResult Function(int page)? pageRequest,
    required TResult orElse(),
  }) {
    if (pageRequest != null) {
      return pageRequest(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileRequest value) profileRequest,
    required TResult Function(_ProfileChanged value) profileChanged,
    required TResult Function(_PageRequest value) pageRequest,
  }) {
    return pageRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
  }) {
    return pageRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileRequest value)? profileRequest,
    TResult Function(_ProfileChanged value)? profileChanged,
    TResult Function(_PageRequest value)? pageRequest,
    required TResult orElse(),
  }) {
    if (pageRequest != null) {
      return pageRequest(this);
    }
    return orElse();
  }
}

abstract class _PageRequest implements ProfileEvent {
  const factory _PageRequest(final int page) = _$_PageRequest;

  int get page;
  @JsonKey(ignore: true)
  _$$_PageRequestCopyWith<_$_PageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  Option<Either<ProfileFailure, Pageable>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;
  bool get isLoaded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<ProfileFailure, Pageable>> loadFailureOrSuccessOption,
      List<Post> posts,
      Profile profile,
      bool isLoading,
      bool isLast,
      bool isLoaded});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;

  @override
  $Res call({
    Object? loadFailureOrSuccessOption = freezed,
    Object? posts = freezed,
    Object? profile = freezed,
    Object? isLoading = freezed,
    Object? isLast = freezed,
    Object? isLoaded = freezed,
  }) {
    return _then(_value.copyWith(
      loadFailureOrSuccessOption: loadFailureOrSuccessOption == freezed
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, Pageable>>,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: isLast == freezed
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<Either<ProfileFailure, Pageable>> loadFailureOrSuccessOption,
      List<Post> posts,
      Profile profile,
      bool isLoading,
      bool isLast,
      bool isLoaded});
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, (v) => _then(v as _$_ProfileState));

  @override
  _$_ProfileState get _value => super._value as _$_ProfileState;

  @override
  $Res call({
    Object? loadFailureOrSuccessOption = freezed,
    Object? posts = freezed,
    Object? profile = freezed,
    Object? isLoading = freezed,
    Object? isLast = freezed,
    Object? isLoaded = freezed,
  }) {
    return _then(_$_ProfileState(
      loadFailureOrSuccessOption: loadFailureOrSuccessOption == freezed
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, Pageable>>,
      posts: posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: isLast == freezed
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {required this.loadFailureOrSuccessOption,
      required final List<Post> posts,
      required this.profile,
      required this.isLoading,
      required this.isLast,
      required this.isLoaded})
      : _posts = posts;

  @override
  final Option<Either<ProfileFailure, Pageable>> loadFailureOrSuccessOption;
  final List<Post> _posts;
  @override
  List<Post> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final Profile profile;
  @override
  final bool isLoading;
  @override
  final bool isLast;
  @override
  final bool isLoaded;

  @override
  String toString() {
    return 'ProfileState(loadFailureOrSuccessOption: $loadFailureOrSuccessOption, posts: $posts, profile: $profile, isLoading: $isLoading, isLast: $isLast, isLoaded: $isLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            const DeepCollectionEquality().equals(
                other.loadFailureOrSuccessOption, loadFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isLast, isLast) &&
            const DeepCollectionEquality().equals(other.isLoaded, isLoaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadFailureOrSuccessOption),
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isLast),
      const DeepCollectionEquality().hash(isLoaded));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {required final Option<Either<ProfileFailure, Pageable>>
          loadFailureOrSuccessOption,
      required final List<Post> posts,
      required final Profile profile,
      required final bool isLoading,
      required final bool isLast,
      required final bool isLoaded}) = _$_ProfileState;

  @override
  Option<Either<ProfileFailure, Pageable>> get loadFailureOrSuccessOption;
  @override
  List<Post> get posts;
  @override
  Profile get profile;
  @override
  bool get isLoading;
  @override
  bool get isLast;
  @override
  bool get isLoaded;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
