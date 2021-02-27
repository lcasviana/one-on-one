import 'package:oneonones/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/employee.model.dart';

class EmployeeRepository extends OneononesApiBase {
  EmployeeRepository() : super('employees');

  Future<EmployeeModel> obtain(String email) async {
    final json = await get(path: email);
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }
}
