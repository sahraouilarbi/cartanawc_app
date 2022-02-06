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
    final List<CartItemEntity> data_mapped =
        (data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<CartItemEntity>()
            .toList();

    return CartResponseEntity(
      status: status,
      data: data_mapped,
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
extension CategorieModelMapper on CategorieModel {
  CategorieEntity toDomain() {
    return CategorieEntity(
      categorieId,
      categorieName,
      categorieSlug,
      categorieParent,
      categorieDescription,
      categorieImage.toDomain(),
    );
  }
}

// CategorieImageModel
extension CategorieImageModelMapper on CategorieImageModel {
  CategorieImageEntity toDomain() {
    return CategorieImageEntity(
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
    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();
    final List<OrderLineItemsEntity> line_items_mapped =
        (line_items.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderLineItemsEntity>()
            .toList();
    final List<OrderTaxLinesEntity> tax_lines_mapped =
        (tax_lines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxLinesEntity>()
            .toList();
    final List<OrderShippingLinesEntity> shipping_lines_mapped =
        (shipping_lines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderShippingLinesEntity>()
            .toList();
    final List<OrderFeeLinesEntity> fee_lines_mapped =
        (fee_lines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderFeeLinesEntity>()
            .toList();
    final List<OrderCouponLinesEntity> coupon_lines_mapped =
        (coupon_lines.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderCouponLinesEntity>()
            .toList();
    final List<OrderRefundsEntity> refunds_mapped =
        (refunds.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderRefundsEntity>()
            .toList();
    return OrderEntity(
      id: id,
      parent_id: parent_id,
      number: number,
      order_key: order_key,
      created_via: created_via,
      version: version,
      status: status,
      currency: currency,
      date_created: date_created,
      date_created_gmt: date_created_gmt,
      date_modified: date_modified,
      date_modified_gmt: date_modified_gmt,
      discount_total: discount_total,
      discount_tax: discount_tax,
      shipping_total: shipping_total,
      shipping_tax: shipping_tax,
      cart_tax: cart_tax,
      total: total,
      total_tax: total_tax,
      prices_include_tax: prices_include_tax,
      customer_id: customer_id,
      customer_ip_address: customer_ip_address,
      customer_user_agent: customer_user_agent,
      customer_note: customer_note,
      billing: billing.toDomain(),
      shipping: shipping.toDomain(),
      payment_method: payment_method,
      payment_method_title: payment_method_title,
      transaction_id: transaction_id,
      date_paid: date_paid,
      date_paid_gmt: date_paid_gmt,
      date_completed: date_completed,
      date_completed_gmt: date_completed_gmt,
      cart_hash: cart_hash,
      meta_data: meta_data_mapped,
      line_items: line_items_mapped,
      tax_lines: tax_lines_mapped,
      shipping_lines: shipping_lines_mapped,
      fee_lines: fee_lines_mapped,
      coupon_lines: coupon_lines_mapped,
      refunds: refunds_mapped,
      set_paid: set_paid,
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
    final List<OrderTaxesEntity> taxes_mapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();

    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderLineItemsEntity(
      id: id,
      name: name,
      product_id: product_id,
      variation_id: variation_id,
      quantity: quantity,
      tax_class: tax_class,
      subtotal: subtotal,
      subtotal_tax: subtotal_tax,
      total: total,
      total_tax: total_tax,
      taxes: taxes_mapped,
      meta_data: meta_data_mapped,
      sku: sku,
      price: price,
    );
  }
}

// OrderTaxLinesModel
extension OrderTaxLinesModelMapper on OrderTaxLinesModel {
  OrderTaxLinesEntity toDomain() {
    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderTaxLinesEntity(
      id: id,
      rate_code: rate_code,
      rate_id: rate_id,
      label: label,
      compound: compound,
      tax_total: tax_total,
      shipping_tax_total: shipping_tax_total,
      meta_data: meta_data_mapped,
    );
  }
}

// OrderShippingLinesModel
extension OrderShippingLinesModelMapper on OrderShippingLinesModel {
  OrderShippingLinesEntity toDomain() {
    final List<OrderTaxesEntity> taxes_mapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();
    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderShippingLinesEntity(
      id: id,
      method_title: method_title,
      method_id: method_id,
      total: total,
      total_tax: total_tax,
      taxes: taxes_mapped,
      meta_data: meta_data_mapped,
    );
  }
}

// OrderFeeLinesModel
extension OrderFeeLinesModelMapper on OrderFeeLinesModel {
  OrderFeeLinesEntity toDomain() {
    final List<OrderTaxesEntity> taxes_mapped =
        (taxes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderTaxesEntity>()
            .toList();
    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderFeeLinesEntity(
      id: id,
      name: name,
      tax_class: tax_class,
      tax_status: tax_status,
      total: total,
      total_tax: total_tax,

      //TODO List
      taxes: taxes_mapped,

      //TOD List
      meta_data: meta_data_mapped,
    );
  }
}

// OrderCouponLinesModel
extension OrderCouponLinesModelMapper on OrderCouponLinesModel {
  OrderCouponLinesEntity toDomain() {
    final List<OrderMetaDataEntity> meta_data_mapped =
        (meta_data.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderMetaDataEntity>()
            .toList();

    return OrderCouponLinesEntity(
      id: id,
      code: code,
      discount: discount,
      discount_tax: discount_tax,
      meta_data: meta_data_mapped,
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
