
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/post/post_failure.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/post/post_playlist_request.dart';
import '../../domain/post/value_objects.dart';
import 'playlist_client.dart';

@LazySingleton()
class PlaylistRepository{
  static final PlaylistRepository _singletonPlaylistRepository = PlaylistRepository._internal();
  final playlistClient = PlaylistClient(Dio());

  factory PlaylistRepository() {
    return _singletonPlaylistRepository;
  }

  PlaylistRepository._internal();

  Future<Either<PostFailure, Playlist>> postPlaylist({required PlaylistUrl playlistUrl}) async{
    try{
      HttpResponse<Playlist> httpResponse = await playlistClient.postPlaylist(PostPlaylistRequest(url: playlistUrl.getOrCrash()));
      if(httpResponse.response.statusCode == 201){
        return Right(httpResponse.data);
      } else{
        return const Left(PostFailure.noSuchPlaylistExists());
      }
    } on DioError catch(e){
      if(e.response?.statusCode == 404){
        return const Left(PostFailure.noSuchPlaylistExists());
      }
      return const Left(PostFailure.serverError());
    }
  }
}