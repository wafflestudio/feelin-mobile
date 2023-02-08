part of 'edit_profile_form_bloc.dart';

@freezed
class EditProfileFormEvent with _$EditProfileFormEvent {
  const factory EditProfileFormEvent.submitted() = _Submitted;
  const factory EditProfileFormEvent.usernameChanged(String usernameStr) =
  _UsernameChanged;
  const factory EditProfileFormEvent.nameChanged(String nameStr) =
  _NameChanged;
  const factory EditProfileFormEvent.imageUrlChanged(String? imageUrlStr) =
  _ImageUrlChanged;
  const factory EditProfileFormEvent.resetCanUseName() =
  _ResetCanUseName;
  const factory EditProfileFormEvent.loadingUsername() =
  _LoadingUsername;
  const factory EditProfileFormEvent.introductionChanged(String introductionStr) =
  _IntroductionChanged;
}