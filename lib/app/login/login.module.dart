import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/login/controller/login.controller.dart';
import 'package:oneonones/app/login/page/login.page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
