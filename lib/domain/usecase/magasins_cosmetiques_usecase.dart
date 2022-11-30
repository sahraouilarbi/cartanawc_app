import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class MagasinsCosmetiquesUseCase
    implements BaseUsecase<void, List<MagasinCosmetiqueEntity>> {
  final Repository _repository;
  MagasinsCosmetiquesUseCase(this._repository);
  @override
  Future<Either<Failure, List<MagasinCosmetiqueEntity>>> execute(void input) {
    return _repository.getMagasinsCosmetiques();
  }
}
