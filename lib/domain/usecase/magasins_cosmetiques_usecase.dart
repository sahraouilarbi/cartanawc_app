import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class MagasinsCosmetiquesUseCase
    implements BaseUsecase<void, List<MagasinCosmetiqueEntity>> {
  final Repository _repository;
  MagasinsCosmetiquesUseCase(this._repository);
  @override
  Future<Either<Failure, List<MagasinCosmetiqueEntity>>> execute(void input) {
    return _repository.getMagasinsCosmetiques();
  }
}
