import 'package:dio/dio.dart';
import 'package:simodang_flutter/config/api_constants.dart';
import 'package:simodang_flutter/utils/dio/dio_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();
    _dio
      ..options.baseUrl = ApiConstants().baseUrl
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..interceptors.add(DioInterceptor());
  }
  Future<Response<dynamic>> post(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    }
  ) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    }
  ) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }
}
