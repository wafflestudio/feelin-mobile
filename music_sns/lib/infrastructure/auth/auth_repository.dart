import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/auth/auth_failure.dart';
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
    try{
      HttpResponse<Token> httpResponse = await AuthClient(Dio()).signIn(SignInRequest(account: emailAddress.getOrCrash(), password: password.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      }else{
        return const Left(AuthFailure.invalidEmailAndPasswordCombination());
      }
    } on DioError catch(e){
      print('http error: ${e.toString()}');
      if(e.response?.statusCode == 401){
        return const Left(AuthFailure.invalidEmailAndPasswordCombination());
      }
      return const Left(AuthFailure.serverError());
    }
   }

  @override
  Future<Either<AuthFailure, Token>> signUpWithEmail({required EmailAddress emailAddress, required Password password,
    required NotEmptyString lastName, required NotEmptyString firstName, required UserName username, required PhoneNumber phoneNumber}) async{
    try{
      HttpResponse<Token> httpResponse = await authClient.signUp(
          SignUpRequest(email: emailAddress.getOrCrash(), password: password.getOrCrash(),
              lastName: lastName.getOrCrash(), firstName: firstName.getOrCrash(), username: username.getOrCrash(), phoneNumber: phoneNumber.getOrCrash()));
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
      throw UnimplementedError();
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
        print('http error: ${e.response?.statusCode}');
        return const Left(AuthFailure.serverError());
    }
  }
}
