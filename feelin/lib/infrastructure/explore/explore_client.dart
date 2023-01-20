import 'package:dio/dio.dart';
import 'package:music_sns/domain/profile/page.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_client.g.dart';

@RestApi(baseUrl: "https://feelin-social-api-dev.wafflestudio.com/api/v1")
abstract class ExploreClient{
  factory ExploreClient(Dio dio, {String baseUrl}) = _ExploreClient;

  @GET('/posts/feed')
  Future<HttpResponse<Page>> getFeed(@Query('cursor') String? cursor, @Query('follow') bool follow);

}