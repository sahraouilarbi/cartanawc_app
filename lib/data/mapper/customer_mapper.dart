import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';
import 'mappers.dart';

// CustomerModel
extension CustomerModelMapper on CustomerModel? {
  CustomerEntity toDomain() {
    return CustomerEntity(
      email: this?.email?.orEmpty() ?? kEMPTY,
      firstName: this?.firstName?.orEmpty() ?? kEMPTY,
      lastName: this?.lastName?.orEmpty() ?? kEMPTY,
      password: this?.password?.orEmpty() ?? kEMPTY,
    );
  }
}

// CustomerDetailModel
extension CustomerDetailModelMapper on CustomerDetailModel? {
  CustomerDetailEntity toDomain() {
    return CustomerDetailEntity(
      id: this?.id?.orZero() ?? kZERO,
      email: this?.email?.orEmpty() ?? kEMPTY,
      firstName: this?.firstName?.orEmpty() ?? kEMPTY,
      lastName: this?.lastName?.orEmpty() ?? kEMPTY,
      role: this?.role?.orEmpty() ?? kEMPTY,
      billing: this!.billing.toDomain(),
      shipping: this!.shipping.toDomain(),
      avatarUrl: this?.avatarUrl?.orEmpty() ?? kEMPTY,
    );
  }
}
