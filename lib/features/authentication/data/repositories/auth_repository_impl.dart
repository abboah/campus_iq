// lib/data/repositories/auth_repository_impl.dart
import 'package:campus_iq/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

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

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearToken();
      return Right(null);
    } catch (exception) {
      return Left(LocalFailure());
    }
  }
}
