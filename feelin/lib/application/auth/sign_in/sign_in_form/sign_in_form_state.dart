part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Account account,
    required Password password,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required bool isSubmitting,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        account: Account(''),
        password: Password(''),
        authFailureOrSuccessOption: none(),
        isSubmitting: false,
      );
}
