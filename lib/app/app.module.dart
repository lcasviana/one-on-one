import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/oneonone/oneonone.module.dart';
import 'package:oneonones/app/landing/landing.module.dart';
import 'package:oneonones/app/login/login.module.dart';
import 'package:oneonones/common/constants/configuration.constant.dart';
import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/historical.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/oneonone.repository.i.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';
import 'package:oneonones/common/interfaces/services/http.service.i.dart';
import 'package:oneonones/common/interfaces/services/local_storage.service.i.dart';
import 'package:oneonones/core/repositories/dashboard.repository.dart';
import 'package:oneonones/core/repositories/employee.repository.dart';
import 'package:oneonones/core/repositories/historical.repository.dart';
import 'package:oneonones/core/repositories/oneonone.repository.dart';
import 'package:oneonones/core/services/authentication.service.dart';
import 'package:oneonones/core/services/http.service.dart';
import 'package:oneonones/core/services/local_storage.service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // services
    Bind<IAuthenticationService>((i) => AuthenticationService(i.get(), i.get())),
    Bind<IHttpService>((i) => HttpService(ConfigurationConstants.OneononeApi)),
    Bind<ILocalStorageService>((i) => LocalStorageService()),
    // repositories
    Bind<IDashboardRepository>((i) => DashboardRepository(i.get())),
    Bind<IEmployeeRepository>((i) => EmployeeRepository(i.get())),
    Bind<IHistoricalRepository>((i) => HistoricalRepository(i.get())),
    Bind<IOneononeRepository>((i) => OneononeRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LandingModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/oneonone', module: OneononeModule()),
  ];
}
