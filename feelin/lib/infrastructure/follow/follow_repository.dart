import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/follow/page_user.dart';
import 'package:music_sns/env.dart';
import 'package:music_sns/infrastructure/follow/follow_client.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/profile/profile_failure.dart';
import '../auth/get_auth_dio.dart';

@LazySingleton()
class FollowRepository{
  static final FollowRepository _singletonProfileRepository = FollowRepository._internal();
  final dio = getAuthDio(baseUrl: env.socialBaseUrl);

  late FollowClient followClient = FollowClient(dio, baseUrl: env.socialBaseUrl);

  factory FollowRepository() {
    return _singletonProfileRepository;
  }

  FollowRepository._internal();

  Future<Either<ProfileFailure, Tuple2<PageUser, String?>>> getFollowingsById({required String id, required String? cursor}) async{
    try{
      HttpResponse<PageUser> httpResponse = await followClient.getFollowingsById(id, cursor);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(Tuple2(httpResponse.data, httpResponse.response.headers['cursor'] == null ? null : httpResponse.response.headers['cursor']![0]));
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }

  Future<Either<ProfileFailure, Tuple2<PageUser, String?>>> getFollowersById({required String id, required String? cursor}) async{
    try{
      HttpResponse<PageUser> httpResponse = await followClient.getFollowersById(id, cursor);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(Tuple2(httpResponse.data, httpResponse.response.headers['cursor'] == null ? null : httpResponse.response.headers['cursor']![0]));
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }

  Future<Either<ProfileFailure, Unit>> follow
      ({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await followClient.follow(id);
      switch(httpResponse.response.statusCode){
        case 201 : return const Right(unit);
        case 403 : return const Left(ProfileFailure.cannotFollowYourself());
        case 404 : return const Left(ProfileFailure.userNotFound());
        case 409 : return const Left(ProfileFailure.alreadyFollowed());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 403 : return const Left(ProfileFailure.cannotFollowYourself());
        case 404 : return const Left(ProfileFailure.userNotFound());
        case 409 : return const Left(ProfileFailure.alreadyFollowed());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }

  Future<Either<ProfileFailure, Unit>> unFollow
      ({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await followClient.unFollow(id);
      switch(httpResponse.response.statusCode){
        case 204 : return const Right(unit);
        case 403 : return const Left(ProfileFailure.cannotFollowYourself());
        case 404 : return const Left(ProfileFailure.userNotFound());
        case 409 : return const Left(ProfileFailure.alreadyFollowed());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 403 : return const Left(ProfileFailure.cannotFollowYourself());
        case 404 : return const Left(ProfileFailure.userNotFound());
        case 409 : return const Left(ProfileFailure.alreadyFollowed());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }

}