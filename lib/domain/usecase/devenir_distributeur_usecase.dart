import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class DevenirDistributeurUsecase
    implements
        BaseUsecase<DevenirDistributeurRequestEntity,
            DevenirDistributeurResponseEntity> {
  final Repository _repository;
  DevenirDistributeurUsecase(this._repository);
  @override
  Future<Either<Failure, DevenirDistributeurResponseEntity>> execute(
      DevenirDistributeurRequestEntity _formData) {
    return _repository.devenirDistributeur(_formData);
  }
}
