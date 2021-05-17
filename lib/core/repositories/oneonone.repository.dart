import 'package:oneonones/common/interfaces/repositories/oneonone.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/oneonone/oneonone.model.dart';
import 'package:oneonones/common/models/oneonone/oneonone_input.model.dart';

class OneononeRepository implements IOneononeRepository {
  final IHttpService _http;
  final _resource = 'oneonones';

  OneononeRepository(this._http);

  Future<OneononeModel> obtain(String id) async {
    final json = await _http.get(path: '$_resource/$id');
    final oneonone = OneononeModel.fromJson(json);
    return oneonone;
  }

  Future<OneononeModel> insert(OneononeInputModel oneononeInput) async {
    final json = await _http.post(path: _resource, body: oneononeInput.toJson());
    final oneonone = OneononeModel.fromJson(json);
    return oneonone;
  }

  Future<OneononeModel> update(OneononeModel oneonone) async {
    final json = await _http.put(path: _resource, body: oneonone.toJson());
    final updated = OneononeModel.fromJson(json);
    return updated;
  }

  Future<bool> delete(String id) async {
    final _ = await _http.delete(path: '$_resource/$id');
    return true;
  }
}
