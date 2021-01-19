class AuthenticationService {
  AuthenticationService._();

  static Future<bool> authenticate(String username, String password) {
    return Future.delayed(const Duration(seconds: 3), () => true);
  }

  static Future<bool> autoAuthenticate() {
    return Future.delayed(const Duration(seconds: 3), () => true);
  }
}
