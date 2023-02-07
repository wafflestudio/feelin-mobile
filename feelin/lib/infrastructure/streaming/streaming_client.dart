import 'package:dio/dio.dart';
import 'package:music_sns/domain/streaming/connect_music_request.dart';
import 'package:music_sns/domain/streaming/redirect_url.dart';
import 'package:music_sns/domain/streaming/vendor_accounts.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/streaming/save_to_account_request.dart';

part 'streaming_client.g.dart';

@RestApi(baseUrl: "https://feelin-api.wafflestudio.com/api/v1")
abstract class StreamingClient{
  factory StreamingClient(Dio dio, {String baseUrl}) = _StreamingClient;

  @GET('/vendor-accounts/login')
  Future<HttpResponse<RedirectUrl>> callLogin(@Query('vendor') String vendor);

  @POST('/vendor-accounts/applemusic/login')
  Future<HttpResponse<void>> requestAppleMusicLogin(@Body() ConnectMusicRequest connectMusicRequest);

  @GET('/me/vendor-accounts')
  Future<HttpResponse<VendorAccounts>> getMyAccounts();

  @DELETE('/vendor-accounts/{vendor_account_id}')
  Future<HttpResponse<void>> disconnectMyAccount(@Path('vendor_account_id') String vendorId);

  @POST('/playlists/{playlist_id}/save')
  Future<HttpResponse<String>> save(@Path('playlist_id') String playlistId, @Header('Vendor-Authorization') String vendorId, @Body() SaveToAccountRequest saveToAccountRequest);
}