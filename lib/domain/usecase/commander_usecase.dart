import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CommanderUsecase implements BaseUsecase<String, List<ProductEntity>> {
  final Repository _repository;
  CommanderUsecase(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> execute(String userRole) {
    return _repository.getProducts(userRole);
  }
}
