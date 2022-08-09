import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class ProductsUsecase extends BaseUsecase<int, List<ProductEntity>> {
  final Repository _repository;
  ProductsUsecase(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> execute(int categoryId) {
    return _repository.getProducts(categoryId.toString());
  }
}
