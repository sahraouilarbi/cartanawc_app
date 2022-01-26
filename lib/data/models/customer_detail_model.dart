class CustomerDetailModel {
  CustomerDetailModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.billing,
    this.shipping,
    this.avatarUrl,
  });
  int id;
  String email;
  String firstName;
  String lastName;
  String role;
  BillingModel billing;
  ShippingModel shipping;
  String avatarUrl;
  CustomerDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    email = json['email'] as String;
    firstName = json['first_name'] as String;
    lastName = json['last_name'] as String;
    role = json['role'] != null ? json['role'] as String : null;
    billing = json['billing'] != null
        ? BillingModel.fromJson(json['billing'] as Map<String, dynamic>)
        : null;
    shipping = json['shipping'] != null
        ? ShippingModel.fromJson(json['shipping'] as Map<String, dynamic>)
        : null;
    avatarUrl = json['avatar_url'] as String;
  }
}

class BillingModel {
  BillingModel({
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
  BillingModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] as String;
    lastName = json['last_name'] as String;
    company = json['company'] as String;
    address1 = json['address_1'] as String;
    address2 = json['address_2'] as String;
    city = json['city'] as String;
    postcode = json['postcode'] as String;
    country = json['country'] as String;
    state = json['state'] as String;
    email = json['email'] as String;
    phone = json['phone'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['postcode'] = postcode;
    data['country'] = country;
    data['state'] = state;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class ShippingModel {
  ShippingModel({
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
  ShippingModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] as String;
    lastName = json['last_name'] as String;
    company = json['company'] as String;
    address1 = json['address_1'] as String;
    address2 = json['address_2'] as String;
    city = json['city'] as String;
    postcode = json['postcode'] as String;
    country = json['country'] as String;
    state = json['state'] as String;
    email = json['email'] as String;
    phone = json['phone'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['postcode'] = postcode;
    data['country'] = country;
    data['state'] = state;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
