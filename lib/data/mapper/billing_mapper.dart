import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// BillingModel
extension BillingModelMapper on BillingModel? {
  BillingEntity toDomain() {
    return BillingEntity(
      firstName: this?.firstName?.orEmpty() ?? kEMPTY,
      lastName: this?.lastName?.orEmpty() ?? kEMPTY,
      company: this?.company?.orEmpty() ?? kEMPTY,
      address1: this?.address1?.orEmpty() ?? kEMPTY,
      address2: this?.address2?.orEmpty() ?? kEMPTY,
      city: this?.city?.orEmpty() ?? kEMPTY,
      state: this?.state?.orEmpty() ?? kEMPTY,
      postcode: this?.postcode?.orEmpty() ?? kEMPTY,
      country: this?.country?.orEmpty() ?? kEMPTY,
      email: this?.email?.orEmpty() ?? kEMPTY,
      phone: this?.phone?.orEmpty() ?? kEMPTY,
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
