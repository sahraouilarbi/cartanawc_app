import '/domain/entities/entities.dart';

class OrderDetailEntity {
  OrderDetailEntity({
    this.orderId,
    this.orderNumber,
    this.paymentMethod,
    this.orderStatus,
    this.orderDate,
    this.shipping,
    this.lineItems,
    this.totalAmount,
    this.shippingTotal,
    this.itemTotalAmount,
  });
  int orderId;
  String orderNumber;
  String paymentMethod;
  String orderStatus;
  DateTime orderDate;
  ShippingEntity shipping;
  List<OrderDetailsLineItemsEntity> lineItems;
  double totalAmount;
  double shippingTotal;
  double itemTotalAmount;
}

class OrderDetailsLineItemsEntity {
  OrderDetailsLineItemsEntity({
    this.productId,
    this.productName,
    this.quantity,
    this.variationId,
    this.totalAmount,
  });
  int productId;
  String productName;
  int quantity;
  int variationId;
  double totalAmount;
}
