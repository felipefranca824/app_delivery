import 'package:app_delivery/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(UserModel user);
  Future<UserModel> login(String email, String password);
}
