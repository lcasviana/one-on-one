import 'package:dio/dio.dart';

class RestClient {
  RestClient._();

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: '',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  static Future<Response<T>> get<T>(String path) async {
    return await _dio.get<T>(path);
  }
}
