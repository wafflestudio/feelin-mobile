
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/check_username_request.dart';
import 'package:music_sns/domain/auth/exists_username.dart';
import 'package:music_sns/domain/auth/i_auth_repository.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/sign_up_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/try_email_verification_request.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/domain/auth/verify_email_request.dart';
import 'package:music_sns/infrastructure/auth/auth_client.dart';
import 'package:retrofit/dio.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  static final AuthRepository _singletonAuthRepository = AuthRepository._internal();
  final authClient = AuthClient(Dio());
  final storage = const FlutterSecureStorage();

  factory AuthRepository() {
    return _singletonAuthRepository;
  }

  AuthRepository._internal();

  @override
  Future<Either<AuthFailure, Unit>> getSignedInUser({required Token token}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.getSignedInUser(token.token);
      if(httpResponse.response.statusCode == 200){
        return const Right(unit);
      }else{
        return const Left(AuthFailure.unauthorized());
      }
    } on DioError catch(e){
      return const Left(AuthFailure.serverError());
    }
  }


  @override
  Future<Either<AuthFailure, Unit>> signIn(
      {required Account account, required Password password}) async {
    try{
      HttpResponse<User> httpResponse = await authClient.signIn(SignInRequest(account: account.getOrCrash(), password: password.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        storage.write(key: 'token', value: httpResponse.response.headers['Access-Token']![0]);
        storage.write(key: 'refresh', value: httpResponse.response.headers['Refresh-Token']![0]);
        storage.write(key: 'id', value: httpResponse.data.id.toString());
        return const Right(unit);
      }else{
        return const Left(AuthFailure.invalidEmailAndPasswordCombination());
      }
    } on DioError catch(e){
      if(e.response?.statusCode == 401){
        return const Left(AuthFailure.invalidEmailAndPasswordCombination());
      }
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, bool>> checkUsername({required Username username,}) async {
    try{
      HttpResponse<ExistsUsername> httpResponse = await authClient.checkUsername(CheckUsernameRequest(username: username.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data.existsUsername);
      }else{
        return const Left(AuthFailure.serverError());
      }
    } on DioError catch(e){
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmail({required EmailAddress emailAddress, required Password password,
    required NotEmptyString name, required Username username, required NotEmptyString birthday}) async{
    try{
      HttpResponse<User> httpResponse = await authClient.signUp(
          SignUpRequest(email: emailAddress.getOrCrash(), password: password.getOrCrash(),
              name: name.getOrCrash(), username: username.getOrCrash(), birthday: birthday.getOrCrash()));
      print(httpResponse.response.statusCode);
      log(httpResponse.response.statusCode.toString());
      switch(httpResponse.response.statusCode){

        case 201 : {
          storage.write(key: 'token', value: httpResponse.response.headers['Access-Token']![0]);
          storage.write(key: 'refresh', value: httpResponse.response.headers['Refresh-Token']![0]);
          storage.write(key: 'id', value: httpResponse.data.id.toString());
          return const Right(unit);
        }
        case 400 : return const Left(AuthFailure.invalidBirthdayForm());
        case 403 : return const Left(AuthFailure.unauthorizedEmail());
        case 404 : return const Left(AuthFailure.tokenNotFound());
        case 409 : return const Left(AuthFailure.usernameAlreadyInUse());
        default : return const Left(AuthFailure.serverError());
      }
    }on DioError catch(e){
      print(e);
      switch(e.response?.statusCode){
        case 400 : return const Left(AuthFailure.invalidBirthdayForm());
        case 403 : return const Left(AuthFailure.unauthorizedEmail());
        case 404 : return const Left(AuthFailure.tokenNotFound());
        case 409 : return const Left(AuthFailure.usernameAlreadyInUse());
        default : return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, void>> tryEmailVerification({required EmailAddress emailAddress}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.tryEmailVerification(TryEmailVerificationRequest(email: emailAddress.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else{
        return const Left(AuthFailure.emailAlreadyInUse());
      }
    }catch(e){
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<AuthFailure, void>> verifyEmail({required EmailAddress emailAddress, required EmailAuthCode code}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.verifyEmail(VerifyEmailRequest(email: emailAddress.getOrCrash(), code: code.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else{
        return const Left(AuthFailure.invalidAuthCode());
      }
    }catch(e){
      print(e);
      return const Left(AuthFailure.invalidAuthCode());
    }
  }

  @override
  Future<Either<AuthFailure, void>> signOut({required Token token}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.signOut(token.token);
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else{
        return const Left(AuthFailure.invalidAuthCode());
      }
    } on DioError catch(e){
        return const Left(AuthFailure.serverError());
    }
  }
}
