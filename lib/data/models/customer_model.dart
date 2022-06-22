class CustomerModel {
  CustomerModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
  });
  String email;
  String firstName;
  String lastName;
  String password;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data.addAll({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'username': email,
    });
    return _data;
  }
}
