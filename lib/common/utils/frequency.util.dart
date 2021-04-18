import 'package:oneonones/common/enumerations/frequency.enum.dart';

abstract class FrequencyUtil {
  static int toInt(FrequencyEnum enumeration) {
    switch (enumeration) {
      case FrequencyEnum.Weekly:
        return 7;
      case FrequencyEnum.Semimonthly:
        return 15;
      case FrequencyEnum.Monthly:
        return 30;
      case FrequencyEnum.Bimonthly:
        return 60;
      case FrequencyEnum.Trimonthly:
        return 90;
      case FrequencyEnum.Semiyearly:
        return 180;
      case FrequencyEnum.Yearly:
        return 365;
      case FrequencyEnum.Occasionally:
        return 999;
      default:
        throw Exception('Invalid enumeration ($enumeration).');
    }
  }

  static FrequencyEnum toEnum(int number) {
    switch (number) {
      case 7:
        return FrequencyEnum.Weekly;
      case 15:
        return FrequencyEnum.Semimonthly;
      case 30:
        return FrequencyEnum.Monthly;
      case 60:
        return FrequencyEnum.Bimonthly;
      case 90:
        return FrequencyEnum.Trimonthly;
      case 180:
        return FrequencyEnum.Semiyearly;
      case 365:
        return FrequencyEnum.Yearly;
      case 999:
        return FrequencyEnum.Occasionally;
      default:
        throw Exception('Invalid number ($number).');
    }
  }
}
