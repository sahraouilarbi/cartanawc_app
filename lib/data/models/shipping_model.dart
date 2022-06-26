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
  String phone;

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        firstName:
            json['first_name'] != null ? json['first_name'] as String : null,
        lastName:
            json['last_name'] != null ? json['last_name'] as String : null,
        company: json['company'] != null ? json['company'] as String : null,
        address1:
            json['address_1'] != null ? json['address_1'] as String : null,
        address2:
            json['address_2'] != null ? json['address_2'] as String : null,
        city: json['city'] != null ? json['city'] as String : null,
        state: json['state'] != null ? json['state'] as String : null,
        postcode: json['postcode'] != null ? json['postcode'] as String : null,
        country: json['country'] != null ? json['country'] as String : null,
        phone: json['phone'] != null ? json['phone'] as String : null,
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address1;
    _data['address_2'] = address2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    _data['phone'] = phone;
    return _data;
  }
}
