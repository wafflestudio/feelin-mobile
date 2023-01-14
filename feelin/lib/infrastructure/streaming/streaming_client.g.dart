// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _StreamingClient implements StreamingClient {
  _StreamingClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://feelin-api-dev.wafflestudio.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<RedirectUrl>> callLogin(vendor) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'vendor': vendor};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<RedirectUrl>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/vendor-accounts/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RedirectUrl.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
