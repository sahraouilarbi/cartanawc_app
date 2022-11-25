import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HistoriqueUsecase implements BaseUsecase<int, List<OrderEntity>> {
  final Repository _repository;
  HistoriqueUsecase(this._repository);
  @override
  Future<Either<Failure, List<OrderEntity>>> execute(int customerId) {
    return _repository.getOrders(customerId);
  }
}
