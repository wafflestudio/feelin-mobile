import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unauthorized() = _Unauthorized;
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.invalidAccountAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthFailure.invalidAuthCode() = _InvalidAuthCode;
  const factory AuthFailure.invalidBirthdayForm() = _InvalidBirthdayForm;
  const factory AuthFailure.unauthorizedEmail() = _UnauthorizedEmail;
  const factory AuthFailure.tokenNotFound() = _TokenNotFound;
  const factory AuthFailure.usernameAlreadyInUse() = _UsernameAlreadyInUse;
}
