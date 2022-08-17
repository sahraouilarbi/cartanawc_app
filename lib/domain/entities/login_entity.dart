class LoginResponseEntity {
  LoginResponseEntity({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });
  bool success;
  int statusCode;
  String code;
  String message;
  DataEntity data;
}

class DataEntity {
  DataEntity({
    required this.token,
    required this.id,
    required this.email,
    required this.nicename,
    required this.firstName,
    required this.lastName,
    required this.displayName,
  });
  String token;
  int id;
  String email;
  String nicename;
  String firstName;
  String lastName;
  String displayName;
}
