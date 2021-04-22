import 'package:oneonones/common/interfaces/services/local_storage.service.i.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorageService {
  Future<String?> obtain(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = sharedPreferences.getString(key);
    return result;
  }

  Future insert(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future remove(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }
}
