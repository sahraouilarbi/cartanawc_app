import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// ForgotResponseModel
extension ForgotPasswordResponseModelMapper on ForgotPasswordResponseModel {
  ForgotPasswordResponseEntity toDomain() {
    return ForgotPasswordResponseEntity(email);
  }
}
