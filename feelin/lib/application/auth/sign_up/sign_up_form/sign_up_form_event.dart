part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailAddressChanged(String emailAddressStr) =
  _EmailAddressChanged;
  const factory SignUpFormEvent.passwordConfirmChanged(String passwordConfirmStr) =
  _PasswordConfirmChanged;
  const factory SignUpFormEvent.passwordChanged(String passwordStr) =
  _PasswordChanged;
  const factory SignUpFormEvent.submitted() = _Submitted;
  const factory SignUpFormEvent.firstNameChanged(String firstNameStr) =
  _FirstNameChanged;
  const factory SignUpFormEvent.lastNameChanged(String lastNameStr) =
  _LastNameChanged;
  const factory SignUpFormEvent.usernameChanged(String usernameStr) =
  _UsernameChanged;
  const factory SignUpFormEvent.resetCanUseName() =
  _ResetCanUseName;
  const factory SignUpFormEvent.phoneNumberChanged(String phoneNumberStr) =
  _PhoneNumberChanged;
  const factory SignUpFormEvent.birthdayChanged(String birthdayStr) =
  _BirthdayChanged;
}
