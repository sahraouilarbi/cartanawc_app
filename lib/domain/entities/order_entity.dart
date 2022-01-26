import 'package:cartanawc_app/domain/entities/billing_entity.dart';
import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

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