import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';

part 'landing.controller.g.dart';

class LandingController = _LandingController with _$LandingController;

abstract class _LandingController with Store {
  final IAuthenticationService _authenticationService;

  _LandingController(this._authenticationService);

  @action
  void init() {
    _authenticationService.init().then((_) => Modular.to.navigate('/oneonone')).catchError((_) => Modular.to.navigate('/login'));
  }
}
