import 'package:oneonones/common/interfaces/repositories/historical.repository.i.dart';
import 'package:oneonones/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/historical/historical.model.dart';

class HistoricalRepository extends OneononesApiBase implements IHistoricalRepository {
  HistoricalRepository() : super('historicals');

  Future<HistoricalModel> obtain(String id) async {
    final json = await get(path: id);
    final historical = HistoricalModel.fromJson(json);
    return historical;
  }
}
