import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/post/create_post_request.dart';
import 'package:music_sns/domain/post/post_playlist_request.dart';
import 'package:retrofit/retrofit.dart';

part 'post_client.g.dart';

@RestApi(baseUrl: "https://api-feelin.kro.kr/api/v1")
abstract class PostClient{
  factory PostClient(Dio dio, {String baseUrl}) = _PostClient;

  @POST('/posts')
  Future<HttpResponse<void>> createPost(@Body() CreatePostRequest createPostRequest);

}