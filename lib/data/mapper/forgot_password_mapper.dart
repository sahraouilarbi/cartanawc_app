import '../../domain/entities/entities.dart';
import '../models/models.dart';

// ForgotResponseModel
extension ForgotPasswordResponseModelMapper on ForgotPasswordResponseModel {
  ForgotPasswordResponseEntity toDomain() {
    return ForgotPasswordResponseEntity(email);
  }
}
