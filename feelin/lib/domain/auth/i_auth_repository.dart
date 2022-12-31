import 'package:dartz/dartz.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:retrofit/dio.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> getSignedInUser({
    required Token token,
  });

  Future<Either<AuthFailure, Unit>> signIn({
    required Account account,
    required Password password,
  });
  Future<Either<AuthFailure, bool>> checkUsername({
    required Username username,
  });
  Future<Either<AuthFailure, Unit>> signUpWithEmail({
    required EmailAddress emailAddress,
    required Password password,
    required NotEmptyString name,
    required Username username,
    required NotEmptyString birthday,
  });
  Future<Either<AuthFailure, void>> verifyEmail({
    required EmailAddress emailAddress,
    required EmailAuthCode code,
  });
  Future<Either<AuthFailure, void>> tryEmailVerification({
    required EmailAddress emailAddress,
  });
  Future<Either<AuthFailure, void>> signOut({
    required Token token,
  });
}
