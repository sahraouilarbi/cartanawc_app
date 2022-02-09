import 'package:cartanawc_app/core/error/error_handler.dart';
import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/data_source/remote_data_source.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/data/mapper/mapper.dart';
import 'package:cartanawc_app/data/network/network_info.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreferences);
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  // Login repository implementation
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.statusCode == 200) {
          return Right(response);
        } else {
          return Left(Failure(response.statusCode, response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Forgot password repository implementation
  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgotPassword(email);
        /*if (response.statusCode == 200) {
          return Right();
        } else {
          return Left(Failure(response.statusCode ?? ResponseCode.DEFAULT,
              response.mesage ?? ResponseMessage.DEFAULT));
        }*/
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Get customer profile repository implementation
  @override
  Future<Either<Failure, CustomerDetailEntity>> getCustomerProfile(
      int userId) async {
    final userID = await _appPreferences.getUserId();
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCustomerProfile(userID);
        if (true) {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
