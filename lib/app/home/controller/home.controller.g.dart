// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool>? _$initializedComputed;

  @override
  bool get initialized =>
      (_$initializedComputed ??= Computed<bool>(() => super.initialized,
              name: '_HomeController.initialized'))
          .value;
  Computed<int>? _$navigationIndexComputed;

  @override
  int get navigationIndex =>
      (_$navigationIndexComputed ??= Computed<int>(() => super.navigationIndex,
              name: '_HomeController.navigationIndex'))
          .value;

  final _$_userAtom = Atom(name: '_HomeController._user');

  @override
  UserModel? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(UserModel? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$_dashboardAtom = Atom(name: '_HomeController._dashboard');

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

  final _$_navigationIndexAtom = Atom(name: '_HomeController._navigationIndex');

  @override
  int get _navigationIndex {
    _$_navigationIndexAtom.reportRead();
    return super._navigationIndex;
  }

  @override
  set _navigationIndex(int value) {
    _$_navigationIndexAtom.reportWrite(value, super._navigationIndex, () {
      super._navigationIndex = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void getUser() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.getUser');
    try {
      return super.getUser();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getDashboard() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.getDashboard');
    try {
      return super.getDashboard();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNavigationIndex(int index) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setNavigationIndex');
    try {
      return super.setNavigationIndex(index);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialized: ${initialized},
navigationIndex: ${navigationIndex}
    ''';
  }
}
