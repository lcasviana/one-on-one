import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/models/dashboard/dashboard.model.dart';
import 'package:oneonones/core/repositories/base/oneonones_api.base.dart';

class DashboardRepository extends OneononesApiBase implements IDashboardRepository {
  DashboardRepository() : super('dashboards');

  Future<DashboardModel> obtainById(String id) async {
    final Map<String, dynamic> queryParameters = {'id': id};
    final json = await get(queryParameters: queryParameters);
    final dashboard = DashboardModel.fromJson(json);
    return dashboard;
  }
}
