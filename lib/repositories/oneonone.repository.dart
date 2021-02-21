import 'package:oneonones/repositories/base/base.repository.dart';
import 'package:oneonones/repositories/models/oneonone.model.dart';

class OneononeRepository extends BaseRepository {
  OneononeRepository() : super('oneonones');

  Future<List<OneononeModel>> obtain(String email) async {
    final json = await httpClient.get(path: email);
    final oneonone = List<OneononeModel>.from(json.map((j) => OneononeModel.fromJson(j)));
    return oneonone;
  }
}
