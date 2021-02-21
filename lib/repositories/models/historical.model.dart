import 'package:oneonones/repositories/models/employee.model.dart';

class HistoricalModel {
  EmployeeModel leader;
  EmployeeModel led;
  DateTime occurrence;
  String commentary;

  HistoricalModel({
    this.leader,
    this.led,
    this.occurrence,
    this.commentary,
  });

  HistoricalModel.fromJson(Map<String, dynamic> json) {
    leader = EmployeeModel.fromJson(json['leader']);
    led = EmployeeModel.fromJson(json['led']);
    occurrence = DateTime.parse(json['occurrence']);
    commentary = json['commentary'];
  }
}
