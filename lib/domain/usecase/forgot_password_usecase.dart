import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUsercase implements BaseUsecase<String, String> {
  ForgotPasswordUsercase(this._repository);
  final Repository _repository;

  @override
  Future<Either<Failure, String>> execute(String input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
