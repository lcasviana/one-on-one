import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  static Future<String?> obtain(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = sharedPreferences.getString(key);
    return result;
  }

  static Future<bool> insert(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = await sharedPreferences.setString(key, value);
    return result;
  }

  static Future<bool> remove(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = await sharedPreferences.remove(key);
    return result;
  }
}
