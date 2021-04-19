import 'package:oneonones/common/models/employee/employee.model.dart';

abstract class IEmployeeRepository {
  Future<EmployeeModel> obtain(String id);
  Future<EmployeeModel> obtainByEmail(String email);
}
