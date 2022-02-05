import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';
import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/login_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

extension LoginResponseModelMapper on LoginResponseModel {
  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      success: success,
      statusCode: statusCode,
      code: code,
      message: message,
      data: data.toDomain(),
    );
  }
}

extension DataModelMapper on DataModel {
  DataEntity toDomain() {
    return DataEntity(
      token: token,
      id: id,
      email: email,
      nicename: nicename,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
    );
  }
}

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

extension BillingModelMapper on BillingModel {
  BillingEntity toDomain() {
    return BillingEntity(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      postcode: postcode,
      country: country,
      state: state,
      email: email,
      phone: phone,
    );
  }
}

extension ShippingModelMapper on ShippingModel {
  ShippingEntity toDomain() {
    return ShippingEntity(
      firstName: firstName,
      lastName: lastName,
      company: company,
      address1: address1,
      address2: address2,
      city: city,
      postcode: postcode,
      country: country,
      state: state,
      email: email,
      phone: phone,
    );
  }
}
