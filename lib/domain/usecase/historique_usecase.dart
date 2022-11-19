import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class HistoriqueUsecase implements BaseUsecase<int, List<OrderEntity>> {
  final Repository _repository;
  HistoriqueUsecase(this._repository);
  @override
  Future<Either<Failure, List<OrderEntity>>> execute(int customerId) {
    return _repository.getOrders(customerId);
  }
}
