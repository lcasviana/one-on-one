import 'package:oneonones/common/enumerations/oneonone_frequency.enum.dart';

class OneononeInputModel {
  String leaderEmail;
  String ledEmail;
  OneononeFrequencyEnum frequency;

  OneononeInputModel({
    this.leaderEmail,
    this.ledEmail,
    this.frequency,
  });

  Map<String, dynamic> toJson() {
    return {
      'leaderEmail': leaderEmail,
      'ledEmail': ledEmail,
      'frequency': frequency,
    };
  }
}
