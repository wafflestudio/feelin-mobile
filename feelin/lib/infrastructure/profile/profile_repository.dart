import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/profile/pageable.dart';
import 'package:music_sns/domain/profile/profile_failure.dart';
import 'package:music_sns/infrastructure/auth/get_auth_dio.dart';
import 'package:music_sns/infrastructure/profile/profile_client.dart';
import 'package:retrofit/retrofit.dart';

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

  Future<Either<ProfileFailure, Pageable>> getPosts({required int id}) async{
    try{
      HttpResponse<Pageable> httpResponse = await profileClient.getPosts(id);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(httpResponse.data);
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }on DioError catch(e){
      print(e);
      switch(e.response?.statusCode){
        case 401 : return const Left(ProfileFailure.unauthorized());
        default : return const Left(ProfileFailure.serverError());
      }
    }
  }
}