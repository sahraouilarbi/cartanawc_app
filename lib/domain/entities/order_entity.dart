import '/domain/entities/entities.dart';

class OrderEntity {
  OrderEntity({
    required this.customerId,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.setPaid,
    required this.transactionId,
    required this.lineItems,
    required this.orderId,
    required this.orderNumber,
    required this.orderKey,
    required this.status,
    required this.orderDateCreated,
    required this.orderTotal,
  });
  int orderId;
  String orderNumber;
  String orderKey;
  String status;
  DateTime orderDateCreated;
  String orderTotal;
  int customerId;
  BillingEntity? billing;
  ShippingEntity? shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  List<OrderLineItemsEntity> lineItems;
  bool setPaid;
}

class OrderLineItemsEntity {
  OrderLineItemsEntity({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.subtotal,
  });

  int productId;
  int variationId;
  int quantity;
  String subtotal;
}
