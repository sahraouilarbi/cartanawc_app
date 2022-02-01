import 'package:cartanawc_app/core/error/error_handler.dart';
import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/data_source/remote_data_source.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/data/network/network_info.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        print(response.toJson());
        if (response.statusCode == 200) {
          print('response statusCode : ${response.statusCode}');
          return Right(LoginResponseModel.fromJson(response.data.toJson()));
        } else {
          print('response message : ${response.message}');
          return Left(Failure(response.statusCode, response.message));
        }
      } catch (error) {
        print('error message : ${error.toString()}');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
