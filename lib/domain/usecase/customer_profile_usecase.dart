import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CustomerProfileUsecase implements BaseUsecase<int, CustomerDetailEntity> {
  final Repository _repository;
  CustomerProfileUsecase(this._repository);
  @override
  Future<Either<Failure, CustomerDetailEntity>> execute(int input) async {
    return _repository.getCustomerProfile(input);
  }
}
