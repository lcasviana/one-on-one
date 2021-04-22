import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';

part 'login.controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final IAuthenticationService _authenticationService;

  _LoginController(this._authenticationService);

  @observable
  TextEditingController _emailController = TextEditingController();

  @computed
  TextEditingController get emailController => _emailController;

  @action
  Future login() async {
    await _authenticationService.login(emailController.text);
  }
}
