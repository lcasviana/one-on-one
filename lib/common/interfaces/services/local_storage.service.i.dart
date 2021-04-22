abstract class ILocalStorageService {
  Future<String?> obtain(String key);
  Future insert(String key, String value);
  Future remove(String key);
}
