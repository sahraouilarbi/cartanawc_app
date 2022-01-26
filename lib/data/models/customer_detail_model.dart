import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';

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
