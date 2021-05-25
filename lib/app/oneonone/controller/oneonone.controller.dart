import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:oneonones/common/enumerations/frequency.enum.dart';
import 'package:oneonones/common/interfaces/repositories/dashboard.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/historical.repository.i.dart';
import 'package:oneonones/common/interfaces/repositories/oneonone.repository.i.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';
import 'package:oneonones/common/models/dashboard/dashboard.model.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/models/oneonone/oneonone_input.model.dart';
import 'package:oneonones/common/models/user.model.dart';
import 'package:oneonones/common/utils/datetime.util.dart';

part 'oneonone.controller.g.dart';

class OneononeController = _OneononeController with _$OneononeController;

abstract class _OneononeController with Store {
  final IAuthenticationService _authenticationService;
  final IDashboardRepository _dashboardRepository;
  final IEmployeeRepository _employeeRepository;
  final IHistoricalRepository _historicalRepository;
  final IOneononeRepository _oneononeRepository;

  _OneononeController(
    this._authenticationService,
    this._dashboardRepository,
    this._employeeRepository,
    this._historicalRepository,
    this._oneononeRepository,
  );

  @observable
  bool _initialized = false;

  @observable
  List<EmployeeModel>? _employees;

  @observable
  DashboardModel? _dashboard;

  @computed
  bool get initialized => _initialized;

  @computed
  UserModel get user => _authenticationService.user;

  @computed
  List<EmployeeModel> get employees => _employees!;

  @computed
  DashboardModel get dashboard => _dashboard!;

  @action
  Future init() async {
    _employees = await _employeeRepository.obtainAll();
    _dashboard = await _dashboardRepository.obtainById(user.id);
    _initialized = true;
  }

  @observable
  EmployeeModel? oneononeInsertPartner;

  @observable
  FrequencyEnum? oneononeInsertFrequency;

  @observable
  bool? oneononeInsertLeader;

  @action
  void oneononeInsertSetPartner(EmployeeModel? employee) {
    oneononeInsertPartner = employee;
  }

  @action
  void oneononeInsertSetFrequency(FrequencyEnum? frequency) {
    oneononeInsertFrequency = frequency;
  }

  @action
  void oneononeInsertSetLeader(bool? leader) {
    oneononeInsertLeader = leader;
  }

  @action
  Future oneononeInsert(String leaderId, String ledId, FrequencyEnum frequency) async {
    final oneononeInput = OneononeInputModel(leaderId, ledId, frequency);
    await _oneononeRepository.insert(oneononeInput);
  }

  @observable
  TextEditingController historicalInsertDatetimeText = TextEditingController();

  @observable
  DateTime? historicalInsertDatetime;

  @action
  void historicalInsertSetDatetime(DateTime? datetime) {
    historicalInsertDatetime = datetime;
    historicalInsertDatetimeText.text = DatetimeUtil.toDateText(datetime);
  }
}
