import 'package:oneonones/common/models/user.model.dart';

abstract class IAuthenticationService {
  UserModel? get user;
  Future startup();
  Future login(String email);
  Future logout();
}
