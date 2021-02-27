import 'package:oneonones/repositories/base/http_client.base.dart';

abstract class OneononesApiBase extends HttpClientBase {
  OneononesApiBase(String resource) : super('https://oneonones-api.herokuapp.com/api/v1/$resource/');
}
