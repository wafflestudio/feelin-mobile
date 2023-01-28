import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/play/playlist.dart';
import '../../domain/post/post_playlist_request.dart';

part 'playlist_client.g.dart';

@RestApi(baseUrl: "https://feelin-api.wafflestudio.com/api/v1")
abstract class PlaylistClient{
  factory PlaylistClient(Dio dio, {String baseUrl}) = _PlaylistClient;

  @POST('/playlists')
  Future<HttpResponse<Playlist>> postPlaylist(@Body() PostPlaylistRequest postPlaylistRequest);


}