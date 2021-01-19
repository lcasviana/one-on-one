import 'package:dio/dio.dart';

class HttpClient {
  Dio _dio;

  HttpClient({
    String baseUrl,
  }) {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
  }

  Future<dynamic> get({
    String path = '',
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    Response response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> post({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    Response response = await _dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> put({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    Response response = await _dio.put(
      path,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> patch({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    Response response = await _dio.patch(
      path,
      data: body,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> delete({
    String path = '',
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    Response response = await _dio.delete(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}
