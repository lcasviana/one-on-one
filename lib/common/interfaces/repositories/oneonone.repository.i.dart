import 'package:oneonones/common/models/oneonone/oneonone.model.dart';

abstract class IOneononeRepository {
  Future<OneononeModel> obtain(String id);
}
