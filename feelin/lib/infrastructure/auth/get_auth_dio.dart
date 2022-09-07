import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Dio getAuthDio() {
  var dio = Dio();

  const storage = FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {

    // 기기에 저장된 AccessToken 로드
    final token = await storage.read(key: 'token');

    // 매 요청마다 헤더에 AccessToken을 포함
    options.headers['Authentication'] = token;
    return handler.next(options);
  }, onError: (error, handler) async {

    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {

      // 기기에 저장된 AccessToken과 RefreshToken 로드
      // 기기의 자동 로그인 정보 삭제
      await storage.deleteAll();
      print('토큰 만료 : get Auth Dio');
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      //   return const SignInPage();
      // }),(route) => false);
    }

    return handler.next(error);
  }));

  return dio;
}