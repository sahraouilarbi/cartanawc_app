import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/category_entity.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CatagoriesUsecase implements BaseUsecase<void, List<CategoryEntity>> {
  final Repository _repository;
  CatagoriesUsecase(this._repository);
  @override
  Future<Either<Failure, List<CategoryEntity>>> execute(void input) {
    return _repository.getCategories();
  }
}
