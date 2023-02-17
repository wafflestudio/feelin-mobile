import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/play/original_vendor_playlist.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/post/create_post_request.dart';
import 'package:music_sns/domain/post/post_failure.dart';
import 'package:music_sns/domain/post/value_objects.dart';
import 'package:music_sns/infrastructure/post/post_client.dart';
import 'package:retrofit/dio.dart';

import '../../domain/play/post.dart';
import '../../env.dart';
import '../auth/get_auth_dio.dart';

@LazySingleton()
class PostRepository{
  static final PostRepository _singletonPostRepository = PostRepository._internal();
  final dio = getAuthDio(baseUrl: env.socialBaseUrl);
  late PostClient postClient = PostClient(dio, baseUrl: env.socialBaseUrl);

  factory PostRepository() {
    return _singletonPostRepository;
  }

  PostRepository._internal();

  Future<Either<PostFailure, Post>> createPost({required PlaylistPreview playlistPreview, required NotEmptyString title, required ContentString content, required OriginalVendorPlaylist? originalVendorPlaylist}) async{
    try{
      HttpResponse<Post> httpResponse = await postClient.createPost(
        CreatePostRequest(title: title.getOrCrash(), content: content.getOrCrash(), playlistPreview: playlistPreview, originalVendorPlaylist: originalVendorPlaylist)
      );
      switch(httpResponse.response.statusCode){
        case 201 : return Right(httpResponse.data);
        case 400 : return const Left(PostFailure.blankedTitle());
        case 401 : return const Left(PostFailure.unauthorized());
        case 403 : return const Left(PostFailure.duplicateTitle());
        default : return const Left(PostFailure.serverError());
      }
    }on DioError catch(e){
      //print(e.stackTrace);
      switch(e.response?.statusCode){
        case 400 : return const Left(PostFailure.blankedTitle());
        case 401 : return const Left(PostFailure.unauthorized());
        case 403 : return const Left(PostFailure.duplicateTitle());
        default : return const Left(PostFailure.serverError());
      }
    }
  }

  Future<Either<PostFailure, Unit>> editPost({required PlaylistPreview playlistPreview, required NotEmptyString title, required ContentString content, required String id}) async{
    try{
      HttpResponse<void> httpResponse = await postClient.editPost(
          CreatePostRequest(title: title.getOrCrash(), content: content.getOrCrash(), playlistPreview: playlistPreview), id
      );
      switch(httpResponse.response.statusCode){
        case 200 : return const Right(unit);
        case 400 : return const Left(PostFailure.blankedTitle());
        case 401 : return const Left(PostFailure.unauthorized());
        case 403 : return const Left(PostFailure.duplicateTitle());
        default : return const Left(PostFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 400 : return const Left(PostFailure.blankedTitle());
        case 401 : return const Left(PostFailure.unauthorized());
        case 403 : return const Left(PostFailure.duplicateTitle());
        default : return const Left(PostFailure.serverError());
      }
    }
  }
}