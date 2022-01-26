import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

class CustomerDetailEntity {
  CustomerDetailEntity({
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
  BillingEntity billing;
  ShippingEntity shipping;
  String avatarUrl;
}
