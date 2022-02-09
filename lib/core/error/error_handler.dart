import 'package:cartanawc_app/core/error/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  badRequest,
  cacheError,
  cancel,
  connectTimeout,
  DEFAULT,
  forbidden,
  internalServerError,
  notFound,
  noContent,
  noInternetConnection,
  receiveTimeout,
  sendTimeout,
  SUCESS,
  unAuthorised,
}

class ErrorHandler implements Exception {
  Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  Failure _dioErrorTypeResponse(int error) {
    switch (error) {
      case ResponseCode.badRequest:
        return DataSource.badRequest.getFailure();
      case ResponseCode.forbidden:
        return DataSource.forbidden.getFailure();
      case ResponseCode.internalServerError:
        return DataSource.internalServerError.getFailure();
      case ResponseCode.notFound:
        return DataSource.notFound.getFailure();
      case ResponseCode.unAuthorised:
        return DataSource.unAuthorised.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.connectTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.response:
        return _dioErrorTypeResponse(error.response.statusCode);
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.unAuthorised:
        return Failure(ResponseCode.unAuthorised, ResponseMessage.unAuthorised);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // Api status codes
  static const int SUCCESS = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unAuthorised = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // local status codes
  static const int DEFAULT = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // Api response codes
  static const String SUCCESS = 'success';
  static const String noContent = 'no_content';
  static const String badRequest = 'bad_request_error';
  static const String unAuthorised = 'unauthorized_error';
  static const String forbidden = 'forbiden_error';
  static const String notFound = 'not_found_error';
  static const String internalServerError = 'internal_server_error';

  // local response codes
  static const String DEFAULT = 'default_error';
  static const String connectTimeout = 'timoeout_error';
  static const String cancel = 'default_error';
  static const String receiveTimeout = 'timeout_error';
  static const String sendTimeout = 'timeout_error';
  static const String cacheError = 'cache_error';
  static const String noInternetConnection = 'no_internet_error';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int failure = 1;
}
