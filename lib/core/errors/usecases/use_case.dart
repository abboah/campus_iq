// core/usecases/usecase.dart
import 'package:dartz/dartz.dart';
import '../failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
