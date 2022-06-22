class LoginRequest {
  LoginRequest(this.username, this.password);
  String username;
  String password;

  Map<String, String> toJson() {
    final Map<String, String> _data = <String, String>{};
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }
}
