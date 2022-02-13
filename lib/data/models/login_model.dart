class LoginResponseModel {
  LoginResponseModel({
    this.success,
    this.statusCode,
    this.code,
    this.message,
  });
  bool success;
  int statusCode;
  String code;
  String message;
  DataModel data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool;
    statusCode = json['statusCode'] as int;
    code = json['code'] as String;
    message = json['message'] as String;
    data = json['data'] != null
        ? DataModel.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataModel {
  DataModel({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });
  String token;
  int id;
  String email;
  String nicename;
  String firstName;
  String lastName;
  String displayName;

  DataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
    id = json['id'] as int;
    email = json['email'] as String;
    nicename = json['nicename'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    displayName = json['displayName'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['email'] = email;
    data['nicename'] = nicename;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['displayName'] = displayName;
    return data;
  }
}
