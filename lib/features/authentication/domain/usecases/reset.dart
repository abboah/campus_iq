import '../repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository repository;
  ResetPassword(this.repository);

  Future<String> call(String email) {
    return repository.resetPassword(email);
  }
}
