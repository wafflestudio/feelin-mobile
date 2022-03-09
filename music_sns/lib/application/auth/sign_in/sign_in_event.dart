part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.loginIdChanged() = _LoginIdChanged;
  const factory SignInEvent.emailChanged() = _EmailChanged;
}
