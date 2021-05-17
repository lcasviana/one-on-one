import 'package:oneonones/common/interfaces/repositories/historical.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/historical/historical.model.dart';
import 'package:oneonones/common/models/historical/historical_input.model.dart';

class HistoricalRepository implements IHistoricalRepository {
  final IHttpService _http;
  final _resource = 'historicals';

  HistoricalRepository(this._http);

  Future<HistoricalModel> obtain(String id) async {
    final json = await _http.get(path: '$_resource/$id');
    final historical = HistoricalModel.fromJson(json);
    return historical;
  }

  Future<HistoricalModel> insert(HistoricalInputModel historicalInput) async {
    final json = await _http.post(path: _resource, body: historicalInput.toJson());
    final historical = HistoricalModel.fromJson(json);
    return historical;
  }

  Future<HistoricalModel> update(HistoricalModel historical) async {
    final json = await _http.put(path: _resource, body: historical.toJson());
    final updated = HistoricalModel.fromJson(json);
    return updated;
  }

  Future<bool> delete(String id) async {
    final _ = await _http.delete(path: '$_resource/$id');
    return true;
  }
}
