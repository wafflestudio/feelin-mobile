part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required PhoneNumber phoneNumber,
    required NotEmptyString countryCode,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, ExistsUser>> requestFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isRequesting,
    required bool signInWithEmail,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        phoneNumber: PhoneNumber(''),
        countryCode: NotEmptyString(''),
        authFailureOrSuccessOption: none(),
        requestFailureOrSuccessOption: none(),
        isSubmitting: false,
        isRequesting: false,
        signInWithEmail: false,
      );
}
