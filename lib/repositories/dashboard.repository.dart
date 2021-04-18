import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/models/dashboard/dashboard.model.dart';
import 'package:oneonones/repositories/base/oneonones_api.base.dart';

class DashboardRepository extends OneononesApiBase implements IDashboardRepository {
  DashboardRepository() : super('dashboards');

  Future<DashboardModel> obtain(String id) async {
    final json = await get(path: id);
    final dashboard = DashboardModel.fromJson(json);
    return dashboard;
  }
}
