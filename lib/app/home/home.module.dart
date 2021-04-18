import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';
import 'package:oneonones/app/home/page/home.page.dart';
import 'package:oneonones/repositories/dashboard.repository.dart';
import 'package:oneonones/repositories/employee.repository.dart';
import 'package:oneonones/repositories/historical.repository.dart';
import 'package:oneonones/repositories/oneonone.repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
    Bind((i) => DashboardRepository()),
    Bind((i) => EmployeeRepository()),
    Bind((i) => HistoricalRepository()),
    Bind((i) => OneononeRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
