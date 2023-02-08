part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required EmailAddress emailAddress,
    required AuthCode code,
    required bool isEmailSubmitting,
    required Option<Either<AuthFailure, Unit>> requestFailureOrSuccessOption,
    required Password password,
    required Password passwordConfirm,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption,
    required bool isSubmitting,
    required NotEmptyString name,
    required Username username,
    required bool canUseName,
    required bool loadingUsername,
    required PhoneNumber phoneNumber,
    required NotEmptyString countryCode,
    required NotEmptyString birthday,
    required bool signUpWithEmail,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
    emailAddress: EmailAddress(''),
    code: AuthCode(''),
    passwordConfirm: Password(''),
    password: Password(''),
    authFailureOrSuccessOption: none(),
    verifyFailureOrSuccessOption: none(),
    isSubmitting: false,
    name: NotEmptyString(''),
    username: Username(''),
    canUseName: false,
    loadingUsername: false,
    phoneNumber: PhoneNumber(''),
    birthday: NotEmptyString(''),
    countryCode: NotEmptyString(''),
    isEmailSubmitting: false,
    requestFailureOrSuccessOption: none(),
    signUpWithEmail: false,
  );
}