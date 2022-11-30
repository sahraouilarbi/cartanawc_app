import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ContactUsecase
    implements BaseUsecase<ContactRequestEntity, ContactResponseEntity> {
  final Repository _repository;
  ContactUsecase(this._repository);
  @override
  Future<Either<Failure, ContactResponseEntity>> execute(
    ContactRequestEntity _formData,
  ) {
    return _repository.contact(_formData);
  }
}
