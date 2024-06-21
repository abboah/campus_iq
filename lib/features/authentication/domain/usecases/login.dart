import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepository;
  Login(this.authRepository);

  Future<User> call(String userNameOrEmail, String password) {
    return authRepository.login(userNameOrEmail, password);
  }
}
