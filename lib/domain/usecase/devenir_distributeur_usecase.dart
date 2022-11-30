import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class DevenirDistributeurUsecase
    implements
        BaseUsecase<DevenirDistributeurRequestEntity,
            DevenirDistributeurResponseEntity> {
  final Repository _repository;
  DevenirDistributeurUsecase(this._repository);
  @override
  Future<Either<Failure, DevenirDistributeurResponseEntity>> execute(
    DevenirDistributeurRequestEntity _formData,
  ) {
    return _repository.devenirDistributeur(_formData);
  }
}
