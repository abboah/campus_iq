import 'package:campus_iq/core/errors/usecases/use_case_provider.dart';
import 'package:campus_iq/features/authentication/domain/usecases/logout.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/reset.dart';
import '../../domain/usecases/signup.dart';

final authRemoteDataSourceProvider = Provider((ref) => AuthRemoteDataSource());
final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider)));

final loginProvider =
    Provider((ref) => Login(ref.watch(authRepositoryProvider)));
final signupProvider =
    Provider((ref) => SignUp(ref.watch(authRepositoryProvider)));
final resetPasswordProvider =
    Provider((ref) => ResetPassword(ref.watch(authRepositoryProvider)));
