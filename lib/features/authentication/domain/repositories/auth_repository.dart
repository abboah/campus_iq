import 'package:campus_iq/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password, {required bool isEmail});
  Future<String> signup(String userName, String email, String password);
  Future<String> resetPassword(String email);
  Future<Either<Failure, void>> logout();
}
