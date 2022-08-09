import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class ForgotPasswordUsercase implements BaseUsecase<String, String> {
  final Repository _repository;

  ForgotPasswordUsercase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
