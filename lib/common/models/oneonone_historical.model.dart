import 'package:oneonones/common/models/employee.model.dart';

class OneononeHistoricalModel {
  EmployeeModel? leader;
  EmployeeModel? led;
  DateTime? occurrence;
  String? commentary;

  OneononeHistoricalModel({
    this.leader,
    this.led,
    this.occurrence,
    this.commentary,
  });

  OneononeHistoricalModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    leader = EmployeeModel.fromJson(json['leader']);
    led = EmployeeModel.fromJson(json['led']);
    occurrence = DateTime.parse(json['occurrence']);
    commentary = json['commentary'];
  }
}
