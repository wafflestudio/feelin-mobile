import 'package:dio/dio.dart';
import 'package:music_sns/domain/streaming/connect_music_request.dart';
import 'package:music_sns/domain/streaming/redirect_url.dart';
import 'package:retrofit/retrofit.dart';

part 'streaming_client.g.dart';

@RestApi(baseUrl: "https://feelin-api-dev.wafflestudio.com/api/v1")
abstract class StreamingClient{
  factory StreamingClient(Dio dio, {String baseUrl}) = _StreamingClient;

  @GET('/vendor-accounts/login')
  Future<HttpResponse<RedirectUrl>> callLogin(@Query('vendor') String vendor);

  @POST('/vendor-accounts/applemusic/login')
  Future<HttpResponse<void>> requestAppleMusicLogin(@Body() ConnectMusicRequest connectMusicRequest);
}