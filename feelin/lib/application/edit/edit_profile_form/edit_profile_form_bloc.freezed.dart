// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_profile_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() resetCanUseName,
    required TResult Function(String introductionStr) introductionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_ResetCanUseName value) resetCanUseName,
    required TResult Function(_IntroductionChanged value) introductionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileFormEventCopyWith<$Res> {
  factory $EditProfileFormEventCopyWith(EditProfileFormEvent value,
          $Res Function(EditProfileFormEvent) then) =
      _$EditProfileFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditProfileFormEventCopyWithImpl<$Res>
    implements $EditProfileFormEventCopyWith<$Res> {
  _$EditProfileFormEventCopyWithImpl(this._value, this._then);

  final EditProfileFormEvent _value;
  // ignore: unused_field
  final $Res Function(EditProfileFormEvent) _then;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$EditProfileFormEventCopyWithImpl<$Res>
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
    return 'EditProfileFormEvent.submitted()';
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
    required TResult Function() submitted,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() resetCanUseName,
    required TResult Function(String introductionStr) introductionChanged,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
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
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_ResetCanUseName value) resetCanUseName,
    required TResult Function(_IntroductionChanged value) introductionChanged,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements EditProfileFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
abstract class _$$_UsernameChangedCopyWith<$Res> {
  factory _$$_UsernameChangedCopyWith(
          _$_UsernameChanged value, $Res Function(_$_UsernameChanged) then) =
      __$$_UsernameChangedCopyWithImpl<$Res>;
  $Res call({String usernameStr});
}

/// @nodoc
class __$$_UsernameChangedCopyWithImpl<$Res>
    extends _$EditProfileFormEventCopyWithImpl<$Res>
    implements _$$_UsernameChangedCopyWith<$Res> {
  __$$_UsernameChangedCopyWithImpl(
      _$_UsernameChanged _value, $Res Function(_$_UsernameChanged) _then)
      : super(_value, (v) => _then(v as _$_UsernameChanged));

  @override
  _$_UsernameChanged get _value => super._value as _$_UsernameChanged;

  @override
  $Res call({
    Object? usernameStr = freezed,
  }) {
    return _then(_$_UsernameChanged(
      usernameStr == freezed
          ? _value.usernameStr
          : usernameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UsernameChanged implements _UsernameChanged {
  const _$_UsernameChanged(this.usernameStr);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'EditProfileFormEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsernameChanged &&
            const DeepCollectionEquality()
                .equals(other.usernameStr, usernameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(usernameStr));

  @JsonKey(ignore: true)
  @override
  _$$_UsernameChangedCopyWith<_$_UsernameChanged> get copyWith =>
      __$$_UsernameChangedCopyWithImpl<_$_UsernameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() resetCanUseName,
    required TResult Function(String introductionStr) introductionChanged,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(usernameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_ResetCanUseName value) resetCanUseName,
    required TResult Function(_IntroductionChanged value) introductionChanged,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements EditProfileFormEvent {
  const factory _UsernameChanged(final String usernameStr) = _$_UsernameChanged;

  String get usernameStr;
  @JsonKey(ignore: true)
  _$$_UsernameChangedCopyWith<_$_UsernameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetCanUseNameCopyWith<$Res> {
  factory _$$_ResetCanUseNameCopyWith(
          _$_ResetCanUseName value, $Res Function(_$_ResetCanUseName) then) =
      __$$_ResetCanUseNameCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCanUseNameCopyWithImpl<$Res>
    extends _$EditProfileFormEventCopyWithImpl<$Res>
    implements _$$_ResetCanUseNameCopyWith<$Res> {
  __$$_ResetCanUseNameCopyWithImpl(
      _$_ResetCanUseName _value, $Res Function(_$_ResetCanUseName) _then)
      : super(_value, (v) => _then(v as _$_ResetCanUseName));

  @override
  _$_ResetCanUseName get _value => super._value as _$_ResetCanUseName;
}

/// @nodoc

class _$_ResetCanUseName implements _ResetCanUseName {
  const _$_ResetCanUseName();

  @override
  String toString() {
    return 'EditProfileFormEvent.resetCanUseName()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetCanUseName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() resetCanUseName,
    required TResult Function(String introductionStr) introductionChanged,
  }) {
    return resetCanUseName();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
  }) {
    return resetCanUseName?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
    required TResult orElse(),
  }) {
    if (resetCanUseName != null) {
      return resetCanUseName();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_ResetCanUseName value) resetCanUseName,
    required TResult Function(_IntroductionChanged value) introductionChanged,
  }) {
    return resetCanUseName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
  }) {
    return resetCanUseName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
    required TResult orElse(),
  }) {
    if (resetCanUseName != null) {
      return resetCanUseName(this);
    }
    return orElse();
  }
}

abstract class _ResetCanUseName implements EditProfileFormEvent {
  const factory _ResetCanUseName() = _$_ResetCanUseName;
}

/// @nodoc
abstract class _$$_IntroductionChangedCopyWith<$Res> {
  factory _$$_IntroductionChangedCopyWith(_$_IntroductionChanged value,
          $Res Function(_$_IntroductionChanged) then) =
      __$$_IntroductionChangedCopyWithImpl<$Res>;
  $Res call({String introductionStr});
}

/// @nodoc
class __$$_IntroductionChangedCopyWithImpl<$Res>
    extends _$EditProfileFormEventCopyWithImpl<$Res>
    implements _$$_IntroductionChangedCopyWith<$Res> {
  __$$_IntroductionChangedCopyWithImpl(_$_IntroductionChanged _value,
      $Res Function(_$_IntroductionChanged) _then)
      : super(_value, (v) => _then(v as _$_IntroductionChanged));

  @override
  _$_IntroductionChanged get _value => super._value as _$_IntroductionChanged;

  @override
  $Res call({
    Object? introductionStr = freezed,
  }) {
    return _then(_$_IntroductionChanged(
      introductionStr == freezed
          ? _value.introductionStr
          : introductionStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IntroductionChanged implements _IntroductionChanged {
  const _$_IntroductionChanged(this.introductionStr);

  @override
  final String introductionStr;

  @override
  String toString() {
    return 'EditProfileFormEvent.introductionChanged(introductionStr: $introductionStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntroductionChanged &&
            const DeepCollectionEquality()
                .equals(other.introductionStr, introductionStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(introductionStr));

  @JsonKey(ignore: true)
  @override
  _$$_IntroductionChangedCopyWith<_$_IntroductionChanged> get copyWith =>
      __$$_IntroductionChangedCopyWithImpl<_$_IntroductionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() resetCanUseName,
    required TResult Function(String introductionStr) introductionChanged,
  }) {
    return introductionChanged(introductionStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
  }) {
    return introductionChanged?.call(introductionStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? resetCanUseName,
    TResult Function(String introductionStr)? introductionChanged,
    required TResult orElse(),
  }) {
    if (introductionChanged != null) {
      return introductionChanged(introductionStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_ResetCanUseName value) resetCanUseName,
    required TResult Function(_IntroductionChanged value) introductionChanged,
  }) {
    return introductionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
  }) {
    return introductionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_ResetCanUseName value)? resetCanUseName,
    TResult Function(_IntroductionChanged value)? introductionChanged,
    required TResult orElse(),
  }) {
    if (introductionChanged != null) {
      return introductionChanged(this);
    }
    return orElse();
  }
}

abstract class _IntroductionChanged implements EditProfileFormEvent {
  const factory _IntroductionChanged(final String introductionStr) =
      _$_IntroductionChanged;

  String get introductionStr;
  @JsonKey(ignore: true)
  _$$_IntroductionChangedCopyWith<_$_IntroductionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditProfileFormState {
  Option<Either<ProfileFailure, Unit>> get editFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Username get username => throw _privateConstructorUsedError;
  bool get canUseName => throw _privateConstructorUsedError;
  Introduction get introduction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileFormStateCopyWith<EditProfileFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileFormStateCopyWith<$Res> {
  factory $EditProfileFormStateCopyWith(EditProfileFormState value,
          $Res Function(EditProfileFormState) then) =
      _$EditProfileFormStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<ProfileFailure, Unit>> editFailureOrSuccessOption,
      bool isSubmitting,
      Username username,
      bool canUseName,
      Introduction introduction});
}

/// @nodoc
class _$EditProfileFormStateCopyWithImpl<$Res>
    implements $EditProfileFormStateCopyWith<$Res> {
  _$EditProfileFormStateCopyWithImpl(this._value, this._then);

  final EditProfileFormState _value;
  // ignore: unused_field
  final $Res Function(EditProfileFormState) _then;

  @override
  $Res call({
    Object? editFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? username = freezed,
    Object? canUseName = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_value.copyWith(
      editFailureOrSuccessOption: editFailureOrSuccessOption == freezed
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      canUseName: canUseName == freezed
          ? _value.canUseName
          : canUseName // ignore: cast_nullable_to_non_nullable
              as bool,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as Introduction,
    ));
  }
}

/// @nodoc
abstract class _$$_EditProfileFormStateCopyWith<$Res>
    implements $EditProfileFormStateCopyWith<$Res> {
  factory _$$_EditProfileFormStateCopyWith(_$_EditProfileFormState value,
          $Res Function(_$_EditProfileFormState) then) =
      __$$_EditProfileFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<Either<ProfileFailure, Unit>> editFailureOrSuccessOption,
      bool isSubmitting,
      Username username,
      bool canUseName,
      Introduction introduction});
}

