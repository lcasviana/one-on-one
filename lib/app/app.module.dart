import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/home/home.module.dart';
import 'package:oneonones/app/landing/landing.module.dart';
import 'package:oneonones/app/login/login.module.dart';
import 'package:oneonones/repositories/employee.repository.dart';
import 'package:oneonones/services/authentication.service.dart';
import 'package:oneonones/services/local_storage.service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthenticationService(i.get(), i.get())),
    Bind((i) => LocalStorageService()),
    Bind((i) => EmployeeRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/landing', module: LandingModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
