import 'package:oneonones/repositories/base/base.repository.dart';
import 'package:oneonones/repositories/models/historical.model.dart';

class HistoricalRepository extends BaseRepository {
  HistoricalRepository() : super('historicals');

  Future<List<HistoricalModel>> obtain(String email) async {
    final json = await httpClient.get(path: email);
    final historical = List<HistoricalModel>.from(json.map((j) => HistoricalModel.fromJson(j)));
    return historical;
  }
}
