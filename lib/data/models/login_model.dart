class LoginResponseModel {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  LoginResponseDataModel? data;

  LoginResponseModel({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json['success'] != null ? json['success'] as bool : null,
        statusCode:
            json['statusCode'] != null ? json['statusCode'] as int : null,
        code: json['code'] != null ? json['code'] as String : null,
        message: json['message'] != null ? json['message'] as String : null,
        data: json['data'] != null
            ? LoginResponseDataModel.fromJson(
                json['data'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['success'] = success;
    _data['statusCode'] = statusCode;
    _data['code'] = code;
    _data['message'] = message;
    if (data != null) {
      _data['data'] = data!.toJson();
    }
    return _data;
  }
}

class LoginResponseDataModel {
  LoginResponseDataModel({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });
  String? token;
  int? id;
  String? email;
  String? nicename;
  String? firstName;
  String? lastName;
  String? displayName;

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseDataModel(
        token: json['token'] != null ? json['token'] as String : null,
        id: json['id'] != null ? json['id'] as int : null,
        email: json['email'] != null ? json['email'] as String : null,
        nicename: json['nicename'] != null ? json['nicename'] as String : null,
        firstName:
            json['firstName'] != null ? json['firstName'] as String : null,
        lastName: json['lastName'] != null ? json['lastName'] as String : null,
        displayName:
            json['displayName'] != null ? json['displayName'] as String : null,
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['token'] = token;
    _data['id'] = id;
    _data['email'] = email;
    _data['nicename'] = nicename;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['displayName'] = displayName;
    return _data;
  }
}
