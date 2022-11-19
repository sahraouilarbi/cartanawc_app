import '/core/error/error_handler.dart';

class Failure {
  Failure(this.code, this.message);
  int code;
  String message;
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.kDEFAULT, ResponseMessage.kDEFAULT);
}
