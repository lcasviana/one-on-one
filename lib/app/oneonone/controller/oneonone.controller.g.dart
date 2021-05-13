// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oneonone.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OneononeController on _OneononeController, Store {
  Computed<UserModel?>? _$userComputed;

  @override
  UserModel? get user =>
      (_$userComputed ??= Computed<UserModel?>(() => super.user,
              name: '_OneononeController.user'))
          .value;
  Computed<DashboardModel?>? _$dashboardComputed;

  @override
  DashboardModel? get dashboard =>
      (_$dashboardComputed ??= Computed<DashboardModel?>(() => super.dashboard,
              name: '_OneononeController.dashboard'))
          .value;
  Computed<bool>? _$initializedComputed;

  @override
  bool get initialized =>
      (_$initializedComputed ??= Computed<bool>(() => super.initialized,
              name: '_OneononeController.initialized'))
          .value;

  final _$_userAtom = Atom(name: '_OneononeController._user');

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

  final _$getDashboardAsyncAction =
      AsyncAction('_OneononeController.getDashboard');

  @override
  Future<dynamic> getDashboard() {
    return _$getDashboardAsyncAction.run(() => super.getDashboard());
  }

  final _$_OneononeControllerActionController =
      ActionController(name: '_OneononeController');

  @override
  void getUser() {
    final _$actionInfo = _$_OneononeControllerActionController.startAction(
        name: '_OneononeController.getUser');
    try {
      return super.getUser();
    } finally {
      _$_OneononeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
dashboard: ${dashboard},
initialized: ${initialized}
    ''';
  }
}
