// core/error/failures.dart

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List properties;

  const Failure([this.properties = const <dynamic>[]]);

  @override
  List get props => properties;
}

// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class LocalFailure extends Failure {}

class NetworkFailure extends Failure {}

class AuthenticationFailure extends Failure {}
