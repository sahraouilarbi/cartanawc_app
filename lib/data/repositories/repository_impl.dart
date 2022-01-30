import 'package:cartanawc_app/core/error/error_handler.dart';
import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/data_source/remote_data_source.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/network/network_info.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      String username, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(username, password);
        if (response.statusCode == 200) {
          return Right(LoginResponseModel.fromJson(
              response.data as Map<String, dynamic>));
        } else {
          return Left(Failure(response.statusCode, response.message));
        }
      } catch (error) {
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
