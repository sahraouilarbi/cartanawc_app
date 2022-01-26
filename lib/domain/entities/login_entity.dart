class LoginResponseEntity {
  LoginResponseEntity({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });
  bool success;
  int statusCode;
  String code;
  String message;
  DataEntity data;
}

class DataEntity {
  DataEntity({
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
}
