import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/category_entity.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class CategoriesUsecase implements BaseUsecase<void, List<CategoryEntity>> {
  final Repository _repository;
  CategoriesUsecase(this._repository);
  @override
  Future<Either<Failure, List<CategoryEntity>>> execute(void input) {
    return _repository.getCategories();
  }
}
