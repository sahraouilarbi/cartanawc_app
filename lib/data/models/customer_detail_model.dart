import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';

class CustomerDetailModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String role;
  BillingModel billing;
  ShippingModel shipping;
  String avatarUrl;

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

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailModel(
        id: json['id'] != null ? json['id'] as int : null,
        email: json['email'] != null ? json['email'] as String : null,
        firstName:
            json['first_name'] != null ? json['first_name'] as String : null,
        lastName:
            json['last_name'] != null ? json['last_name'] as String : null,
        role: json['role'] != null ? json['role'] as String : null,
        billing: json['billing'] != null
            ? BillingModel.fromJson(json['billing'] as Map<String, dynamic>)
            : null,
        shipping: json['shipping'] != null
            ? ShippingModel.fromJson(json['shipping'] as Map<String, dynamic>)
            : null,
        avatarUrl:
            json['avatar_url'] != null ? json['avatar_url'] as String : null,
      );
}
