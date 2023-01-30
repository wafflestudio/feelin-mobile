import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/block/block_failure.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/follow/page_user.dart';
import '../../env.dart';
import '../auth/get_auth_dio.dart';
import 'block_client.dart';

@LazySingleton()
class BlockRepository{
  static final BlockRepository _singletonBlockRepository = BlockRepository._internal();
  final dio = getAuthDio(baseUrl: env.socialBaseUrl);
  late BlockClient blockClient = BlockClient(dio, baseUrl: env.socialBaseUrl);

  factory BlockRepository() {
    return _singletonBlockRepository;
  }

  BlockRepository._internal();

  Future<Either<BlockFailure, Tuple2<PageUser, String?>>> getBlockedUsers({String? cursor,}) async{
    try{
      HttpResponse<PageUser> httpResponse = await blockClient.getBlockedUsers(cursor,);
      switch(httpResponse.response.statusCode){
        case 200 : return Right(Tuple2(httpResponse.data, httpResponse.response.headers['cursor'] == null ? null : httpResponse.response.headers['cursor']![0]));
        default : return const Left(BlockFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        default : return const Left(BlockFailure.serverError());
      }
    }
  }

  Future<Either<BlockFailure, Unit>> blockUser({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await blockClient.blockUser(id);
      switch(httpResponse.response.statusCode){
        case 200 : return const Right(unit);
        case 201 : return const Right(unit);
        case 409 : return const Left(BlockFailure.alreadyBlocked());
        case 404 : return const Left(BlockFailure.notFound());
        default : return const Left(BlockFailure.serverError());
      }
    }on DioError catch(e){
      //print(e);
      switch(e.response?.statusCode){
        case 409 : return const Left(BlockFailure.alreadyBlocked());
        case 404 : return const Left(BlockFailure.notFound());
        default : return const Left(BlockFailure.serverError());
      }
    }
  }

  Future<Either<BlockFailure, Unit>> unblockUser({required String id,}) async{
    try{
      HttpResponse<void> httpResponse = await blockClient.unblockUser(id);
      switch(httpResponse.response.statusCode){
        case 200 : return const Right(unit);
        case 204 : return const Right(unit);
        default : return const Left(BlockFailure.serverError());
      }
    }on DioError catch(e){
      switch(e.response?.statusCode){
        default : return const Left(BlockFailure.serverError());
      }
    }
  }
}