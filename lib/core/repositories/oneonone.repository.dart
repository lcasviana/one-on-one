import 'package:oneonones/common/interfaces/repositories/oneonone.repository.i.dart';
import 'package:oneonones/core/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/oneonone/oneonone.model.dart';

class OneononeRepository extends OneononesApiBase implements IOneononeRepository {
  OneononeRepository() : super('oneonones');

  Future<OneononeModel> obtain(String id) async {
    final json = await get(path: id);
    final oneonone = OneononeModel.fromJson(json);
    return oneonone;
  }
}
