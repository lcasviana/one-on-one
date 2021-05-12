import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';
import 'package:oneonones/app/home/page/home.page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(Modular.get())),
  ];
}
