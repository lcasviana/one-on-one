import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';

class EmployeeRepository implements IEmployeeRepository {
  final IHttpService _http;
  final _resource = 'employees';

  EmployeeRepository(this._http);

  Future<EmployeeModel> obtain(String id) async {
    final json = await _http.get(path: '$_resource/$id');
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }

  Future<EmployeeModel> obtainByEmail(String email) async {
    final Map<String, dynamic> queryParameters = {'email': email};
    final json = await _http.get(path: _resource, queryParameters: queryParameters);
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }
}
