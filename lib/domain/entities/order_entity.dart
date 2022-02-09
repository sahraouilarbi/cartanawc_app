import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

class OrderEntity {
  OrderEntity(
      {this.id,
      this.parentId,
      this.number,
      this.orderKey,
      this.createdVia,
      this.version,
      this.status,
      this.currency,
      this.dateCreated,
      this.dateCreatedGMT,
      this.dateModified,
      this.dateModifiedGMT,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.cartTax,
      this.total,
      this.totalTax,
      this.pricesIncludeTax,
      this.customerId,
      this.customerIpAddress,
      this.customerUserAgent,
      this.customerNote,
      this.billing,
      this.shipping,
      this.paymentMethod,
      this.paymentMethodTitle,
      this.transactionId,
      this.datePaid,
      this.datePaidGMT,
      this.dateCompleted,
      this.dateCompletedGMT,
      this.cartHash,
      this.metaData,
      this.lineItems,
      this.taxLines,
      this.shippingLines,
      this.feeLines,
      this.couponLines,
      this.refunds,
      this.setPaid});
  int id;
  int parentId;
  String number;
  String orderKey;
  String createdVia;
  String version;
  String status;
  String currency;
  DateTime dateCreated;
  DateTime dateCreatedGMT;
  DateTime dateModified;
  DateTime dateModifiedGMT;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  bool pricesIncludeTax;
  int customerId;
  String customerIpAddress;
  String customerUserAgent;
  String customerNote;
  BillingEntity billing;
  ShippingEntity shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  DateTime datePaid;
  DateTime datePaidGMT;
  DateTime dateCompleted;
  DateTime dateCompletedGMT;
  String cartHash;
  List<OrderMetaDataEntity> metaData;
  List<OrderLineItemsEntity> lineItems;
  List<OrderTaxLinesEntity> taxLines;
  List<OrderShippingLinesEntity> shippingLines;
  List<OrderFeeLinesEntity> feeLines;
  List<OrderCouponLinesEntity> couponLines;
  List<OrderRefundsEntity> refunds;
  bool setPaid;
}

class OrderMetaDataEntity {
  OrderMetaDataEntity({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
}

class OrderLineItemsEntity {
  OrderLineItemsEntity({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
  });

  int id;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> metaData;
  String sku;
  String price;
}

class OrderTaxLinesEntity {
  OrderTaxLinesEntity({
    this.id,
    this.rateCode,
    this.rateId,
    this.label,
    this.compound,
    this.taxTotal,
    this.shippingTaxTotal,
    this.metaData,
  });

  int id;
  String rateCode;
  String rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<OrderMetaDataEntity> metaData;
}

class OrderShippingLinesEntity {
  OrderShippingLinesEntity({
    this.id,
    this.methodTitle,
    this.methodId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  int id;
  String methodTitle;
  String methodId;
  String total;
  String totalTax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> metaData;
}

class OrderFeeLinesEntity {
  OrderFeeLinesEntity({
    this.id,
    this.name,
    this.taxClass,
    this.taxStatus,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });
  int id;
  String name;
  String taxClass;
  String taxStatus;
  String total;
  String totalTax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> metaData;
}

class OrderCouponLinesEntity {
  OrderCouponLinesEntity({
    this.id,
    this.code,
    this.discount,
    this.discountTax,
    this.metaData,
  });
  int id;
  String code;
  String discount;
  String discountTax;
  List<OrderMetaDataEntity> metaData;
}

class OrderRefundsEntity {
  OrderRefundsEntity({
    this.id,
    this.reason,
    this.total,
  });
  int id;
  String reason;
  String total;
}

class OrderTaxesEntity {
  OrderTaxesEntity({
    this.id,
    this.rateCode,
    this.rateId,
    this.label,
    this.compound,
    this.taxTotal,
    this.shippingTaxTotal,
    this.metaData,
  });
  int id;
  String rateCode;
  String rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<OrderMetaDataEntity> metaData;
}
