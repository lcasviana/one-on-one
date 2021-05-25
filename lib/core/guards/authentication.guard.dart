import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';

class AuthenticationGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) {
    try {
      final authenticationService = Modular.get<IAuthenticationService>();
      final _ = authenticationService.user;
      final isValid = url.contains('oneonone');
      return Future.value(isValid);
    } catch (e) {
      final isValid = url.contains('login');
      return Future.value(isValid);
    }
  }

  @override
  // TODO: implement guardedRoute
  String? get guardedRoute => throw UnimplementedError();
}
