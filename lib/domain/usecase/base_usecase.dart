import 'package:cartanawc_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
