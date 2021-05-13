import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/oneonone/controller/oneonone.controller.dart';
import 'package:oneonones/app/oneonone/page/oneonone.page.dart';

class OneononeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OneononeController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OneononePage(Modular.get())),
  ];
}
