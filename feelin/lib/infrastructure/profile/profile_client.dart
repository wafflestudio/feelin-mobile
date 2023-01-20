import 'package:dio/dio.dart';
import 'package:music_sns/domain/profile/page.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/auth/check_username_request.dart';
import '../../domain/auth/exists_username.dart';
import '../../domain/profile/edit_my_profile_request.dart';

part 'profile_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class ProfileClient{
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @GET('/user/{user_id}/posts')
  Future<HttpResponse<Page>> getPostsById(@Path('user_id') int id);

  @GET('/posts')
  Future<HttpResponse<Page>> getMyPosts();

  @GET('/user/profile')
  Future<HttpResponse<Profile>> getMyProfile();

  @GET('/user/{user_id}/profile')
  Future<HttpResponse<Profile>> getProfileById(@Path('user_id')int id);

  @PUT('/user/profile')
  Future<HttpResponse<Profile>> editMyProfile(@Body() EditMyProfileRequest editMyProfileRequest);

  @POST('/auth/username')
  Future<HttpResponse<ExistsUsername>> checkUsername(@Body() CheckUsernameRequest checkUsernameRequest);

  @POST('/follows/{user_id}')
  Future<HttpResponse<void>> follow(@Path('user_id')int id);

  @DELETE('/follows/{user_id}')
  Future<HttpResponse<void>> unFollow(@Path('user_id')int id);
}