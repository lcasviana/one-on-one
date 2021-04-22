import 'package:oneonones/common/enumerations/frequency.enum.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/utils/frequency.util.dart';

class OneononeModel {
  EmployeeModel leader;
  EmployeeModel led;
  FrequencyEnum frequency;

  OneononeModel(
    this.leader,
    this.led,
    this.frequency,
  );

  static OneononeModel fromJson(Map<String, dynamic> json) {
    return OneononeModel(
      EmployeeModel.fromJson(json['leader']),
      EmployeeModel.fromJson(json['led']),
      FrequencyUtil.toEnum(json['frequency']),
    );
  }
}
