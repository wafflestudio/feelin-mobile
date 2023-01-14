import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/page.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/explore/explore_failure.dart';
import '../auth/get_auth_dio.dart';
import 'explore_client.dart';

@LazySingleton()
class ExploreRepository{
  static final ExploreRepository _singletonExploreRepository = ExploreRepository._internal();
  final dio = getAuthDio();
  late ExploreClient exploreClient = ExploreClient(dio);

  factory ExploreRepository() {
    return _singletonExploreRepository;
  }

  ExploreRepository._internal();

  Future<Either<ExploreFailure, Tuple2<Page, String?>>> getFeed({String? cursor,}) async{
    try{
      HttpResponse<Page> httpResponse = await exploreClient.getFeed(cursor, false);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(Tuple2(httpResponse.data, httpResponse.response.headers['cursor'] == null ? null : httpResponse.response.headers['cursor']![0]));
        case 401 : return const Left(ExploreFailure.unauthorized());
        case 404 : return const Left(ExploreFailure.notFound());
        default : return const Left(ExploreFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ExploreFailure.unauthorized());
        case 404 : return const Left(ExploreFailure.notFound());
        default : return const Left(ExploreFailure.serverError());
      }
    }
  }

  Future<Either<ExploreFailure, Tuple2<Page, String?>>> getFeedFollowing({String? cursor,}) async{
    try{
      HttpResponse<Page> httpResponse = await exploreClient.getFeed(cursor, true);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(Tuple2(httpResponse.data, httpResponse.response.headers['cursor'] == null ? null : httpResponse.response.headers['cursor']![0]));
        case 401 : return const Left(ExploreFailure.unauthorized());
        case 404 : return const Left(ExploreFailure.notFound());
        default : return const Left(ExploreFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ExploreFailure.unauthorized());
        case 404 : return const Left(ExploreFailure.notFound());
        default : return const Left(ExploreFailure.serverError());
      }
    }
  }
}