
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
import 'package:music_sns/domain/auth/check_username_request.dart';
import 'package:music_sns/domain/auth/exists_user.dart';
import 'package:music_sns/domain/auth/exists_username.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/sign_up_with_email_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/try_email_verification_request.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/domain/auth/verify_email_request.dart';
import 'package:music_sns/infrastructure/auth/auth_client.dart';
import 'package:retrofit/dio.dart';

import '../../domain/auth/sign_up_with_phone_request.dart';
import '../../domain/auth/try_phone_verification_request.dart';
import '../../domain/auth/verify_phone_request.dart';

@LazySingleton()
class AuthRepository{
  static final AuthRepository _singletonAuthRepository = AuthRepository._internal();
  final authClient = AuthClient(Dio());
  final storage = const FlutterSecureStorage();

  factory AuthRepository() {
    return _singletonAuthRepository;
  }

  AuthRepository._internal();

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

  Future<Either<AuthFailure, Unit>> deleteAccount({required Token token}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.deleteAccount(token.token);
      if(httpResponse.response.statusCode == 204){
        storage.deleteAll();
        return const Right(unit);
      }else{
        print(httpResponse.response.statusCode);
        return const Left(AuthFailure.unauthorized());
      }
    } on DioError catch(e){
      print(e);
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithEmail(
      {required EmailAddress emailAddress, required Password password}) async {
    try{
      HttpResponse<User> httpResponse = await authClient.signIn(SignInRequest(account: emailAddress.getOrCrash(), password: password.getOrCrash(), type: 'EMAIL'));
      if(httpResponse.response.statusCode == 200 || httpResponse.response.statusCode == 201){
        print( httpResponse.response.headers['Access-Token']![0]);
        storage.write(key: 'token', value: httpResponse.response.headers['Access-Token']![0]);
        storage.write(key: 'refresh', value: httpResponse.response.headers['Refresh-Token']![0]);
        storage.write(key: 'id', value: httpResponse.data.id.toString());
        return const Right(unit);
      }else{
        return const Left(AuthFailure.invalidAccountAndPasswordCombination());
      }
    } on DioError catch(e){
      print(e);
      if(e.response?.statusCode == 401){
        return const Left(AuthFailure.invalidAccountAndPasswordCombination());
      }
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithPhone(
      {required PhoneNumber phoneNumber, required NotEmptyString countryCode, required Password password}) async {
    try{
      HttpResponse<User> httpResponse = await authClient.signIn(SignInRequest(account: phoneNumber.getOrCrash()+countryCode.getOrCrash(), password: password.getOrCrash(), type: 'PHONE'));
      if(httpResponse.response.statusCode == 200 || httpResponse.response.statusCode == 201){
        print( httpResponse.response.headers['Access-Token']![0]);
        storage.write(key: 'token', value: httpResponse.response.headers['Access-Token']![0]);
        storage.write(key: 'refresh', value: httpResponse.response.headers['Refresh-Token']![0]);
        storage.write(key: 'id', value: httpResponse.data.id.toString());
        return const Right(unit);
      }else{
        return const Left(AuthFailure.invalidAccountAndPasswordCombination());
      }
    } on DioError catch(e){
      print(e);
      if(e.response?.statusCode == 401){
        return const Left(AuthFailure.invalidAccountAndPasswordCombination());
      }
      return const Left(AuthFailure.serverError());
    }
  }

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

  Future<Either<AuthFailure, Unit>> signUpWithEmail({required EmailAddress emailAddress, required Password password,
    required NotEmptyString name, required Username username, required NotEmptyString birthday}) async{
    try{
      HttpResponse<User> httpResponse = await authClient.signUpWithEmail(
          SignUpWithEmailRequest(email: emailAddress.getOrCrash(), password: password.getOrCrash(),
              name: name.getOrCrash(), username: username.getOrCrash(), birthday: birthday.getOrCrash()));
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

  Future<Either<AuthFailure, Unit>> signUpWithPhone({required PhoneNumber phoneNumber, required NotEmptyString countryCode, required Password password,
    required NotEmptyString name, required Username username, required NotEmptyString birthday}) async{
    try{
      HttpResponse<User> httpResponse = await authClient.signUpWithPhone(
          SignUpWithPhoneRequest(countryCode: countryCode.getOrCrash(), phoneNumber: phoneNumber.getOrCrash(), password: password.getOrCrash(),
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

  Future<Either<AuthFailure, ExistsUser>> checkEmail({required EmailAddress emailAddress}) async{
    try{
      HttpResponse<ExistsUser> httpResponse = await authClient.checkEmail(TryEmailVerificationRequest(email: emailAddress.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else{
        return const Left(AuthFailure.serverError());
      }
    }catch(e){
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, Unit>> tryEmailVerification({required EmailAddress emailAddress}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.tryEmailVerification(TryEmailVerificationRequest(email: emailAddress.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return const Right(unit);
      }else{
        return const Left(AuthFailure.serverError());
      }
    }catch(e){
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, void>> verifyEmail({required EmailAddress emailAddress, required AuthCode code}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.verifyEmail(VerifyEmailRequest(email: emailAddress.getOrCrash(), code: code.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else {
        return const Left(AuthFailure.invalidAuthCode());
      }
    }catch(e){
      print(e);
      return const Left(AuthFailure.invalidAuthCode());
    }
  }

  Future<Either<AuthFailure, ExistsUser>> checkPhone({required PhoneNumber phoneNumber, required NotEmptyString countryCode}) async{
    try{
      HttpResponse<ExistsUser> httpResponse = await authClient.checkPhone(TryPhoneVerificationRequest(countryCode: countryCode.getOrCrash(), phoneNumber: phoneNumber.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      } else{
        return const Left(AuthFailure.serverError());
      }
    }catch(e){
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, Unit>> tryPhoneVerification({required PhoneNumber phoneNumber, required NotEmptyString countryCode}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.tryPhoneVerification(TryPhoneVerificationRequest(countryCode: countryCode.getOrCrash(), phoneNumber: phoneNumber.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return const Right(unit);
      } else{
        return const Left(AuthFailure.serverError());
      }
    }catch(e){
      return const Left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, void>> verifyPhone({required PhoneNumber phoneNumber, required NotEmptyString countryCode, required AuthCode code}) async{
    try{
      HttpResponse<void> httpResponse = await authClient.verifyPhone(VerifyPhoneRequest(countryCode: countryCode.getOrCrash(), phoneNumber: phoneNumber.getOrCrash(), code: code.getOrCrash()));
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
