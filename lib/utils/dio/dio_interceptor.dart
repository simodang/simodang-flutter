import 'package:dio/dio.dart';
import 'package:simodang_flutter/utils/logger/logger_singleton.dart';
import 'package:simodang_flutter/utils/secure_storage/secure_storage_singleton.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      'Content-Type': 'application/json',
    });
    
    // get token from storage
    final token = await SecureStorageSingleton().storage.read(key: 'jwt');
    LoggerSingleton().logger.i(token);
    if (token != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    LoggerSingleton().logger.i('Request: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerSingleton().logger.i('Response: ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerSingleton().logger.e('Error: ${err.message}');
    super.onError(err, handler);
  }
}
