import 'package:oneonones/common/models/oneonone/oneonone.model.dart';
import 'package:oneonones/common/models/oneonone/oneonone_input.model.dart';

abstract class IOneononeRepository {
  Future<OneononeModel> obtain(String id);
  Future<OneononeModel> insert(OneononeInputModel oneononeInput);
  Future<OneononeModel> update(OneononeModel oneonone);
  Future<bool> delete(String id);
}
