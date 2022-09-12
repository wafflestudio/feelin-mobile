import 'package:dio/dio.dart';
import 'package:music_sns/domain/profile/pageable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_client.g.dart';

@RestApi(baseUrl: "https://api-feelin.kro.kr/api/v1")
abstract class ProfileClient{
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @GET('/user/{user_id}/posts')
  Future<HttpResponse<Pageable>> getPosts(@Path('user_id') int id);

}