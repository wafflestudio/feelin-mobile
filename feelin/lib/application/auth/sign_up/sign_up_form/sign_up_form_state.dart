part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required EmailAddress emailAddress,
    required EmailAuthCode code,
    required bool isEmailSubmitting,
    required bool isRequested,
    required Password password,
    required Password passwordConfirm,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption,
    required bool isSubmitting,
    required NotEmptyString name,
    required Username username,
    required bool canUseName,
    required PhoneNumber phoneNumber,
    required NotEmptyString birthday,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
    emailAddress: EmailAddress(''),
    code: EmailAuthCode(''),
    passwordConfirm: Password(''),
    password: Password(''),
    authFailureOrSuccessOption: none(),
    verifyFailureOrSuccessOption: none(),
    isSubmitting: false,
    name: NotEmptyString(''),
    username: Username(''),
    canUseName: false,
    phoneNumber: PhoneNumber(''),
    birthday: NotEmptyString(''),
    isEmailSubmitting: false,
    isRequested: false,
  );
}