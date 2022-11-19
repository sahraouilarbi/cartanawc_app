import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/data/models/login_request.dart';
import '/data/models/models.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class LoginUsecase
    implements BaseUsecase<LoginUsecaseInput, LoginResponseModel> {
  LoginUsecase(this._repository);
  final Repository _repository;

  @override
  Future<Either<Failure, LoginResponseModel>> execute(
      LoginUsecaseInput input) async {
    return _repository.login(LoginRequest(input.username, input.password));
  }
}

class LoginUsecaseInput {
  LoginUsecaseInput(this.username, this.password);
  String username;
  String password;
}
