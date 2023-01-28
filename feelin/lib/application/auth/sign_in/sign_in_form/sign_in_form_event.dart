part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailAddressChanged(String emailAddressStr) =
  _EmailAddressChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory SignInFormEvent.phoneNumberChanged(String phoneNumberStr) =
  _PhoneNumberChanged;
  const factory SignInFormEvent.countryCodeChanged(String countryCodeStr) =
  _CountryCodeChanged;
  const factory SignInFormEvent.setEmail() =
  _SetEmail;
  const factory SignInFormEvent.setPhone() =
  _SetPhone;
  const factory SignInFormEvent.phoneRequested() = _PhoneRequested;
  const factory SignInFormEvent.emailRequested() = _EmailRequested;
  const factory SignInFormEvent.submitted() = _Submitted;
}
