// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_post_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditPostFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPostFormEventCopyWith<$Res> {
  factory $EditPostFormEventCopyWith(
          EditPostFormEvent value, $Res Function(EditPostFormEvent) then) =
      _$EditPostFormEventCopyWithImpl<$Res, EditPostFormEvent>;
}

/// @nodoc
class _$EditPostFormEventCopyWithImpl<$Res, $Val extends EditPostFormEvent>
    implements $EditPostFormEventCopyWith<$Res> {
  _$EditPostFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IdChangedCopyWith<$Res> {
  factory _$$_IdChangedCopyWith(
          _$_IdChanged value, $Res Function(_$_IdChanged) then) =
      __$$_IdChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_IdChangedCopyWithImpl<$Res>
    extends _$EditPostFormEventCopyWithImpl<$Res, _$_IdChanged>
    implements _$$_IdChangedCopyWith<$Res> {
  __$$_IdChangedCopyWithImpl(
      _$_IdChanged _value, $Res Function(_$_IdChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_IdChanged(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IdChanged implements _IdChanged {
  const _$_IdChanged(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'EditPostFormEvent.idChanged(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdChanged &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdChangedCopyWith<_$_IdChanged> get copyWith =>
      __$$_IdChangedCopyWithImpl<_$_IdChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) {
    return idChanged(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) {
    return idChanged?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (idChanged != null) {
      return idChanged(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return idChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return idChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (idChanged != null) {
      return idChanged(this);
    }
    return orElse();
  }
}

abstract class _IdChanged implements EditPostFormEvent {
  const factory _IdChanged(final String id) = _$_IdChanged;

  String get id;
  @JsonKey(ignore: true)
  _$$_IdChangedCopyWith<_$_IdChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TitleChangedCopyWith<$Res> {
  factory _$$_TitleChangedCopyWith(
          _$_TitleChanged value, $Res Function(_$_TitleChanged) then) =
      __$$_TitleChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String titleStr});
}

/// @nodoc
class __$$_TitleChangedCopyWithImpl<$Res>
    extends _$EditPostFormEventCopyWithImpl<$Res, _$_TitleChanged>
    implements _$$_TitleChangedCopyWith<$Res> {
  __$$_TitleChangedCopyWithImpl(
      _$_TitleChanged _value, $Res Function(_$_TitleChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleStr = null,
  }) {
    return _then(_$_TitleChanged(
      null == titleStr
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
    return 'EditPostFormEvent.titleChanged(titleStr: $titleStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TitleChanged &&
            (identical(other.titleStr, titleStr) ||
                other.titleStr == titleStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, titleStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TitleChangedCopyWith<_$_TitleChanged> get copyWith =>
      __$$_TitleChangedCopyWithImpl<_$_TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) {
    return titleChanged(titleStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) {
    return titleChanged?.call(titleStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
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
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChanged implements EditPostFormEvent {
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
  @useResult
  $Res call({String contentStr});
}

/// @nodoc
class __$$_ContentChangedCopyWithImpl<$Res>
    extends _$EditPostFormEventCopyWithImpl<$Res, _$_ContentChanged>
    implements _$$_ContentChangedCopyWith<$Res> {
  __$$_ContentChangedCopyWithImpl(
      _$_ContentChanged _value, $Res Function(_$_ContentChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentStr = null,
  }) {
    return _then(_$_ContentChanged(
      null == contentStr
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
    return 'EditPostFormEvent.contentChanged(contentStr: $contentStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentChanged &&
            (identical(other.contentStr, contentStr) ||
                other.contentStr == contentStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      __$$_ContentChangedCopyWithImpl<_$_ContentChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) {
    return contentChanged(contentStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) {
    return contentChanged?.call(contentStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
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
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return contentChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return contentChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(this);
    }
    return orElse();
  }
}

abstract class _ContentChanged implements EditPostFormEvent {
  const factory _ContentChanged(final String contentStr) = _$_ContentChanged;

  String get contentStr;
  @JsonKey(ignore: true)
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PreviewChangedCopyWith<$Res> {
  factory _$$_PreviewChangedCopyWith(
          _$_PreviewChanged value, $Res Function(_$_PreviewChanged) then) =
      __$$_PreviewChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({PlaylistPreview preview});
}

/// @nodoc
class __$$_PreviewChangedCopyWithImpl<$Res>
    extends _$EditPostFormEventCopyWithImpl<$Res, _$_PreviewChanged>
    implements _$$_PreviewChangedCopyWith<$Res> {
  __$$_PreviewChangedCopyWithImpl(
      _$_PreviewChanged _value, $Res Function(_$_PreviewChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preview = null,
  }) {
    return _then(_$_PreviewChanged(
      null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
    ));
  }
}

/// @nodoc

class _$_PreviewChanged implements _PreviewChanged {
  const _$_PreviewChanged(this.preview);

  @override
  final PlaylistPreview preview;

  @override
  String toString() {
    return 'EditPostFormEvent.previewChanged(preview: $preview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreviewChanged &&
            (identical(other.preview, preview) || other.preview == preview));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreviewChangedCopyWith<_$_PreviewChanged> get copyWith =>
      __$$_PreviewChangedCopyWithImpl<_$_PreviewChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) {
    return previewChanged(preview);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) {
    return previewChanged?.call(preview);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (previewChanged != null) {
      return previewChanged(preview);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return previewChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return previewChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (previewChanged != null) {
      return previewChanged(this);
    }
    return orElse();
  }
}

abstract class _PreviewChanged implements EditPostFormEvent {
  const factory _PreviewChanged(final PlaylistPreview preview) =
      _$_PreviewChanged;

  PlaylistPreview get preview;
  @JsonKey(ignore: true)
  _$$_PreviewChangedCopyWith<_$_PreviewChanged> get copyWith =>
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
    extends _$EditPostFormEventCopyWithImpl<$Res, _$_Submitted>
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
    return 'EditPostFormEvent.submitted()';
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
    required TResult Function(String id) idChanged,
    required TResult Function(String titleStr) titleChanged,
    required TResult Function(String contentStr) contentChanged,
    required TResult Function(PlaylistPreview preview) previewChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? idChanged,
    TResult? Function(String titleStr)? titleChanged,
    TResult? Function(String contentStr)? contentChanged,
    TResult? Function(PlaylistPreview preview)? previewChanged,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? idChanged,
    TResult Function(String titleStr)? titleChanged,
    TResult Function(String contentStr)? contentChanged,
    TResult Function(PlaylistPreview preview)? previewChanged,
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
    required TResult Function(_IdChanged value) idChanged,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_PreviewChanged value) previewChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdChanged value)? idChanged,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_PreviewChanged value)? previewChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdChanged value)? idChanged,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_PreviewChanged value)? previewChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements EditPostFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$EditPostFormState {
  String get postId => throw _privateConstructorUsedError;
  NotEmptyString get title => throw _privateConstructorUsedError;
  ContentString get content => throw _privateConstructorUsedError;
  PlaylistPreview get playlistPreview => throw _privateConstructorUsedError;
  Option<Either<PostFailure, Unit>> get editFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditPostFormStateCopyWith<EditPostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPostFormStateCopyWith<$Res> {
  factory $EditPostFormStateCopyWith(
          EditPostFormState value, $Res Function(EditPostFormState) then) =
      _$EditPostFormStateCopyWithImpl<$Res, EditPostFormState>;
  @useResult
  $Res call(
      {String postId,
      NotEmptyString title,
      ContentString content,
      PlaylistPreview playlistPreview,
      Option<Either<PostFailure, Unit>> editFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class _$EditPostFormStateCopyWithImpl<$Res, $Val extends EditPostFormState>
    implements $EditPostFormStateCopyWith<$Res> {
  _$EditPostFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? playlistPreview = null,
    Object? editFailureOrSuccessOption = null,
    Object? isSubmitting = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentString,
      playlistPreview: null == playlistPreview
          ? _value.playlistPreview
          : playlistPreview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
      editFailureOrSuccessOption: null == editFailureOrSuccessOption
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Unit>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostDetailFormStateCopyWith<$Res>
    implements $EditPostFormStateCopyWith<$Res> {
  factory _$$_PostDetailFormStateCopyWith(_$_PostDetailFormState value,
          $Res Function(_$_PostDetailFormState) then) =
      __$$_PostDetailFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      NotEmptyString title,
      ContentString content,
      PlaylistPreview playlistPreview,
      Option<Either<PostFailure, Unit>> editFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class __$$_PostDetailFormStateCopyWithImpl<$Res>
    extends _$EditPostFormStateCopyWithImpl<$Res, _$_PostDetailFormState>
    implements _$$_PostDetailFormStateCopyWith<$Res> {
  __$$_PostDetailFormStateCopyWithImpl(_$_PostDetailFormState _value,
      $Res Function(_$_PostDetailFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? playlistPreview = null,
    Object? editFailureOrSuccessOption = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$_PostDetailFormState(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotEmptyString,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentString,
      playlistPreview: null == playlistPreview
          ? _value.playlistPreview
          : playlistPreview // ignore: cast_nullable_to_non_nullable
              as PlaylistPreview,
      editFailureOrSuccessOption: null == editFailureOrSuccessOption
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PostFailure, Unit>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostDetailFormState implements _PostDetailFormState {
  const _$_PostDetailFormState(
      {required this.postId,
      required this.title,
      required this.content,
      required this.playlistPreview,
      required this.editFailureOrSuccessOption,
      required this.isSubmitting});

  @override
  final String postId;
  @override
  final NotEmptyString title;
  @override
  final ContentString content;
  @override
  final PlaylistPreview playlistPreview;
  @override
  final Option<Either<PostFailure, Unit>> editFailureOrSuccessOption;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'EditPostFormState(postId: $postId, title: $title, content: $content, playlistPreview: $playlistPreview, editFailureOrSuccessOption: $editFailureOrSuccessOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDetailFormState &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.playlistPreview, playlistPreview) ||
                other.playlistPreview == playlistPreview) &&
            (identical(other.editFailureOrSuccessOption,
                    editFailureOrSuccessOption) ||
                other.editFailureOrSuccessOption ==
                    editFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, title, content,
      playlistPreview, editFailureOrSuccessOption, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostDetailFormStateCopyWith<_$_PostDetailFormState> get copyWith =>
      __$$_PostDetailFormStateCopyWithImpl<_$_PostDetailFormState>(
          this, _$identity);
}

abstract class _PostDetailFormState implements EditPostFormState {
  const factory _PostDetailFormState(
      {required final String postId,
      required final NotEmptyString title,
      required final ContentString content,
      required final PlaylistPreview playlistPreview,
      required final Option<Either<PostFailure, Unit>>
          editFailureOrSuccessOption,
      required final bool isSubmitting}) = _$_PostDetailFormState;

  @override
  String get postId;
  @override
  NotEmptyString get title;
  @override
  ContentString get content;
  @override
  PlaylistPreview get playlistPreview;
  @override
  Option<Either<PostFailure, Unit>> get editFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_PostDetailFormStateCopyWith<_$_PostDetailFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
