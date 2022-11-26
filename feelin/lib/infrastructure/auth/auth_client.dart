import 'package:dio/dio.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/sign_up_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/try_email_verification_request.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/verify_email_request.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../domain/auth/check_username_request.dart';
import '../../domain/auth/exists_username.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "https://api-feelin.kro.kr/api/v1")
abstract class AuthClient{
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @GET("")
  Future<HttpResponse<String>> test();

  @POST('/auth/signin')
  Future<HttpResponse<User>> signIn(@Body() SignInRequest signInRequest);

  @POST('/auth/username')
  Future<HttpResponse<ExistsUsername>> checkUsername(@Body() CheckUsernameRequest checkUsernameRequest);

  @POST('/auth/signup')
  Future<HttpResponse<User>> signUp(@Body() SignUpRequest signUpRequest);

  @POST('/auth/verify-code')
  Future<HttpResponse<void>> verifyEmail(@Body() VerifyEmailRequest verifyEmailRequest);

  @POST('/auth')
  Future<HttpResponse<void>> tryEmailVerification(@Body() TryEmailVerificationRequest verifyEmailRequest);

  @POST('/auth/sign-out')
  Future<HttpResponse<void>> signOut(@Header("Authentication") String token);
}