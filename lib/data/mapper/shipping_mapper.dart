import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// ShippingModel
extension ShippingModelMapper on ShippingModel? {
  ShippingEntity toDomain() {
    return ShippingEntity(
      firstName: this?.firstName?.orEmpty() ?? kEMPTY,
      lastName: this?.lastName?.orEmpty() ?? kEMPTY,
      company: this?.company?.orEmpty() ?? kEMPTY,
      address1: this?.address1?.orEmpty() ?? kEMPTY,
      address2: this?.address2?.orEmpty() ?? kEMPTY,
      city: this?.city?.orEmpty() ?? kEMPTY,
      state: this?.state?.orEmpty() ?? kEMPTY,
      postcode: this?.postcode?.orEmpty() ?? kEMPTY,
      country: this?.country?.orEmpty() ?? kEMPTY,
      phone: this?.phone?.orEmpty() ?? kEMPTY,
    );
  }
}

// ShippingEntity
extension ShippingEntityMapper on ShippingEntity {
  ShippingModel toModel() {
    return ShippingModel(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
      phone: phone,
    );
  }
}
