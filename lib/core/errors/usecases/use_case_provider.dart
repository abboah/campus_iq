// core/usecases/use_case_providers.dart
import 'package:campus_iq/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/authentication/data/datasources/auth_local_data_source.dart';
import '../../../features/authentication/domain/usecases/logout.dart';
import '../../../features/authentication/presentation/providers/auth_providers.dart';

// Provider for AuthLocalDataSource
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl();
});

//Provider for AuthRemoteDataSource
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

// Provider for Logout use case
final logoutUseCaseProvider = Provider<Logout>((ref) {
  return Logout(ref.read(authRepositoryProvider));
});
