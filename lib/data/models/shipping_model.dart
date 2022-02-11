class ShippingModel {
  ShippingModel({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
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

  ShippingModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] as String;
    lastName = json['last_name'] as String;
    company = json['company'] as String;
    address1 = json['address_1'] as String;
    address2 = json['address_2'] as String;
    city = json['city'] as String;
    state = json['state'] as String;
    postcode = json['postcode'] as String;
    country = json['country'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    data['country'] = country;
    return data;
  }
}
