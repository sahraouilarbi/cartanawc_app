import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/cart_response_model.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/customer_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';
import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/cart_response_entity.dart';
import 'package:cartanawc_app/domain/entities/categorie_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_entity.dart';
import 'package:cartanawc_app/domain/entities/login_entity.dart';
import 'package:cartanawc_app/domain/entities/order_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

// LoginResponseModel
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

// DataModel
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

// BillingModel
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
      postcode: postcode,
      country: country,
      state: state,
      email: email,
      phone: phone,
    );
  }
}

// CartResponseModel
extension CartResponseModelMapper on CartResponseModel {
  CartResponseEntity toDomain() {
    final List<CartItemEntity> dataMapped =
        (data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<CartItemEntity>()
            .toList();

    return CartResponseEntity(
      status: status,
      data: dataMapped,
    );
  }
}

// CartItemModel
extension CartItemModelMapper on CartItemModel {
  CartItemEntity toDomain() {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      productRegularPrice: productRegularPrice,
      productSalePrice: productSalePrice,
      thumbnail: thumbnail,
      qty: qty,
      productStep: productStep,
      lineSubtotal: lineSubtotal,
      lineTotal: lineTotal,
      variationId: variationId,
      attribute: attribute,
      attributeValue: attributeValue,
    );
  }
}

// CategorieModel
extension CategorieModelMapper on CategoryModel {
  CategoryEntity toDomain() {
    return CategoryEntity(
      categoryId,
      categoryName,
      categorySlug,
      categoryParent,
      categoryDescription,
      categoryImage.toDomain(),
    );
  }
}

// CategorieImageModel
extension CategorieImageModelMapper on CategoryImageModel {
  CategoryImageEntity toDomain() {
    return CategoryImageEntity(
      src: src,
    );
  }
}

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

// OrderModel
extension OrderModelMapper on OrderModel {
  OrderEntity toDomain() {
    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();
    final List<OrderLineItemsEntity> lineItemsMapped =
        (lineItems.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderLineItemsEntity>()
            .toList();
    final List<OrderTaxLinesEntity> taxLinesMapped =
        (taxLines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxLinesEntity>()
            .toList();
    final List<OrderShippingLinesEntity> shippingLinesMapped =
        (shippingLines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderShippingLinesEntity>()
            .toList();
    final List<OrderFeeLinesEntity> feeLinesMapped =
        (feeLines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderFeeLinesEntity>()
            .toList();
    final List<OrderCouponLinesEntity> couponLinesMapped =
        (couponLines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderCouponLinesEntity>()
            .toList();
    final List<OrderRefundsEntity> refundsMapped =
        (refunds.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderRefundsEntity>()
            .toList();
    return OrderEntity(
      id: id,
      parentId: parentId,
      number: number,
      orderKey: orderKey,
      createdVia: createdVia,
      version: version,
      status: status,
      currency: currency,
      dateCreated: dateCreated,
      dateCreatedGMT: dateCreatedGMT,
      dateModified: dateModified,
      dateModifiedGMT: dateModifiedGMT,
      discountTotal: discountTotal,
      discountTax: discountTax,
      shippingTotal: shippingTotal,
      shippingTax: shippingTax,
      cartTax: cartTax,
      total: total,
      totalTax: totalTax,
      pricesIncludeTax: pricesIncludeTax,
      customerId: customerId,
      customerIpAddress: customerIpAddress,
      customerUserAgent: customerUserAgent,
      customerNote: customerNote,
      billing: billing.toDomain(),
      shipping: shipping.toDomain(),
      paymentMethod: paymentMethod,
      paymentMethodTitle: paymentMethodTitle,
      transactionId: transactionId,
      datePaid: datePaid,
      datePaidGMT: datePaidGMT,
      dateCompleted: dateCompleted,
      dateCompletedGMT: dateCompletedGMT,
      cartHash: cartHash,
      metaData: metaDataMapped,
      lineItems: lineItemsMapped,
      taxLines: taxLinesMapped,
      shippingLines: shippingLinesMapped,
      feeLines: feeLinesMapped,
      couponLines: couponLinesMapped,
      refunds: refundsMapped,
      setPaid: setPaid,
    );
  }
}

// OrderMetaDataModel
extension OrderMetaDataModelMapper on OrderMetaDataModel {
  OrderMetaDataEntity toDomain() {
    return OrderMetaDataEntity(
      id: id,
      key: key,
      value: value,
    );
  }
}

//OrderLineItemsModel
extension OrderLineItemsModelMapper on OrderLineItemsModel {
  OrderLineItemsEntity toDomain() {
    final List<OrderTaxesEntity> taxesMapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();

    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderLineItemsEntity(
      id: id,
      name: name,
      productId: productId,
      variationId: variationId,
      quantity: quantity,
      taxClass: taxClass,
      subtotal: subtotal,
      subtotalTax: subtotalTax,
      total: total,
      totalTax: totalTax,
      taxes: taxesMapped,
      metaData: metaDataMapped,
      sku: sku,
      price: price,
    );
  }
}

// OrderTaxLinesModel
extension OrderTaxLinesModelMapper on OrderTaxLinesModel {
  OrderTaxLinesEntity toDomain() {
    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderTaxLinesEntity(
      id: id,
      rateCode: rateCode,
      rateId: rateId,
      label: label,
      compound: compound,
      taxTotal: taxTotal,
      shippingTaxTotal: shippingTaxTotal,
      metaData: metaDataMapped,
    );
  }
}

// OrderShippingLinesModel
extension OrderShippingLinesModelMapper on OrderShippingLinesModel {
  OrderShippingLinesEntity toDomain() {
    final List<OrderTaxesEntity> taxesMapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();
    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderShippingLinesEntity(
      id: id,
      methodTitle: methodTitle,
      methodId: methodId,
      total: total,
      totalTax: totalTax,
      taxes: taxesMapped,
      metaData: metaDataMapped,
    );
  }
}

// OrderFeeLinesModel
extension OrderFeeLinesModelMapper on OrderFeeLinesModel {
  OrderFeeLinesEntity toDomain() {
    final List<OrderTaxesEntity> taxesMapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();
    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderFeeLinesEntity(
      id: id,
      name: name,
      taxClass: taxClass,
      taxStatus: taxStatus,
      total: total,
      totalTax: totalTax,
      taxes: taxesMapped,
      metaData: metaDataMapped,
    );
  }
}

// OrderCouponLinesModel
extension OrderCouponLinesModelMapper on OrderCouponLinesModel {
  OrderCouponLinesEntity toDomain() {
    final List<OrderMetaDataEntity> metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderCouponLinesEntity(
      id: id,
      code: code,
      discount: discount,
      discountTax: discountTax,
      metaData: metaDataMapped,
    );
  }
}

// OrderRefundsModel
extension OrderRefundsModelMapper on OrderRefundsModel {
  OrderRefundsEntity toDomain() {
    return OrderRefundsEntity(
      id: id,
      reason: reason,
      total: total,
    );
  }
}

// OrderTaxesModel
extension OrderTaxesModelMapper on OrderTaxesModel {
  OrderTaxesEntity toDomain() {
    return OrderTaxesEntity();
  }
}

/*
    Fonction pour maper les lists
    List<Entity> VARIABLE_mapped = (VARIABLE.map((v) => v.toDomain()) ?? const Iterable.empty()).cast<Entity>().toList();
 */
