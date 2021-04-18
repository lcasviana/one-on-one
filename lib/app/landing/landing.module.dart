import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/landing/controller/landing.controller.dart';
import 'package:oneonones/app/landing/page/landing.page.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LandingController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LandingPage()),
  ];
}
