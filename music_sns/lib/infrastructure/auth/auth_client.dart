import 'package:dio/dio.dart';
import 'package:music_sns/domain/auth/sign_in_request.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:retrofit/http.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "http://api-feelin.kro.kr/")
abstract class AuthClient{
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/auth/user/signin/')
  Future<Token> signIn(@Body() SignInRequest signInRequest);


}