import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/domain/streaming/connect_music_request.dart';
import 'package:music_sns/domain/streaming/vendor_accounts.dart';
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
  final storage = const FlutterSecureStorage();

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
      if(e.response?.statusCode == 400){
        return const Left(ConnectFailure.alreadyConnected());
      }
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

  Future<Either<ConnectFailure, VendorAccounts>> getMyAccounts() async{
    try{
      HttpResponse<VendorAccounts> httpResponse = await streamingClient.getMyAccounts();
      if(httpResponse.response.statusCode == 200){
        if(httpResponse.data.accounts.isNotEmpty){
          storage.write(key: 'vendor', value: httpResponse.data.accounts.first.vendor);
          storage.write(key: 'vendor_id', value: httpResponse.data.accounts.first.id);
          return Right(httpResponse.data);
        }else{
          return Right(httpResponse.data);
        }

      } else{
        return const Left(ConnectFailure.serverError());
      }
    } on DioError catch(e){
      print(e);
      return const Left(ConnectFailure.serverError());
    }
  }

  Future<Either<ConnectFailure, Unit>> disconnectMyAccount({required String vendorId}) async{
    try{
      HttpResponse<void> httpResponse = await streamingClient.disconnectMyAccount(vendorId);
      if(httpResponse.response.statusCode == 204){
        storage.delete(key: 'vendor');
        storage.delete(key: 'vendor_id');
        return const Right(unit);
      } else{
        return const Left(ConnectFailure.serverError());
      }
    } on DioError catch(e){
      print(e);
      return const Left(ConnectFailure.serverError());
    }
  }
}