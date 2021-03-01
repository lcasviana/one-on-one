import 'package:oneonones/common/models/employee.model.dart';
import 'package:oneonones/common/models/oneonone_compose.model.dart';

class DashboardModel {
  EmployeeModel employee;
  List<OneononeComposeModel> oneonones;

  DashboardModel({
    this.employee,
    this.oneonones,
  });

  DashboardModel.fromJson(Map<String, dynamic> json) {
    employee = EmployeeModel.fromJson(json['employee']);
    oneonones = List<OneononeComposeModel>.from(json['oneonones'].map((j) => OneononeComposeModel.fromJson(j)));
  }
}