/// @nodoc
class __$$_EditProfileFormStateCopyWithImpl<$Res>
    extends _$EditProfileFormStateCopyWithImpl<$Res>
    implements _$$_EditProfileFormStateCopyWith<$Res> {
  __$$_EditProfileFormStateCopyWithImpl(_$_EditProfileFormState _value,
      $Res Function(_$_EditProfileFormState) _then)
      : super(_value, (v) => _then(v as _$_EditProfileFormState));

  @override
  _$_EditProfileFormState get _value => super._value as _$_EditProfileFormState;

  @override
  $Res call({
    Object? editFailureOrSuccessOption = freezed,
    Object? isSubmitting = freezed,
    Object? username = freezed,
    Object? canUseName = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_$_EditProfileFormState(
      editFailureOrSuccessOption: editFailureOrSuccessOption == freezed
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProfileFailure, Unit>>,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      canUseName: canUseName == freezed
          ? _value.canUseName
          : canUseName // ignore: cast_nullable_to_non_nullable
              as bool,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as Introduction,
    ));
  }
}

/// @nodoc

class _$_EditProfileFormState implements _EditProfileFormState {
  const _$_EditProfileFormState(
      {required this.editFailureOrSuccessOption,
      required this.isSubmitting,
      required this.username,
      required this.canUseName,
      required this.introduction});

