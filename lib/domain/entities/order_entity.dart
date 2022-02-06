import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

class OrderEntity {
  OrderEntity(
      {this.id,
      this.parent_id,
      this.number,
      this.order_key,
      this.created_via,
      this.version,
      this.status,
      this.currency,
      this.date_created,
      this.date_created_gmt,
      this.date_modified,
      this.date_modified_gmt,
      this.discount_total,
      this.discount_tax,
      this.shipping_total,
      this.shipping_tax,
      this.cart_tax,
      this.total,
      this.total_tax,
      this.prices_include_tax,
      this.customer_id,
      this.customer_ip_address,
      this.customer_user_agent,
      this.customer_note,
      this.billing,
      this.shipping,
      this.payment_method,
      this.payment_method_title,
      this.transaction_id,
      this.date_paid,
      this.date_paid_gmt,
      this.date_completed,
      this.date_completed_gmt,
      this.cart_hash,
      this.meta_data,
      this.line_items,
      this.tax_lines,
      this.shipping_lines,
      this.fee_lines,
      this.coupon_lines,
      this.refunds,
      this.set_paid});
  int id;
  int parent_id;
  String number;
  String order_key;
  String created_via;
  String version;
  String status;
  String currency;
  DateTime date_created;
  DateTime date_created_gmt;
  DateTime date_modified;
  DateTime date_modified_gmt;
  String discount_total;
  String discount_tax;
  String shipping_total;
  String shipping_tax;
  String cart_tax;
  String total;
  String total_tax;
  bool prices_include_tax;
  int customer_id;
  String customer_ip_address;
  String customer_user_agent;
  String customer_note;
  BillingEntity billing;
  ShippingEntity shipping;
  String payment_method;
  String payment_method_title;
  String transaction_id;
  DateTime date_paid;
  DateTime date_paid_gmt;
  DateTime date_completed;
  DateTime date_completed_gmt;
  String cart_hash;
  List<OrderMetaDataEntity> meta_data;
  List<OrderLineItemsEntity> line_items;
  List<OrderTaxLinesEntity> tax_lines;
  List<OrderShippingLinesEntity> shipping_lines;
  List<OrderFeeLinesEntity> fee_lines;
  List<OrderCouponLinesEntity> coupon_lines;
  List<OrderRefundsEntity> refunds;
  bool set_paid;
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
    this.product_id,
    this.variation_id,
    this.quantity,
    this.tax_class,
    this.subtotal,
    this.subtotal_tax,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
    this.sku,
    this.price,
  });

  int id;
  String name;
  int product_id;
  int variation_id;
  int quantity;
  String tax_class;
  String subtotal;
  String subtotal_tax;
  String total;
  String total_tax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> meta_data;
  String sku;
  String price;
}

class OrderTaxLinesEntity {
  OrderTaxLinesEntity({
    this.id,
    this.rate_code,
    this.rate_id,
    this.label,
    this.compound,
    this.tax_total,
    this.shipping_tax_total,
    this.meta_data,
  });

  int id;
  String rate_code;
  String rate_id;
  String label;
  bool compound;
  String tax_total;
  String shipping_tax_total;
  List<OrderMetaDataEntity> meta_data;
}

class OrderShippingLinesEntity {
  OrderShippingLinesEntity({
    this.id,
    this.method_title,
    this.method_id,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
  });

  int id;
  String method_title;
  String method_id;
  String total;
  String total_tax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> meta_data;
}

class OrderFeeLinesEntity {
  OrderFeeLinesEntity({
    this.id,
    this.name,
    this.tax_class,
    this.tax_status,
    this.total,
    this.total_tax,
    this.taxes,
    this.meta_data,
  });
  int id;
  String name;
  String tax_class;
  String tax_status;
  String total;
  String total_tax;
  List<OrderTaxesEntity> taxes;
  List<OrderMetaDataEntity> meta_data;
}

class OrderCouponLinesEntity {
  OrderCouponLinesEntity({
    this.id,
    this.code,
    this.discount,
    this.discount_tax,
    this.meta_data,
  });
  int id;
  String code;
  String discount;
  String discount_tax;
  List<OrderMetaDataEntity> meta_data;
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
    this.rate_code,
    this.rate_id,
    this.label,
    this.compound,
    this.tax_total,
    this.shipping_tax_total,
    this.meta_data,
  });
  int id;
  String rate_code;
  String rate_id;
  String label;
  bool compound;
  String tax_total;
  String shipping_tax_total;
  List<OrderMetaDataEntity> meta_data;
}
/*
class OrderEntity {
  OrderEntity({
    this.customerId,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.setPaid,
    this.transactionId,
    this.lineItems,
    this.orderId,
    this.orderNumber,
    this.orderKey,
    this.status,
    this.orderDateCreated,
    this.orderTotal,
  });
  int orderId;
  String orderNumber;
  String orderKey;
  String status;
  DateTime orderDateCreated;
  String orderTotal;
  int customerId;
  BillingEntity billing;
  ShippingEntity shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  List<LineItemsEntity> lineItems;
  bool setPaid;
}

class LineItemsEntity {
  LineItemsEntity({
    this.productId,
    this.variationId,
    this.quantity,
    this.subtotal,
  });
  int productId;
  int variationId;
  int quantity;
  String subtotal;
}
*/
