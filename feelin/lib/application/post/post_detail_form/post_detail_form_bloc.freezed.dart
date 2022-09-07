// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_detail_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostDetailFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview playlistPreview)
        playlistPreviewChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PlaylistPreviewChanged value)
        playlistPreviewChanged,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailFormEventCopyWith<$Res> {
  factory $PostDetailFormEventCopyWith(
          PostDetailFormEvent value, $Res Function(PostDetailFormEvent) then) =
      _$PostDetailFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostDetailFormEventCopyWithImpl<$Res>
    implements $PostDetailFormEventCopyWith<$Res> {
  _$PostDetailFormEventCopyWithImpl(this._value, this._then);

  final PostDetailFormEvent _value;
  // ignore: unused_field
  final $Res Function(PostDetailFormEvent) _then;
}

/// @nodoc
abstract class _$$_TitleChangedCopyWith<$Res> {
  factory _$$_TitleChangedCopyWith(
          _$_TitleChanged value, $Res Function(_$_TitleChanged) then) =
      __$$_TitleChangedCopyWithImpl<$Res>;
  $Res call({String titleStr});
}

/// @nodoc
class __$$_TitleChangedCopyWithImpl<$Res>
    extends _$PostDetailFormEventCopyWithImpl<$Res>
    implements _$$_TitleChangedCopyWith<$Res> {
  __$$_TitleChangedCopyWithImpl(
      _$_TitleChanged _value, $Res Function(_$_TitleChanged) _then)
      : super(_value, (v) => _then(v as _$_TitleChanged));

  @override
  _$_TitleChanged get _value => super._value as _$_TitleChanged;

  @override
  $Res call({
    Object? titleStr = freezed,
  }) {
    return _then(_$_TitleChanged(
      titleStr == freezed
          ? _value.titleStr
          : titleStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TitleChanged implements _TitleChanged {
  const _$_TitleChanged(this.titleStr);

  @override
  final String titleStr;

  @override
  String toString() {
    return 'PostDetailFormEvent.titleChanged(titleStr: $titleStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TitleChanged &&
            const DeepCollectionEquality().equals(other.titleStr, titleStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(titleStr));

  @JsonKey(ignore: true)
  @override
  _$$_TitleChangedCopyWith<_$_TitleChanged> get copyWith =>
      __$$_TitleChangedCopyWithImpl<_$_TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview playlistPreview)
        playlistPreviewChanged,
    required TResult Function() submitted,
  }) {
    return titleChanged(titleStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
  }) {
    return titleChanged?.call(titleStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(titleStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PlaylistPreviewChanged value)
        playlistPreviewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChanged implements PostDetailFormEvent {
  const factory _TitleChanged(final String titleStr) = _$_TitleChanged;

  String get titleStr;
  @JsonKey(ignore: true)
  _$$_TitleChangedCopyWith<_$_TitleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContentChangedCopyWith<$Res> {
  factory _$$_ContentChangedCopyWith(
          _$_ContentChanged value, $Res Function(_$_ContentChanged) then) =
      __$$_ContentChangedCopyWithImpl<$Res>;
  $Res call({String contentStr});
}

/// @nodoc
class __$$_ContentChangedCopyWithImpl<$Res>
    extends _$PostDetailFormEventCopyWithImpl<$Res>
    implements _$$_ContentChangedCopyWith<$Res> {
  __$$_ContentChangedCopyWithImpl(
      _$_ContentChanged _value, $Res Function(_$_ContentChanged) _then)
      : super(_value, (v) => _then(v as _$_ContentChanged));

  @override
  _$_ContentChanged get _value => super._value as _$_ContentChanged;

  @override
  $Res call({
    Object? contentStr = freezed,
  }) {
    return _then(_$_ContentChanged(
      contentStr == freezed
          ? _value.contentStr
          : contentStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ContentChanged implements _ContentChanged {
  const _$_ContentChanged(this.contentStr);

  @override
  final String contentStr;

  @override
  String toString() {
    return 'PostDetailFormEvent.contentChanged(contentStr: $contentStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentChanged &&
            const DeepCollectionEquality()
                .equals(other.contentStr, contentStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(contentStr));

  @JsonKey(ignore: true)
  @override
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      __$$_ContentChangedCopyWithImpl<_$_ContentChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview playlistPreview)
        playlistPreviewChanged,
    required TResult Function() submitted,
  }) {
    return contentChanged(contentStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
  }) {
    return contentChanged?.call(contentStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(contentStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PlaylistPreviewChanged value)
        playlistPreviewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return contentChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return contentChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(this);
    }
    return orElse();
  }
}

abstract class _ContentChanged implements PostDetailFormEvent {
  const factory _ContentChanged(final String contentStr) = _$_ContentChanged;

  String get contentStr;
  @JsonKey(ignore: true)
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PlaylistPreviewChangedCopyWith<$Res> {
  factory _$$_PlaylistPreviewChangedCopyWith(_$_PlaylistPreviewChanged value,
          $Res Function(_$_PlaylistPreviewChanged) then) =
      __$$_PlaylistPreviewChangedCopyWithImpl<$Res>;
  $Res call({PlaylistPreview playlistPreview});
}

/// @nodoc
class __$$_PlaylistPreviewChangedCopyWithImpl<$Res>
    extends _$PostDetailFormEventCopyWithImpl<$Res>
    implements _$$_PlaylistPreviewChangedCopyWith<$Res> {
  __$$_PlaylistPreviewChangedCopyWithImpl(_$_PlaylistPreviewChanged _value,
      $Res Function(_$_PlaylistPreviewChanged) _then)
      : super(_value, (v) => _then(v as _$_PlaylistPreviewChanged));

  @override
  _$_PlaylistPreviewChanged get _value =>
      super._value as _$_PlaylistPreviewChanged;

  @override
  $Res call({
    Object? playlistPreview = freezed,
  }) {
    return _then(_$_PlaylistPreviewChanged(
      playlistPreview == freezed
          ? _value.playlistPreview
          : playlistPreview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
    ));
  }
}

/// @nodoc

class _$_PlaylistPreviewChanged implements _PlaylistPreviewChanged {
  const _$_PlaylistPreviewChanged(this.playlistPreview);

  @override
  final PlaylistPreview playlistPreview;

  @override
  String toString() {
    return 'PostDetailFormEvent.playlistPreviewChanged(playlistPreview: $playlistPreview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistPreviewChanged &&
            const DeepCollectionEquality()
                .equals(other.playlistPreview, playlistPreview));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(playlistPreview));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistPreviewChangedCopyWith<_$_PlaylistPreviewChanged> get copyWith =>
      __$$_PlaylistPreviewChangedCopyWithImpl<_$_PlaylistPreviewChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview playlistPreview)
        playlistPreviewChanged,
    required TResult Function() submitted,
  }) {
    return playlistPreviewChanged(playlistPreview);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
  }) {
    return playlistPreviewChanged?.call(playlistPreview);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (playlistPreviewChanged != null) {
      return playlistPreviewChanged(playlistPreview);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PlaylistPreviewChanged value)
        playlistPreviewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return playlistPreviewChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return playlistPreviewChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (playlistPreviewChanged != null) {
      return playlistPreviewChanged(this);
    }
    return orElse();
  }
}

abstract class _PlaylistPreviewChanged implements PostDetailFormEvent {
  const factory _PlaylistPreviewChanged(final PlaylistPreview playlistPreview) =
      _$_PlaylistPreviewChanged;

  PlaylistPreview get playlistPreview;
  @JsonKey(ignore: true)
  _$$_PlaylistPreviewChangedCopyWith<_$_PlaylistPreviewChanged> get copyWith =>
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
    extends _$PostDetailFormEventCopyWithImpl<$Res>
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
    return 'PostDetailFormEvent.submitted()';
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
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview playlistPreview)
        playlistPreviewChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
    TResult Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview playlistPreview)? playlistPreviewChanged,
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
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PlaylistPreviewChanged value)
        playlistPreviewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PlaylistPreviewChanged value)? playlistPreviewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements PostDetailFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$PostDetailFormState {
  NotEmptyString get title => throw _privateConstructorUsedError;
  ContentString get content => throw _privateConstructorUsedError;
  PlaylistPreview get playlistPreview => throw _privateConstructorUsedError;
  Option<Either<PostFailure, Unit>> get postFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostDetailFormStateCopyWith<PostDetailFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailFormStateCopyWith<$Res> {
  factory $PostDetailFormStateCopyWith(
          PostDetailFormState value, $Res Function(PostDetailFormState) then) =
      _$PostDetailFormStateCopyWithImpl<$Res>;
  $Res call(
      {NotEmptyString title,
      ContentString content,
      PlaylistPreview playlistPreview,
      Option<Either<PostFailure, Unit>> postFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class _$PostDetailFormStateCopyWithImpl<$Res>
    implements $PostDetailFormStateCopyWith<$Res> {
  _$PostDetailFormStateCopyWithImpl(this._value, this._then);

  final PostDetailFormState _value;
  // ignore: unused_field
  final $Res Function(PostDetailFormState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? playlistPreview = freezed,
    Object? postFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentString,
      playlistPreview: playlistPreview == freezed
          ? _value.playlistPreview
          : playlistPreview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
      postFailureOrSuccessOption: postFailureOrSuccessOption == freezed
          ? _value.postFailureOrSuccessOption
          : postFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PostDetailFormStateCopyWith<$Res>
    implements $PostDetailFormStateCopyWith<$Res> {
  factory _$$_PostDetailFormStateCopyWith(_$_PostDetailFormState value,
          $Res Function(_$_PostDetailFormState) then) =
      __$$_PostDetailFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotEmptyString title,
      ContentString content,
      PlaylistPreview playlistPreview,
      Option<Either<PostFailure, Unit>> postFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class __$$_PostDetailFormStateCopyWithImpl<$Res>
    extends _$PostDetailFormStateCopyWithImpl<$Res>
    implements _$$_PostDetailFormStateCopyWith<$Res> {
  __$$_PostDetailFormStateCopyWithImpl(_$_PostDetailFormState _value,
      $Res Function(_$_PostDetailFormState) _then)
      : super(_value, (v) => _then(v as _$_PostDetailFormState));

  @override
  _$_PostDetailFormState get _value => super._value as _$_PostDetailFormState;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? playlistPreview = freezed,
    Object? postFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_PostDetailFormState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentString,
      playlistPreview: playlistPreview == freezed
          ? _value.playlistPreview
          : playlistPreview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
      postFailureOrSuccessOption: postFailureOrSuccessOption == freezed
          ? _value.postFailureOrSuccessOption
          : postFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostDetailFormState implements _PostDetailFormState {
  const _$_PostDetailFormState(
      {required this.title,
      required this.content,
      required this.playlistPreview,
      required this.postFailureOrSuccessOption,
      required this.isSubmitting});

  @override
  final NotEmptyString title;
  @override
  final ContentString content;
  @override
  final PlaylistPreview playlistPreview;
  @override
  final Option<Either<PostFailure, Unit>> postFailureOrSuccessOption;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'PostDetailFormState(title: $title, content: $content, playlistPreview: $playlistPreview, postFailureOrSuccessOption: $postFailureOrSuccessOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDetailFormState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.playlistPreview, playlistPreview) &&
            const DeepCollectionEquality().equals(
                other.postFailureOrSuccessOption, postFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(playlistPreview),
      const DeepCollectionEquality().hash(postFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_PostDetailFormStateCopyWith<_$_PostDetailFormState> get copyWith =>
      __$$_PostDetailFormStateCopyWithImpl<_$_PostDetailFormState>(
          this, _$identity);
}

abstract class _PostDetailFormState implements PostDetailFormState {
  const factory _PostDetailFormState(
      {required final NotEmptyString title,
      required final ContentString content,
      required final PlaylistPreview playlistPreview,
      required final Option<Either<PostFailure, Unit>>
          postFailureOrSuccessOption,
      required final bool isSubmitting}) = _$_PostDetailFormState;

  @override
  NotEmptyString get title;
  @override
  ContentString get content;
  @override
  PlaylistPreview get playlistPreview;
  @override
  Option<Either<PostFailure, Unit>> get postFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_PostDetailFormStateCopyWith<_$_PostDetailFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
