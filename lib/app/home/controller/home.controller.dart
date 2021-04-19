import 'package:mobx/mobx.dart';
import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';
import 'package:oneonones/common/models/dashboard/dashboard.model.dart';
import 'package:oneonones/common/models/user.model.dart';

part 'home.controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final IDashboardRepository _dashboardRepository;
  final IAuthenticationService _authenticationService;

  _HomeController(
    this._dashboardRepository,
    this._authenticationService,
  );

  @observable
  UserModel? _user;

  @observable
  DashboardModel? _dashboard;

  @observable
  int _navigationIndex = 0;

  @computed
  bool get initialized => _user != null && _dashboard != null;

  @computed
  int get navigationIndex => _navigationIndex;

  @action
  void getUser() {
    _user = _authenticationService.user;
  }

  @action
  void getDashboard() {
    _dashboardRepository.obtain(_user!.id).then((dashboard) => _dashboard = dashboard);
  }

  @action
  void setNavigationIndex(int index) => _navigationIndex = index;
}
