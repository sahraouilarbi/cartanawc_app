import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUsercase
    implements BaseUsecase<String, ResetPasswordResponseEntity> {
  final Repository _repository;

  ForgotPasswordUsercase(this._repository);

  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> execute(String email) {
    return _repository.forgotPassword(email);
  }
}
