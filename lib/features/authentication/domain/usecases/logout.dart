import 'package:campus_iq/features/authentication/domain/repositories/auth_repository.dart';

class Logout {
  final AuthRepository authRepository;

  Logout(this.authRepository);

  Future<void> call() async {
    await authRepository.clearToken();
  }
}
