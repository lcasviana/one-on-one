// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oneonone.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OneononeController on _OneononeController, Store {
  Computed<bool>? _$initializedComputed;

  @override
  bool get initialized =>
      (_$initializedComputed ??= Computed<bool>(() => super.initialized,
              name: '_OneononeController.initialized'))
          .value;
  Computed<UserModel>? _$userComputed;

  @override
  UserModel get user =>
      (_$userComputed ??= Computed<UserModel>(() => super.user,
              name: '_OneononeController.user'))
          .value;
  Computed<List<EmployeeModel>>? _$employeesComputed;

  @override
  List<EmployeeModel> get employees => (_$employeesComputed ??=
          Computed<List<EmployeeModel>>(() => super.employees,
              name: '_OneononeController.employees'))
      .value;
  Computed<DashboardModel>? _$dashboardComputed;

  @override
  DashboardModel get dashboard =>
      (_$dashboardComputed ??= Computed<DashboardModel>(() => super.dashboard,
              name: '_OneononeController.dashboard'))
          .value;

  final _$_initializedAtom = Atom(name: '_OneononeController._initialized');

  @override
  bool get _initialized {
    _$_initializedAtom.reportRead();
    return super._initialized;
  }

  @override
  set _initialized(bool value) {
    _$_initializedAtom.reportWrite(value, super._initialized, () {
      super._initialized = value;
    });
  }

  final _$_employeesAtom = Atom(name: '_OneononeController._employees');

  @override
  List<EmployeeModel>? get _employees {
    _$_employeesAtom.reportRead();
    return super._employees;
  }

  @override
  set _employees(List<EmployeeModel>? value) {
    _$_employeesAtom.reportWrite(value, super._employees, () {
      super._employees = value;
    });
  }

  final _$_dashboardAtom = Atom(name: '_OneononeController._dashboard');

  @override
  DashboardModel? get _dashboard {
    _$_dashboardAtom.reportRead();
    return super._dashboard;
  }

  @override
  set _dashboard(DashboardModel? value) {
    _$_dashboardAtom.reportWrite(value, super._dashboard, () {
      super._dashboard = value;
    });
  }

  final _$oneononeInsertPartnerAtom =
      Atom(name: '_OneononeController.oneononeInsertPartner');

  @override
  EmployeeModel? get oneononeInsertPartner {
    _$oneononeInsertPartnerAtom.reportRead();
    return super.oneononeInsertPartner;
  }

  @override
  set oneononeInsertPartner(EmployeeModel? value) {
    _$oneononeInsertPartnerAtom.reportWrite(value, super.oneononeInsertPartner,
        () {
      super.oneononeInsertPartner = value;
    });
  }

  final _$oneononeInsertFrequencyAtom =
      Atom(name: '_OneononeController.oneononeInsertFrequency');

  @override
  FrequencyEnum? get oneononeInsertFrequency {
    _$oneononeInsertFrequencyAtom.reportRead();
    return super.oneononeInsertFrequency;
  }

  @override
  set oneononeInsertFrequency(FrequencyEnum? value) {
    _$oneononeInsertFrequencyAtom
        .reportWrite(value, super.oneononeInsertFrequency, () {
      super.oneononeInsertFrequency = value;
    });
  }

  final _$oneononeInsertLeaderAtom =
      Atom(name: '_OneononeController.oneononeInsertLeader');

  @override
  bool? get oneononeInsertLeader {
    _$oneononeInsertLeaderAtom.reportRead();
    return super.oneononeInsertLeader;
  }

  @override
  set oneononeInsertLeader(bool? value) {
    _$oneononeInsertLeaderAtom.reportWrite(value, super.oneononeInsertLeader,
        () {
      super.oneononeInsertLeader = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_OneononeController.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$oneononeInsertAsyncAction =
      AsyncAction('_OneononeController.oneononeInsert');

  @override
  Future<dynamic> oneononeInsert(
      String leaderId, String ledId, FrequencyEnum frequency) {
    return _$oneononeInsertAsyncAction
        .run(() => super.oneononeInsert(leaderId, ledId, frequency));
  }

  final _$_OneononeControllerActionController =
      ActionController(name: '_OneononeController');

  @override
  void oneononeInsertSetPartner(EmployeeModel? employee) {
    final _$actionInfo = _$_OneononeControllerActionController.startAction(
        name: '_OneononeController.oneononeInsertSetPartner');
    try {
      return super.oneononeInsertSetPartner(employee);
    } finally {
      _$_OneononeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void oneononeInsertSetFrequency(FrequencyEnum? frequency) {
    final _$actionInfo = _$_OneononeControllerActionController.startAction(
        name: '_OneononeController.oneononeInsertSetFrequency');
    try {
      return super.oneononeInsertSetFrequency(frequency);
    } finally {
      _$_OneononeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void oneononeInsertSetLeader(bool? leader) {
    final _$actionInfo = _$_OneononeControllerActionController.startAction(
        name: '_OneononeController.oneononeInsertSetLeader');
    try {
      return super.oneononeInsertSetLeader(leader);
    } finally {
      _$_OneononeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
oneononeInsertPartner: ${oneononeInsertPartner},
oneononeInsertFrequency: ${oneononeInsertFrequency},
oneononeInsertLeader: ${oneononeInsertLeader},
initialized: ${initialized},
user: ${user},
employees: ${employees},
dashboard: ${dashboard}
    ''';
  }
}
