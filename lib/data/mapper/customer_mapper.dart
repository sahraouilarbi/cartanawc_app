import '/data/models/models.dart';
import '/domain/entities/entities.dart';
import 'mappers.dart';

// CustomerModel
extension CustomerModelMapper on CustomerModel {
  CustomerEntity toDomain() {
    return CustomerEntity(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );
  }
}

// CustomerDetailModel
extension CustomerDetailModelMapper on CustomerDetailModel {
  CustomerDetailEntity toDomain() {
    return CustomerDetailEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      billing: billing.toDomain(),
      shipping: shipping.toDomain(),
      avatarUrl: avatarUrl,
    );
  }
}
