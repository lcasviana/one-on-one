import 'package:oneonones/common/models/dashboard.model.dart';
import 'package:oneonones/repositories/base/oneonones_api.base.dart';

class DashboardRepository extends OneononesApiBase {
  DashboardRepository() : super('dashboards');

  Future<DashboardModel> obtain(String email) async {
    final json = await get(path: email);
    final dashboard = DashboardModel.fromJson(json);
    return dashboard;
  }
}
