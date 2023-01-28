import 'package:dio/dio.dart';
import 'package:music_sns/domain/follow/page_user.dart';
import 'package:retrofit/retrofit.dart';

part 'follow_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api.wafflestudio.com/api/v1")
abstract class FollowClient{
  factory FollowClient(Dio dio, {String baseUrl}) = _FollowClient;

  @GET('/follows/followings/{user_id}')
  Future<HttpResponse<PageUser>> getFollowingsById(@Path('user_id') String id, @Query('cursor') String? cursor,);

  @GET('/follows/followers/{user_id}')
  Future<HttpResponse<PageUser>> getFollowersById(@Path('user_id') String id, @Query('cursor') String? cursor,);

  @POST('/follows/{user_id}')
  Future<HttpResponse<void>> follow(@Path('user_id')String id);

  @DELETE('/follows/{user_id}')
  Future<HttpResponse<void>> unFollow(@Path('user_id')String id);
}