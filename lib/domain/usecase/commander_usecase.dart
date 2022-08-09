import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class CommanderUsecase implements BaseUsecase<String, List<ProductEntity>> {
  final Repository _repository;
  CommanderUsecase(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> execute(String userRole) {
    return _repository.getProducts(userRole);
  }
}
