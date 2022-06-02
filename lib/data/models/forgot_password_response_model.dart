class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel(this.email);
  String email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['email'] = email;
    return _data;
  }
}
