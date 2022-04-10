import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/infrastructure/auth/auth_client.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  static final AuthRepository _singletonAuthRepository = AuthRepository._internal();

  factory AuthRepository() {
    return _singletonAuthRepository;
  }

  AuthRepository._internal();

  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser

    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) {
    // TODO: implement registerWithEmailAndPassword

    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Token>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    if(emailAddress.isValid() && password.isValid()){
      try{
        return Right(await AuthClient(Dio()).signIn(SignInRequest(account: emailAddress.getOrCrash(), password: password.getOrCrash())));
      } catch(e){
        throw UnimplementedError();
      }
    }



    throw UnimplementedError();
  }
}
