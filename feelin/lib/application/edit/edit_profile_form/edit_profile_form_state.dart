part of 'edit_profile_form_bloc.dart';

@freezed
class EditProfileFormState with _$EditProfileFormState {
  const factory EditProfileFormState({
    required Option<Either<ProfileFailure, Unit>> editFailureOrSuccessOption,
    required bool isSubmitting,
    required NotEmptyString name,
    required Username username,
    required bool canUseName,
    required bool loadingUsername,
    required Introduction introduction,
    required String? imageUrl,
  }) = _EditProfileFormState;
  factory EditProfileFormState.initial() => EditProfileFormState(
    editFailureOrSuccessOption: none(),
    isSubmitting: false,
    name: NotEmptyString(''),
    username: Username(''),
    canUseName: false,
    loadingUsername: false,
    introduction: Introduction(''),
    imageUrl: null
  );
}