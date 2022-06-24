part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required EmailAddress emailAddress,
    required Password password,
    required Password passwordConfirm,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required bool isSubmitting,
    required NotEmptyString firstName,
    required NotEmptyString lastName,
    required UserName userName,
    required PhoneNumber phoneNumber
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
    emailAddress: EmailAddress(''),
    passwordConfirm: Password(''),
    password: Password(''),
    authFailureOrSuccessOption: none(),
    isSubmitting: false,
    firstName: NotEmptyString(''),
    lastName: NotEmptyString(''),
    userName: UserName(''),
    phoneNumber: PhoneNumber(''),
  );
}