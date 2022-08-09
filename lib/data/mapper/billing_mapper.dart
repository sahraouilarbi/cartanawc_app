// BillingModel
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

extension BillingModelMapper on BillingModel {
  BillingEntity toDomain() {
    return BillingEntity(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
      email: email,
      phone: phone,
    );
  }
}

// BillingEntity
extension BillingEntityMapper on BillingEntity {
  BillingModel toModel() {
    return BillingModel(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
      email: email,
      phone: phone,
    );
  }
}
