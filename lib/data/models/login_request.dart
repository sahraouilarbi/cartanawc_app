class LoginRequest {
  LoginRequest(this.username, this.password);
  String username;
  String password;

  Map<String, String> toJson() {
    return <String, String>{
      'username': username,
      'password': password,
    };
  }
}
