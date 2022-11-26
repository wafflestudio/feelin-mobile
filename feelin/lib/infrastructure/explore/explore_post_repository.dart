import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/explore/explore_post_failure.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/infrastructure/explore/explore_post_client.dart';
import 'package:retrofit/dio.dart';
import '../auth/get_auth_dio.dart';

@LazySingleton()
class ExplorePostRepository{
  static final ExplorePostRepository _singletonPostRepository = ExplorePostRepository._internal();
  final dio = getAuthDio();
  late ExplorePostClient explorePostClient = ExplorePostClient(dio);

  factory ExplorePostRepository() {
    return _singletonPostRepository;
  }

  ExplorePostRepository._internal();

  Future<Either<ExplorePostFailure, Post>> getPost({required int id,}) async{
    try{
      HttpResponse<Post> httpResponse = await explorePostClient.getPost(id);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
        case 401 : return const Left(ExplorePostFailure.unauthorized());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ExplorePostFailure.unauthorized());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }
  }

  Future<Either<ExplorePostFailure, Unit>> deletePost({required int id,}) async{
    try{
      HttpResponse<void> httpResponse = await explorePostClient.deletePost(id);
      switch(httpResponse.response.statusCode){
        case 200 : return const Right(unit);
        case 201 : return const Right(unit);
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }
  }
}