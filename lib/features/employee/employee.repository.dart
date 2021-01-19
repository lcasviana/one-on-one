import 'emplyee.model.dart';

class EmployeeRepository {
  EmployeeRepository._();

  static Future<EmployeeModel> getEmployee(String email) async {
    EmployeeModel employee = EmployeeModel(name: 'Lucas', email: 'lcasviana@gmail.com');
    return Future.delayed(const Duration(seconds: 1), () => employee);
  }
}
