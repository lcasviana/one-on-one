import 'package:dio/dio.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/error.model.dart';

class HttpService implements IHttpService {
  late Dio _dio;

  final _logInterceptor = LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    requestBody: true,
  );

  HttpService(String baseUrl) {
    final options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(_logInterceptor);
  }

  Future<dynamic> get({
    String path = '',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      if (error.response?.data == null) return Future.error(ErrorModel(['Unexpected error.']));
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> post({
    String path = '',
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      if (error.response?.data == null) return Future.error(ErrorModel(['Unexpected error.']));
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> put({
    String path = '',
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      if (error.response?.data == null) return Future.error(ErrorModel(['Unexpected error.']));
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> patch({
    String path = '',
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      if (error.response?.data == null) return Future.error(ErrorModel(['Unexpected error.']));
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> delete({
    String path = '',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (error) {
      if (error.response?.data == null) return Future.error(ErrorModel(['Unexpected error.']));
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors);
    } catch (e) {
      return Future.error(e);
    }
  }
}
