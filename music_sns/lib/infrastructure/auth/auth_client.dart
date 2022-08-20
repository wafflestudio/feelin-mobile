import 'package:dio/dio.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/sign_up_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/try_email_verification_request.dart';
import 'package:music_sns/domain/auth/verify_email_request.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "https://api-feelin.kro.kr/api/v1")
abstract class AuthClient{
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @GET("")
  Future<HttpResponse<String>> test();

  @POST('/auth/user/signin')
  Future<HttpResponse<Token>> signIn(@Body() SignInRequest signInRequest);

  @POST('/auth/user/signup')
  Future<HttpResponse<Token>> signUp(@Body() SignUpRequest signUpRequest);

  @POST('/auth/user/verify-code')
  Future<HttpResponse<void>> verifyEmail(@Body() VerifyEmailRequest verifyEmailRequest);

  @POST('/auth/user')
  Future<HttpResponse<void>> tryEmailVerification(@Body() TryEmailVerificationRequest verifyEmailRequest);

  @POST('/auth/user/sign-out')
  Future<HttpResponse<void>> signOut(@Header("Authentication") String token);
}