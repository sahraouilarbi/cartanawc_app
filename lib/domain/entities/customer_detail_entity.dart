import 'package:cartanawc_app/domain/entities/entities.dart';

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
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  BillingEntity? billing;
  ShippingEntity? shipping;
  String? avatarUrl;

  @override
  String toString() {
    final String customerDetailEntity = """
id: $id,
email: $email,
firstName: $firstName,
lastName: $lastName,
role: $role,
-------------------
BILLING:\n ${billing.toString()},
-------------------
SHIPPING:\n ${shipping.toString()},
-------------------
avatarUrl: $avatarUrl,
""";
    return customerDetailEntity;
  }
}
