import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// LoginResponseModel
extension LoginResponseModelMapper on LoginResponseModel? {
  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      success: this?.success?.orFalseBool() ?? false,
      statusCode: this?.statusCode?.orZero() ?? kZERO,
      code: this?.code?.orEmpty() ?? kEMPTY,
      message: this?.message?.orEmpty() ?? kEMPTY,
      data: this!.data.toDomain(),
    );
  }
}

// LoginResponse - DataModel
extension LoginResponseDataModelMapper on LoginResponseDataModel? {
  DataEntity toDomain() {
    return DataEntity(
      token: this?.token?.orEmpty() ?? kEMPTY,
      id: this?.id?.orZero() ?? kZERO,
      email: this?.email?.orEmpty() ?? kEMPTY,
      nicename: this?.nicename?.orEmpty() ?? kEMPTY,
      firstName: this?.firstName?.orEmpty() ?? kEMPTY,
      lastName: this?.lastName?.orEmpty() ?? kEMPTY,
      displayName: this?.displayName?.orEmpty() ?? kEMPTY,
    );
  }
}
