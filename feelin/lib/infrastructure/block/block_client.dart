import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/follow/page_user.dart';

part 'block_client.g.dart';

@RestApi(baseUrl: "")
abstract class BlockClient{
  factory BlockClient(Dio dio, {String baseUrl}) = _BlockClient;

  @GET('/block')
  Future<HttpResponse<PageUser>> getBlockedUsers(@Query('cursor') String? cursor,);

  @POST('/block/{user_id}')
  Future<HttpResponse<void>> blockUser(@Path('user_id') String id);

  @DELETE('/block/{user_id}')
  Future<HttpResponse<void>> unblockUser(@Path('user_id') String id);
}