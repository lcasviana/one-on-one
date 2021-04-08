import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oneonones/common/models/error.model.dart';

abstract class HttpClientBase {
  late Dio _dio;

  final _logInterceptor = LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: true,
    request: false,
    requestBody: false,
  );

  HttpClientBase(String baseUrl) {
    final options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(_logInterceptor);
  }

  @protected
  Future<dynamic> get({
    String path = '',
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors!);
    } catch (e) {
      return Future.error(e);
    }
  }

  @protected
  Future<dynamic> post({
    String path = '',
    FormData? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
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
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors!);
    } catch (e) {
      return Future.error(e);
    }
  }

  @protected
  Future<dynamic> put({
    String path = '',
    FormData? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
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
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors!);
    } catch (e) {
      return Future.error(e);
    }
  }

  @protected
  Future<dynamic> patch({
    String path = '',
    FormData? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
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
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors!);
    } catch (e) {
      return Future.error(e);
    }
  }

  @protected
  Future<dynamic> delete({
    String path = '',
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      final httpError = ErrorModel.fromJson(error.response!.data);
      return Future.error(httpError.errors!);
    } catch (e) {
      return Future.error(e);
    }
  }
}
