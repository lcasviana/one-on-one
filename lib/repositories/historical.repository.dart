import 'package:oneonones/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/oneonone_historical.model.dart';

class HistoricalRepository extends OneononesApiBase {
  HistoricalRepository() : super('historicals');

  Future<List<OneononeHistoricalModel>> obtain(String email) async {
    final json = await get(path: email);
    final historical = List<OneononeHistoricalModel>.from(json.map((j) => OneononeHistoricalModel.fromJson(j)));
    return historical;
  }
}
