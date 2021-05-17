import 'package:oneonones/common/models/historical/historical.model.dart';
import 'package:oneonones/common/models/historical/historical_input.model.dart';

abstract class IHistoricalRepository {
  Future<HistoricalModel> obtain(String id);
  Future<HistoricalModel> insert(HistoricalInputModel historicalInput);
  Future<HistoricalModel> update(HistoricalModel historical);
  Future<bool> delete(String id);
}
