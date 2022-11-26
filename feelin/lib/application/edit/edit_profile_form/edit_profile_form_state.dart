part of 'edit_profile_form_bloc.dart';

@freezed
class EditProfileFormState with _$EditProfileFormState {
  const factory EditProfileFormState({
    required Option<Either<ProfileFailure, Unit>> editFailureOrSuccessOption,
    required bool isSubmitting,
    required Username username,
    required bool canUseName,
    required Introduction introduction,
  }) = _EditProfileFormState;
  factory EditProfileFormState.initial() => EditProfileFormState(
    editFailureOrSuccessOption: none(),
    isSubmitting: false,
    username: Username(''),
    canUseName: false,
    introduction: Introduction(''),
  );
}