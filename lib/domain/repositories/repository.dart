import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, LoginResponseModel>> login(LoginRequest loginRequest);
  Future forgotPassword();
}
