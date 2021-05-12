import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/dashboard/dashboard.model.dart';

class DashboardRepository implements IDashboardRepository {
  final IHttpService _http;
  final _resource = 'dashboards';

  DashboardRepository(this._http);

  Future<DashboardModel> obtainById(String id) async {
    final Map<String, dynamic> queryParameters = {'id': id};
    final json = await _http.get(path: _resource, queryParameters: queryParameters);
    final dashboard = DashboardModel.fromJson(json);
    return dashboard;
  }
}
