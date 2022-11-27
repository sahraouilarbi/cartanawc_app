class BillingEntity {
  BillingEntity({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
    required this.email,
    required this.phone,
  });

  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String postcode;
  String country;
  String state;
  String email;
  String phone;

  @override
  String toString() =>
      "BillingEntity(firstName: $firstName, lastName: $lastName, company: $company, address1: $address1, address2: $address2, city: $city, postcode: $postcode, country: $country, state: $state, email: $email, phone: $phone, )";
}
