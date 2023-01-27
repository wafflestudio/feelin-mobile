import 'package:dio/dio.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/sign_up_with_email_request.dart';
import 'package:music_sns/domain/auth/try_email_verification_request.dart';
import 'package:music_sns/domain/auth/user.dart';
import 'package:music_sns/domain/auth/verify_email_request.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../domain/auth/check_username_request.dart';
import '../../domain/auth/exists_user.dart';
import '../../domain/auth/exists_username.dart';
import '../../domain/auth/sign_up_with_phone_request.dart';
import '../../domain/auth/try_phone_verification_request.dart';
import '../../domain/auth/verify_phone_request.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class AuthClient{
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/auth/signin')
  Future<HttpResponse<User>> signIn(@Body() SignInRequest signInRequest);

  @POST('/auth/username')
  Future<HttpResponse<ExistsUsername>> checkUsername(@Body() CheckUsernameRequest checkUsernameRequest);

  @POST('/auth/signup')
  Future<HttpResponse<User>> signUpWithEmail(@Body() SignUpWithEmailRequest signUpRequest);

  @POST('/auth/signup')
  Future<HttpResponse<User>> signUpWithPhone(@Body() SignUpWithPhoneRequest signUpRequest);

  @POST('/auth/email/verify-code')
  Future<HttpResponse<void>> verifyEmail(@Body() VerifyEmailRequest verifyEmailRequest);

  @POST('/auth/email')
  Future<HttpResponse<ExistsUser>> checkEmail(@Body() TryEmailVerificationRequest verifyEmailRequest);

  @POST('/auth/email/verify-code/send')
  Future<HttpResponse<void>> tryEmailVerification(@Body() TryEmailVerificationRequest verifyEmailRequest);

  @POST('/auth/phone/verify-code')
  Future<HttpResponse<void>> verifyPhone(@Body() VerifyPhoneRequest verifyPhoneRequest);

  @POST('/auth/phone')
  Future<HttpResponse<ExistsUser>> checkPhone(@Body() TryPhoneVerificationRequest verifyPhoneRequest);

  @POST('/auth/phone/verify-code/send')
  Future<HttpResponse<void>> tryPhoneVerification(@Body() TryPhoneVerificationRequest verifyPhoneRequest);

  @POST('/auth/sign-out')
  Future<HttpResponse<void>> signOut(@Header("Authorization") String token);

  @GET('/user/me')
  Future<HttpResponse<void>> getSignedInUser(@Header("Authorization") String token);

  @DELETE('/auth')
  Future<HttpResponse<void>> deleteAccount(@Header("Authorization") String token);
}