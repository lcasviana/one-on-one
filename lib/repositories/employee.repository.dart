import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';

class EmployeeRepository extends OneononesApiBase implements IEmployeeRepository {
  EmployeeRepository() : super('employees');

  Future<EmployeeModel> obtain(String id) async {
    final json = await get(path: id);
    final employee = EmployeeModel.fromJson(json);
    return employee;
  }
}
