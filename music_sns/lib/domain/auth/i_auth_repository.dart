import 'package:dartz/dartz.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:retrofit/dio.dart';

abstract class IAuthRepository {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Token>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Token>> signUpWithEmail({
    required EmailAddress emailAddress,
    required Password password,
    required NotEmptyString lastName,
    required NotEmptyString firstName,
    required UserName username,
    required PhoneNumber phoneNumber,
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
