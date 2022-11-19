import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class ForgotPasswordUsercase
    implements BaseUsecase<String, ResetPasswordResponseEntity> {
  final Repository _repository;

  ForgotPasswordUsercase(this._repository);

  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> execute(String email) {
    return _repository.forgotPassword(email);
  }
}
