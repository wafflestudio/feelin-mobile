import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_post_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class ExplorePostClient{
  factory ExplorePostClient(Dio dio, {String baseUrl}) = _ExplorePostClient;

  @GET('/posts/{post_id}')
  Future<HttpResponse<Post>> getPost(@Path('post_id') int id);

  @DELETE('/posts/{post_id}')
  Future<HttpResponse<void>> deletePost(@Path('post_id') int id);
}