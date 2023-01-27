import 'package:dio/dio.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/streaming/redirect_url.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/streaming/save_to_account_request.dart';

part 'explore_post_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class ExplorePostClient{
  factory ExplorePostClient(Dio dio, {String baseUrl}) = _ExplorePostClient;

  @GET('/posts/{post_id}')
  Future<HttpResponse<Post>> getPost(@Path('post_id') String id);

  @DELETE('/posts/{post_id}')
  Future<HttpResponse<void>> deletePost(@Path('post_id') String id);

  @POST('/likes/posts/{post_id}')
  Future<HttpResponse<void>> like(@Path('post_id') String id);

  @DELETE('/likes/posts/{post_id}')
  Future<HttpResponse<void>> unlike(@Path('post_id') String id);

  @POST('https://feelin-api-dev.wafflestudio.com/api/v1/playlists/{playlist_id}/save')
  Future<HttpResponse<RedirectUrl>> save(@Path('playlist_id') String playlistId, @Header('Vendor-Authorization') String vendorId, @Body() SaveToAccountRequest saveToAccountRequest);
}

@RestApi(baseUrl: "https://feelin-api-dev.wafflestudio.com/api/v1")
abstract class ExplorePostClient2{
  factory ExplorePostClient2(Dio dio, {String baseUrl}) = _ExplorePostClient2;

  @POST('/playlists/{playlist_id}/save')
  Future<HttpResponse<String>> save(@Path('playlist_id') String playlistId, @Header('Vendor-Authorization') String vendorId, @Body() SaveToAccountRequest saveToAccountRequest);
}