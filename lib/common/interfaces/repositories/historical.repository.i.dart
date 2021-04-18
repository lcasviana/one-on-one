import 'package:oneonones/common/models/historical/historical.model.dart';

abstract class IHistoricalRepository {
  Future<HistoricalModel> obtain(String id);
}
