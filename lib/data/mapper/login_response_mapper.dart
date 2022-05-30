import '../../domain/entities/entities.dart';
import '../models/models.dart';

// LoginResponseModel
extension LoginResponseModelMapper on LoginResponseModel {
  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      success: success,
      statusCode: statusCode,
      code: code,
      message: message,
      data: data.toDomain(),
    );
  }
}

// LoginResponse - DataModel
extension LoginResponseDataModelMapper on LoginResponseDataModel {
  DataEntity toDomain() {
    return DataEntity(
      token: token,
      id: id,
      email: email,
      nicename: nicename,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
    );
  }
}
