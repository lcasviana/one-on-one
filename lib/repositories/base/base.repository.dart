import 'package:oneonones/services/http_client/http_client.service.dart';

abstract class BaseRepository {
  final _oneononeApiUrl = 'https://oneonones-api.herokuapp.com/api/v1';
  HttpClientService _httpClient;

  BaseRepository(String resource) {
    this._httpClient = HttpClientService(baseUrl: '$_oneononeApiUrl/$resource/');
  }

  HttpClientService get httpClient => _httpClient;
}
