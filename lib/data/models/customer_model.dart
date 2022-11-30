// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerModel {
  String? email;
  String? firstName;
  String? lastName;
  String? password;

  CustomerModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'username': email,
      };

  @override
  String toString() =>
      'CustomerModel(email: $email, firstName: $firstName, lastName: $lastName, password: $password)';
}
