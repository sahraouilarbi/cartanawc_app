class ShippingEntity {
  ShippingEntity({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
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
  String phone;

  @override
  String toString() {
    return """
firstName:$firstName,
lastName:$lastName,
company:$company,
address1:$address1,
address2:$address2,
city:$city,
postcode:$postcode,
country:$country,
state:$state,
phone:$phone,
""";
  }
}
