import 'package:oneonones/common/models/employee/employee.model.dart';

class HistoricalModel {
  EmployeeModel leader;
  EmployeeModel led;
  DateTime occurrence;
  String? commentary;

  HistoricalModel(
    this.leader,
    this.led,
    this.occurrence,
    this.commentary,
  );

  static HistoricalModel fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      EmployeeModel.fromJson(json['leader']),
      EmployeeModel.fromJson(json['led']),
      DateTime.parse(json['occurrence']),
      json['commentary'],
    );
  }
}
