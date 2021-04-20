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

  @computed
  UserModel? get user => _user;

  @computed
  DashboardModel? get dashboard => _dashboard;

  @computed
  bool get initialized => _user != null && _dashboard != null;

  @action
  void getUser() {
    _user = _authenticationService.user;
  }

  @action
  Future getDashboard() async {
    final dashboard = await _dashboardRepository.obtainById(_user!.id);
    _dashboard = dashboard;
  }
}
