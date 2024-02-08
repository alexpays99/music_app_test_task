import 'package:dartz/dartz.dart';

import '../entities/failure.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}
