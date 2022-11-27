/// Reset Password Request
class ResetPasswordRequestModel {
  String email;

  ResetPasswordRequestModel(this.email);

  Map<String, dynamic> toJson() => {
        'email': email,
      };
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

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
        'password': code,
      };
}

/// Validate Code Request
class ValidateCodeRequestModel {
  String email;
  String code;

  ValidateCodeRequestModel(
    this.email,
    this.code,
  );

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };
}

/// Reset Password Response
class ResetPasswordResponseModel {
  String? code;
  String? message;

  ResetPasswordResponseModel({
    this.code,
    this.message,
    this.data,
  });

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
