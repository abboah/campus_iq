// lib/data/repositories/auth_repository_impl.dart
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

abstract class AuthRepositoryImpl implements AuthRepository {
  Future<void> clearToken();

  final AuthRemoteDataSource remoteDataSource;
  final LocalStorage localStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.localStorage);

  @override
  Future<User> login(String userNameOrEmail, String password) async {
    final userModel = await remoteDataSource.login(userNameOrEmail, password);
    return User(
      userName: userModel.userName,
      email: userModel.email,
      token: userModel.token,
    );
  }

  @override
  Future<String> signup(String userName, String email, String password) {
    return remoteDataSource.signup(userName, email, password);
  }

  @override
  Future<String> resetPassword(String email) {
    return remoteDataSource.resetPassword(email);
  }
}
