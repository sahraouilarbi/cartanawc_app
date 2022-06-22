import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ProductsUsecase extends BaseUsecase<int, List<ProductEntity>> {
  final Repository _repository;
  ProductsUsecase(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> execute(int categoryId) {
    return _repository.getProducts(categoryId.toString());
  }
}
