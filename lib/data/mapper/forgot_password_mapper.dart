import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// ForgotResponseModel
extension ResetPasswordResponseModelMapper on ResetPasswordResponseModel? {
  ResetPasswordResponseEntity toDomain() {
    return ResetPasswordResponseEntity(
      code: this?.code?.orEmpty() ?? kEMPTY,
      message: this?.message?.orEmpty() ?? kEMPTY,
      data: this!.data.toDomain(),
    );
  }
}

extension ResetPasswordResponseModelDataModelMapper
    on ResetPasswordResponseModelDataModel? {
  ResetPasswordResponseEntityDataEntity toDomain() {
    return ResetPasswordResponseEntityDataEntity(
      status: this?.status?.orZero() ?? kZERO,
    );
  }
}
