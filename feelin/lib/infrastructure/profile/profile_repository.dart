import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/pageable.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/auth/get_auth_dio.dart';
import 'package:music_sns/infrastructure/profile/profile_client.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/auth/check_username_request.dart';
import '../../domain/auth/exists_username.dart';
import '../../domain/profile/value_objects.dart';
import '../../domain/profile/edit_my_profile_request.dart';

@LazySingleton()
class ProfileRepository{
  static final ProfileRepository _singletonProfileRepository = ProfileRepository._internal();
  final dio = getAuthDio();
  //TODO:수정?? late?
  late ProfileClient profileClient = ProfileClient(dio);

  factory ProfileRepository() {
    return _singletonProfileRepository;
  }

  ProfileRepository._internal();

  Future<Either<ProfileFailure, Pageable>> getPostsById({required int id}) async{
    try{
      HttpResponse<Pageable> httpResponse = await profileClient.getPostsById(id);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
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

  Future<Either<ProfileFailure, Pageable>> getMyPosts() async{
    try{
      HttpResponse<Pageable> httpResponse = await profileClient.getMyPosts();
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
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

  Future<Either<ProfileFailure, bool>> checkUsername({required Username username,}) async {
    try{
      HttpResponse<ExistsUsername> httpResponse = await profileClient.checkUsername(CheckUsernameRequest(username: username.getOrCrash()));
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data.existsUsername);
      }else{
        return const Left(ProfileFailure.serverError());
      }
    } on DioError catch(e){
      return const Left(ProfileFailure.serverError());
    }
  }

  Future<Either<ProfileFailure, Profile>> getMyProfile() async{
    try{
      HttpResponse<Profile> httpResponse = await profileClient.getMyProfile();
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
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

  Future<Either<ProfileFailure, Profile>> editMyProfile
      ({required Username username, required String image, required Introduction introduction}) async{
    try{
      HttpResponse<Profile> httpResponse =
      await profileClient.editMyProfile(EditMyProfileRequest(username: username.getOrCrash(), image: image, introduction: introduction.getOrCrash()));
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
        case 401 : return const Left(ProfileFailure.unauthorized());
        case 403 : return const Left(ProfileFailure.usernameAlreadyInUse());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        case 401 : return const Left(ProfileFailure.unauthorized());
        case 403 : return const Left(ProfileFailure.usernameAlreadyInUse());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }

}