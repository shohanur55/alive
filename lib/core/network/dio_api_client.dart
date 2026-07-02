import 'package:dio/dio.dart';

import 'api_client.dart';
import 'api_exception.dart';

class DioApiClient implements ApiClient {
  DioApiClient({required String baseUrl, Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  final Dio _dio;

  @override
  Future<ApiResponse<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _request<T>(
      () => _dio.delete(path, data: data, queryParameters: queryParameters, options: Options(headers: headers)),
    );
  }

  @override
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _request<T>(
      () => _dio.get(path, queryParameters: queryParameters, options: Options(headers: headers)),
    );
  }

  @override
  Future<ApiResponse<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _request<T>(
      () => _dio.post(path, data: data, queryParameters: queryParameters, options: Options(headers: headers)),
    );
  }

  @override
  Future<ApiResponse<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _request<T>(
      () => _dio.put(path, data: data, queryParameters: queryParameters, options: Options(headers: headers)),
    );
  }

  Future<ApiResponse<T>> _request<T>(Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      return ApiResponse<T>(
        data: response.data as T?,
        statusCode: response.statusCode ?? 200,
        message: response.statusMessage,
      );
    } on DioException catch (error) {
      throw ApiException(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
        details: error.response?.data,
      );
    }
  }
}