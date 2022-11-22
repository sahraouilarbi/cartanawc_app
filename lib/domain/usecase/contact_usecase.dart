import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class ContactUsecase
    implements BaseUsecase<ContactRequestEntity, ContactResponseEntity> {
  final Repository _repository;
  ContactUsecase(this._repository);
  @override
  Future<Either<Failure, ContactResponseEntity>> execute(
      ContactRequestEntity _formData) {
    return _repository.contact(_formData);
  }
}
