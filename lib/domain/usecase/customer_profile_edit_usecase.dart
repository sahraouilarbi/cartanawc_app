import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class CustomerProfileEditUsecase
    implements BaseUsecase<int, CustomerDetailEntity> {
  final Repository _repository;
  CustomerProfileEditUsecase(this._repository);
  @override
  Future<Either<Failure, CustomerDetailEntity>> execute(int input) async {
    return _repository.getCustomerProfile(input);
  }
}
