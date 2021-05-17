import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/models/employee/employee_input.model.dart';

class EmployeeRepository implements IEmployeeRepository {
  final IHttpService _http;
  final _resource = 'employees';

  EmployeeRepository(this._http);

  Future<List<EmployeeModel>> obtainAll() async {
    final json = await _http.get(path: _resource);
    final employee = List<EmployeeModel>.from(json.map((item) => EmployeeModel.fromJson(item)));
    return employee;
  }

  Future<EmployeeModel> obtainById(String id) async {
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

  Future<EmployeeModel> insert(EmployeeInputModel employeeInput) async {
    final json = await _http.post(path: _resource, body: employeeInput.toJson());
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }

  Future<EmployeeModel> update(EmployeeModel employee) async {
    final json = await _http.put(path: _resource, body: employee.toJson());
    final updated = EmployeeModel.fromJson(json);
    return updated;
  }

  Future<bool> delete(String id) async {
    final _ = await _http.delete(path: '$_resource/$id');
    return true;
  }
}
