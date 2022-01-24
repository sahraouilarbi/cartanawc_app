import 'package:cartanawc_app/core/error/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  BAD_REQUEST,
  CACHE_ERROR,
  CANCEL,
  CONNECT_TIMEOUT,
  DEFAULT,
  FORBIDEN,
  INTERNAL_SERVER_ERROR,
  NOT_FOUND,
  NO_CONTENT,
  NO_INTERNET_CONNECTION,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  SUCESS,
  UNAUTHORISED,
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
  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
        break;
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
        break;
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
        break;
      // case DioErrorType.response:
      //   switch (error.response.statusCode) {
      //     case ResponseCode.BAD_REQUEST:
      //       return DataSource.BAD_REQUEST.getFailure();
      //       break;
      //     case ResponseCode.FORBIDEN:
      //       return DataSource.FORBIDEN.getFailure();
      //       break;
      //     case ResponseCode.INTERNAL_SERVER_ERROR:
      //       return DataSource.INTERNAL_SERVER_ERROR.getFailure();
      //       break;
      //     case ResponseCode.NOT_FOUND:
      //       return DataSource.NOT_FOUND.getFailure();
      //       break;
      //     case ResponseCode.UNAUTHORISED:
      //       return DataSource.UNAUTHORISED.getFailure();
      //       break;
      //     default:
      //       return DataSource.DEFAULT.getFailure();
      //       break;
      //   }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
        break;
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
        break;
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.FORBIDEN:
        return Failure(ResponseCode.FORBIDEN, ResponseMessage.FORBIDEN);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // Api status codes
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  // local status codes
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // Api response codes
  static const String SUCCESS = '';
  static const String NO_CONTENT = '';
  static const String BAD_REQUEST = '';
  static const String UNAUTHORISED = '';
  static const String FORBIDEN = '';
  static const String NOT_FOUND = '';
  static const String INTERNAL_SERVER_ERROR = '';

  // local response codes
  static const String DEFAULT = '';
  static const String CONNECT_TIMEOUT = '';
  static const String CANCEL = '';
  static const String RECEIVE_TIMEOUT = '';
  static const String SEND_TIMEOUT = '';
  static const String CACHE_ERROR = '';
  static const String NO_INTERNET_CONNECTION = '';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
