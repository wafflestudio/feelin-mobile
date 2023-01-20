import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/streaming/connect_music_request.dart';
import 'package:music_sns/infrastructure/streaming/streaming_client.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/streaming/connect_failure.dart';
import '../../domain/streaming/redirect_url.dart';
import '../auth/get_auth_dio.dart';

@LazySingleton()
class StreamingRepository{
  static final StreamingRepository _singletonPlaylistRepository = StreamingRepository._internal();
  final dio = getAuthDio();
  late StreamingClient streamingClient = StreamingClient(dio);

  factory StreamingRepository() {
    return _singletonPlaylistRepository;
  }

  StreamingRepository._internal();

  Future<Either<ConnectFailure, RedirectUrl>> callLogin({required String vendor}) async{
    try{
      HttpResponse<RedirectUrl> httpResponse = await streamingClient.callLogin(vendor);
      if(httpResponse.response.statusCode == 200){
        return Right(httpResponse.data);
      } else{
        return const Left(ConnectFailure.serverError());
      }
    } on DioError catch(e){
      print(e.error.toString());
      return const Left(ConnectFailure.serverError());
    }
  }

  Future<Either<ConnectFailure, Unit>> requestAppleMusicLogin({required String accessToken, required String id}) async{
    try{
      HttpResponse<void> httpResponse = await streamingClient.requestAppleMusicLogin(ConnectMusicRequest(accessToken: accessToken, id: id));
      if(httpResponse.response.statusCode == 201){
        return const Right(unit);
      } else{
        return const Left(ConnectFailure.serverError());
      }
    } on DioError catch(e){
      print(e.error.toString());
      return const Left(ConnectFailure.serverError());
    }
  }
}