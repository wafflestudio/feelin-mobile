import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/explore/explore_post_failure.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/streaming/redirect_url.dart';
import 'package:music_sns/infrastructure/explore/explore_post_client.dart';
import 'package:retrofit/dio.dart';

import '../../domain/post/report_post_request.dart';
import '../../domain/streaming/save_to_account_request.dart';
import '../auth/get_auth_dio.dart';

@LazySingleton()
class ExplorePostRepository{
  static final ExplorePostRepository _singletonPostRepository = ExplorePostRepository._internal();
  final dio = getAuthDio();
  late ExplorePostClient explorePostClient = ExplorePostClient(dio);
  late ExplorePostClient2 explorePostClient2 = ExplorePostClient2(dio);

  factory ExplorePostRepository() {
    return _singletonPostRepository;
  }

  ExplorePostRepository._internal();

  Future<Either<ExplorePostFailure, Post>> getPost({required String id,}) async{
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

  Future<Either<ExplorePostFailure, Unit>> deletePost({required String id,}) async{
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

  Future<Either<ExplorePostFailure, Unit>> like({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await explorePostClient.like(id);
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

  Future<Either<ExplorePostFailure, Unit>> unlike({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await explorePostClient.unlike(id);
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

  Future<Either<ExplorePostFailure, Unit>> report({required String reportType, required String username, required String description, required Post post}) async{
    try{
      HttpResponse<void> httpResponse = await explorePostClient.report(ReportPostRequest(reportType: reportType, username: username, description: description, post: post));
      switch(httpResponse.response.statusCode){
        case 200 : return const Right(unit);
        case 201 : return const Right(unit);
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }on DioError catch(e){
      //print(e);
      switch(e.response?.statusCode){
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }
  }

  Future<Either<ExplorePostFailure, String>> save({required String playlistId, required String vendorId, required String title, required String content}) async{
    try{
      HttpResponse<String> httpResponse = await explorePostClient2.save(playlistId, vendorId, SaveToAccountRequest(title: title, content: content));
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
        case 201 : return Right(httpResponse.data);
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }on DioError catch(e){
      //print(e);
      switch(e.response?.statusCode){
        case 403 : return const Left(ExplorePostFailure.forbidden());
        case 404 : return const Left(ExplorePostFailure.notFound());
        default : return const Left(ExplorePostFailure.serverError());
      }
    }
  }
}