/// Reset Password Request
class ResetPasswordRequestModel {
  String email;
  ResetPasswordRequestModel(this.email);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['email'] = email;
    return _data;
  }
}

/// Set New Password Request
class SetNewPasswordRequestModel {
  String email;
  String code;
  String password;
  SetNewPasswordRequestModel(
    this.email,
    this.code,
    this.password,
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['email'] = email;
    _data['code'] = code;
    _data['password'] = code;
    return _data;
  }
}

/// Validate Code Request
class ValidateCodeRequestModel {
  String email;
  String code;

  ValidateCodeRequestModel(
    this.email,
    this.code,
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['email'] = email;
    _data['code'] = code;
    return _data;
  }
}

/// Reset Password Response
class ResetPasswordResponseModel {
  ResetPasswordResponseModel({
    this.code,
    this.message,
    this.data,
  });
  String? code;
  String? message;
  ResetPasswordResponseModelDataModel? data;
  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponseModel(
        code: json['code'] != null ? json['code'] as String : null,
        message: json['message'] != null ? json['message'] as String : null,
        data: json['data'] != null
            ? ResetPasswordResponseModelDataModel.fromJson(
                json['data'] as Map<String, dynamic>,
              )
            : null,
      );
}

class ResetPasswordResponseModelDataModel {
  int? status;
  ResetPasswordResponseModelDataModel({this.status});
  factory ResetPasswordResponseModelDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ResetPasswordResponseModelDataModel(
        status: json['status'] != null ? json['status'] as int : null,
      );
}
