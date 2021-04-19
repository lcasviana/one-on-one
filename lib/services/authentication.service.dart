import 'package:oneonones/common/interfaces/repositories/employee.repository.i.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';
import 'package:oneonones/common/interfaces/services/local_storage.service.i.dart';
import 'package:oneonones/common/models/user.model.dart';

class AuthenticationService implements IAuthenticationService {
  ILocalStorageService _localStorageService;
  IEmployeeRepository _employeeRepository;

  final _localStorageKey = 'Authentication:Id';
  UserModel? _user;

  AuthenticationService(
    this._localStorageService,
    this._employeeRepository,
  );

  UserModel? get user => _user;

  Future init() async {
    final email = await _localStorageService.obtain(_localStorageKey);
    if (email == null || email.isEmpty) throw Exception('Empty local storage.');
    final employee = await _employeeRepository.obtainByEmail(email);
    _user = UserModel(employee.id, employee.email, employee.name);
  }

  Future login(String email) async {
    final employee = await _employeeRepository.obtainByEmail(email);
    _user = UserModel(employee.id, employee.email, employee.name);
    await _localStorageService.insert(_localStorageKey, employee.email);
  }

  Future logout() async {
    await _localStorageService.remove(_localStorageKey);
  }
}
