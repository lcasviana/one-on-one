import 'package:oneonones/common/enumerations/oneonone_frequency.enum.dart';

abstract class OneononeFrequencyUtil {
  final toInt = const {
    OneononeFrequencyEnum.Weekly: 7,
    OneononeFrequencyEnum.Semimonthly: 15,
    OneononeFrequencyEnum.Monthly: 30,
    OneononeFrequencyEnum.Bimonthly: 60,
    OneononeFrequencyEnum.Trimonthly: 90,
    OneononeFrequencyEnum.Semiyearly: 180,
    OneononeFrequencyEnum.Yearly: 365,
    OneononeFrequencyEnum.Occasionally: 999,
  };

  final toEnum = const {
    7: OneononeFrequencyEnum.Weekly,
    15: OneononeFrequencyEnum.Semimonthly,
    30: OneononeFrequencyEnum.Monthly,
    60: OneononeFrequencyEnum.Bimonthly,
    90: OneononeFrequencyEnum.Trimonthly,
    180: OneononeFrequencyEnum.Semiyearly,
    365: OneononeFrequencyEnum.Yearly,
    999: OneononeFrequencyEnum.Occasionally,
  };
}
