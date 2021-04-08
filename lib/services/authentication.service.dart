import 'dart:async';

import 'package:oneonones/repositories/employee.repository.dart';
import 'package:oneonones/common/models/employee.model.dart';
import 'package:oneonones/services/local_storage.service.dart';

abstract class AuthenticationService {
  static final _localStorageKey = 'Authentication.Email';
  static final _employeeRepository = EmployeeRepository();

  static EmployeeModel? _employee;

  static Future<bool> startup() async {
    final storageEmail = await (LocalStorageService.obtain(_localStorageKey)
        as FutureOr<String>);
    if (storageEmail.isEmpty) return false;
    _employee = await _employeeRepository.obtain(storageEmail);
    return _employee != null;
  }

  static Future<bool> login(String email) async {
    _employee = await _employeeRepository.obtain(email);
    if (_employee == null) return false;
    return await LocalStorageService.insert(
        _localStorageKey, _employee!.email!);
  }

  static Future<bool> logout() async {
    return await LocalStorageService.remove(_localStorageKey);
  }

  static String? get email => _employee?.email;
  static String? get name => _employee?.name;
}
