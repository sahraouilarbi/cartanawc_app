import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// ShippingModel
extension ShippingModelMapper on ShippingModel {
  ShippingEntity toDomain() {
    return ShippingEntity(
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
