import 'package:oneonones/common/interfaces/repositories/historical.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/historical/historical.model.dart';

class HistoricalRepository implements IHistoricalRepository {
  final IHttpService _http;
  final _resource = 'historicals';

  HistoricalRepository(this._http);

  Future<HistoricalModel> obtain(String id) async {
    final json = await _http.get(path: '$_resource/$id');
    final historical = HistoricalModel.fromJson(json);
    return historical;
  }
}