  @override
  final Option<Either<ProfileFailure, Unit>> editFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final Username username;
  @override
  final bool canUseName;
  @override
  final Introduction introduction;

  @override
  String toString() {
    return 'EditProfileFormState(editFailureOrSuccessOption: $editFailureOrSuccessOption, isSubmitting: $isSubmitting, username: $username, canUseName: $canUseName, introduction: $introduction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileFormState &&
            const DeepCollectionEquality().equals(
                other.editFailureOrSuccessOption, editFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.canUseName, canUseName) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(editFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(canUseName),
      const DeepCollectionEquality().hash(introduction));

  @JsonKey(ignore: true)
  @override
  _$$_EditProfileFormStateCopyWith<_$_EditProfileFormState> get copyWith =>
      __$$_EditProfileFormStateCopyWithImpl<_$_EditProfileFormState>(
          this, _$identity);
}

abstract class _EditProfileFormState implements EditProfileFormState {
  const factory _EditProfileFormState(
      {required final Option<Either<ProfileFailure, Unit>>
          editFailureOrSuccessOption,
      required final bool isSubmitting,
      required final Username username,
      required final bool canUseName,
      required final Introduction introduction}) = _$_EditProfileFormState;

  @override
  Option<Either<ProfileFailure, Unit>> get editFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  Username get username;
  @override
  bool get canUseName;
  @override
  Introduction get introduction;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileFormStateCopyWith<_$_EditProfileFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
