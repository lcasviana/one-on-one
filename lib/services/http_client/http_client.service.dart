import 'package:dio/dio.dart';
import 'package:oneonones/services/http_client/api_error.model.dart';

class HttpClientService {
  Dio _dio;

  HttpClientService({
    String baseUrl,
  }) {
    final options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }

  void throwException(DioError error) {
    final httpClientError = ApiErrorModel.fromJson(error.response.data);
    throw Exception(httpClientError.errors.first);
  }

  Future<dynamic> get({
    String path = '',
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throwException(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> post({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throwException(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> put({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throwException(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> patch({
    String path = '',
    FormData body,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throwException(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> delete({
    String path = '',
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      throwException(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
