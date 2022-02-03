import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CustomerProfileUsecase
    implements BaseUsecase<void, CustomerDetailEntity> {
  CustomerProfileUsecase(this._repository);
  final Repository _repository;
  @override
  Future<Either<Failure, CustomerDetailEntity>> execute(void input) async {
    return await _repository.getCustomerProfile();
  }
}
