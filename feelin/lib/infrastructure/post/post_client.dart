import 'package:dio/dio.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/post/create_post_request.dart';
import 'package:retrofit/retrofit.dart';

part 'post_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class PostClient{
  factory PostClient(Dio dio, {String baseUrl}) = _PostClient;

  @POST('/posts')
  Future<HttpResponse<Post>> createPost(@Body() CreatePostRequest createPostRequest);

  @PUT('/posts/{post_id}')
  Future<HttpResponse<void>> editPost(@Body() CreatePostRequest createPostRequest, @Path('post_id') String id);
}