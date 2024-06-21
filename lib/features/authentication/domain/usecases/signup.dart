import '../repositories/auth_repository.dart';

class SignUp {
  final AuthRepository authRepository;
  SignUp(this.authRepository);

  Future<String> call(String userName, String email, String password) {
    return authRepository.signup(userName, email, password);
  }
}
