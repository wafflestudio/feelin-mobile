import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'navigation_service.dart';

Dio getAuthDio() {
  var dio = Dio();

  const storage = FlutterSecureStorage();

  dio.interceptors.clear();

  dio.options.baseUrl = 'https://feelin-social-api-dev.wafflestudio.com/api/v1';

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {

    // 기기에 저장된 AccessToken 로드
    final token = await storage.read(key: 'token');

    // 매 요청마다 헤더에 AccessToken을 포함
    options.headers['Authorization'] = token;
    options.headers['Authentication'] = token;
    return handler.next(options);
  }, onError: (error, handler) async {

    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401 ) {

      // 기기에 저장된 AccessToken과 RefreshToken 로드
      final accessToken = await storage.read(key: 'token');
      final refreshToken = await storage.read(key: 'refresh');

      // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
      var refreshDio = Dio();

      refreshDio.interceptors.clear();

      refreshDio.options.baseUrl = 'https://feelin-social-api-dev.wafflestudio.com/api/v1';

      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {

        // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
        if (error.response?.statusCode == 401 || error.response?.statusCode == 403 || error.response?.statusCode == 404 || error.response?.statusCode == 400) {

          // 기기의 자동 로그인 정보 삭제
          await storage.deleteAll();

          // . . .
          // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
          // . . .
          BuildContext context = NavigationService.navigatorKey.currentContext!;
          if (context.mounted) {
            context.read<AuthBloc>().add(const AuthEvent.submitted());
            showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                    backgroundColor: FeelinColorFamily.errorPrimary,
                    message: "The Access Token has expired. Please log in again.",
                )
            );
          }
        }
        return handler.next(error);
      }));

      // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
      refreshDio.options.headers['Authorization'] = refreshToken;
      refreshDio.options.headers['Authentication'] = refreshToken;

      // 토큰 갱신 API 요청
      final refreshResponse = await refreshDio.post('/auth/refresh');

      // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
      final newAccessToken = refreshResponse.data['accessToken'];
      final newRefreshToken = refreshResponse.data['refreshToken'];

      // 기기에 저장된 AccessToken과 RefreshToken 갱신
      await storage.write(key: 'token', value: newAccessToken);
      await storage.write(key: 'refresh', value: newRefreshToken);

      // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
      error.requestOptions.headers['Authorization'] = newAccessToken;
      error.requestOptions.headers['Authentication'] = newAccessToken;

      // 수행하지 못했던 API 요청 복사본 생성
      final clonedRequest = await dio.request(error.requestOptions.path,
          options: Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers),
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters);

      // API 복사본으로 재요청
      return handler.resolve(clonedRequest);
    }

    return handler.next(error);
  }));

  return dio;
}

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}
//https://stackoverflow.com/questions/66139776/get-the-global-context-in-flutter
//https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps