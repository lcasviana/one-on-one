import 'package:oneonones/repositories/base/base.repository.dart';
import 'package:oneonones/repositories/models/employee.model.dart';

class EmployeeRepository extends BaseRepository {
  EmployeeRepository() : super('employees');

  Future<EmployeeModel> obtain(String email) async {
    final json = await httpClient.get(path: email);
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }
}
