class BillingEntity {
  BillingEntity({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.postcode,
    this.country,
    this.state,
    this.email,
    this.phone,
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
  String toString() {
    return """
firstName: $firstName,
lastName: $lastName,
company: $company,
address1: $address1,
address2: $address2,
city: $city,
postcode: $postcode,
country: $country,
state: $state,
email: $email,
phone: $phone,
""";
  }
}
