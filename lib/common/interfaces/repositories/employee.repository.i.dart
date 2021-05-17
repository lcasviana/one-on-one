import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/models/employee/employee_input.model.dart';

abstract class IEmployeeRepository {
  Future<List<EmployeeModel>> obtainAll();
  Future<EmployeeModel> obtainById(String id);
  Future<EmployeeModel> obtainByEmail(String email);
  Future<EmployeeModel> insert(EmployeeInputModel employeeInput);
  Future<EmployeeModel> update(EmployeeModel employee);
  Future<bool> delete(String id);
}
