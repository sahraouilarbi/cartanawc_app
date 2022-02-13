class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel(this.email);
  String email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
