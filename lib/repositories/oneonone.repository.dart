import 'package:oneonones/repositories/base/oneonones_api.base.dart';
import 'package:oneonones/common/models/oneonone.model.dart';

class OneononeRepository extends OneononesApiBase {
  OneononeRepository() : super('oneonones');

  Future<List<OneononeModel>> obtain(String email) async {
    final json = await get(path: email);
    final oneonone = List<OneononeModel>.from(json.map((j) => OneononeModel.fromJson(j)));
    return oneonone;
  }
}
