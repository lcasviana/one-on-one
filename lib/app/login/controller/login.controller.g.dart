// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<TextEditingController>? _$emailControllerComputed;

  @override
  TextEditingController get emailController => (_$emailControllerComputed ??=
          Computed<TextEditingController>(() => super.emailController,
              name: '_LoginController.emailController'))
      .value;

  final _$_emailControllerAtom =
      Atom(name: '_LoginController._emailController');

  @override
  TextEditingController get _emailController {
    _$_emailControllerAtom.reportRead();
    return super._emailController;
  }

  @override
  set _emailController(TextEditingController value) {
    _$_emailControllerAtom.reportWrite(value, super._emailController, () {
      super._emailController = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginController.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
emailController: ${emailController}
    ''';
  }
}
