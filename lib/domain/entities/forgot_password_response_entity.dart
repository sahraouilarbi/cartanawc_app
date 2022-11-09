class ResetPasswordRequestEntity {
  String email;
  ResetPasswordRequestEntity({required this.email});
}

class ResetPasswordResponseEntity {
  String code;
  String message;
  ResetPasswordResponseEntityDataEntity data;
  ResetPasswordResponseEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}

class ResetPasswordResponseEntityDataEntity {
  int status;
  ResetPasswordResponseEntityDataEntity({required this.status});
}
