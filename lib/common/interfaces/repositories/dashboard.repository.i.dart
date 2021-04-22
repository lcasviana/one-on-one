import 'package:oneonones/common/models/dashboard/dashboard.model.dart';

abstract class IDashboardRepository {
  Future<DashboardModel> obtainById(String id);
}
