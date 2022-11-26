import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';
@freezed
class ProfileFailure with _$ProfileFailure {
  const factory ProfileFailure.serverError() = _ServerError;
  const factory ProfileFailure.unauthorized() = _Unauthorized;
  const factory ProfileFailure.usernameAlreadyInUse() = _UsernameAlreadyInUse;
}
