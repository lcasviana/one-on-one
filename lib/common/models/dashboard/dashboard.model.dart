import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/models/dashboard/oneonone_compose.model.dart';

class DashboardModel {
  EmployeeModel employee;
  List<OneononeComposeModel> oneonones;

  DashboardModel(
    this.employee,
    this.oneonones,
  );

  static DashboardModel fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      EmployeeModel.fromJson(json['employee']),
      List<OneononeComposeModel>.from(json['oneonones'].map((o) => OneononeComposeModel.fromJson(o))),
    );
  }
}
