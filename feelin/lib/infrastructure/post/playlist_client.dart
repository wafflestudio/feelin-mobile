import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/play/playlist.dart';
import '../../domain/post/post_playlist_request.dart';

part 'playlist_client.g.dart';

@RestApi(baseUrl: "http://ec2-3-38-41-181.ap-northeast-2.compute.amazonaws.com:3000/api/v1")
abstract class PlaylistClient{
  factory PlaylistClient(Dio dio, {String baseUrl}) = _PlaylistClient;

  @POST('/playlists')
  Future<HttpResponse<Playlist>> postPlaylist(@Body() PostPlaylistRequest postPlaylistRequest);


}