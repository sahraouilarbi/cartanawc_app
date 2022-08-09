import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
