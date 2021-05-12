import 'package:oneonones/common/interfaces/repositories/oneonone.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/oneonone/oneonone.model.dart';

class OneononeRepository implements IOneononeRepository {
  final IHttpService _http;
  final _resource = 'oneonones';

  OneononeRepository(this._http);

  Future<OneononeModel> obtain(String id) async {
    final json = await _http.get(path: '$_resource/$id');
    final oneonone = OneononeModel.fromJson(json);
    return oneonone;
  }
}
