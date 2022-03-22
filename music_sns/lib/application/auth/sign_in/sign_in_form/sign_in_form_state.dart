part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        authFailureOrSuccessOption: none(),
        isSubmitting: false,
      );
}
