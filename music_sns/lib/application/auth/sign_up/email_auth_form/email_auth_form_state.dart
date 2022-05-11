part of 'email_auth_form_bloc.dart';

@freezed
class EmailAuthFormState with _$EmailAuthFormState {
  const factory EmailAuthFormState({
    required EmailAddress emailAddress,
    required EmailAuthCode code,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isRequested,
  }) = _EmailAuthFormState;
  factory EmailAuthFormState.initial() => EmailAuthFormState(
    emailAddress: EmailAddress(''),
    code: EmailAuthCode(''),
    authFailureOrSuccessOption: none(),
    isSubmitting: false,
    isRequested: false,
  );
}
