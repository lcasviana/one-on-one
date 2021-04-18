import 'package:oneonones/common/enumerations/frequency.enum.dart';
import 'package:oneonones/common/utils/frequency.util.dart';

class OneononeInputModel {
  String leaderId;
  String ledId;
  FrequencyEnum frequency;

  OneononeInputModel(
    this.leaderId,
    this.ledId,
    this.frequency,
  );

  Map<String, dynamic> toJson() {
    return {
      'leaderId': leaderId,
      'ledId': ledId,
      'frequency': FrequencyUtil.toInt(frequency),
    };
  }
}
