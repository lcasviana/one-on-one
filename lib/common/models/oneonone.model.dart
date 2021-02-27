import 'package:oneonones/common/models/employee.model.dart';

class OneononeModel {
  EmployeeModel leader;
  EmployeeModel led;
  int frequency;

  OneononeModel({
    this.leader,
    this.led,
    this.frequency,
  });

  OneononeModel.fromJson(Map<String, dynamic> json) {
    leader = EmployeeModel.fromJson(json['leader']);
    led = EmployeeModel.fromJson(json['led']);
    frequency = json['frequency'];
  }
}
