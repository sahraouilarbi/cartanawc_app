import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '/data/models/models.dart';

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
