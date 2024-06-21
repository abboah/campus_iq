import 'package:campus_iq/features/authentication/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String userNameOrEmail, String password);
  Future<String> signup(String userName, String email, String password);
  Future<String> resetPassword(String email);
}
