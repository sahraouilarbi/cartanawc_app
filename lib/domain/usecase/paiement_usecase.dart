import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class PaiementUsecase implements BaseUsecase<int, List<PaiementEntity>> {
  final Repository _repository;
  PaiementUsecase(this._repository);
  @override
  Future<Either<Failure, List<PaiementEntity>>> execute(int customerId) {
    return _repository.getPaiements(customerId);
  }
}
