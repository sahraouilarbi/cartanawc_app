import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class PaiementUsecase implements BaseUsecase<int, List<PaiementEntity>> {
  final Repository _repository;
  PaiementUsecase(this._repository);
  @override
  Future<Either<Failure, List<PaiementEntity>>> execute(int customerId) {
    return _repository.getPaiements(customerId);
  }
}
