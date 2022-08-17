import '/domain/entities/entities.dart';

class OrderDetailEntity {
  OrderDetailEntity({
    required this.orderId,
    required this.orderNumber,
    required this.paymentMethod,
    required this.orderStatus,
    required this.orderDate,
    required this.shipping,
    required this.lineItems,
    required this.totalAmount,
    required this.shippingTotal,
    required this.itemTotalAmount,
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
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.variationId,
    required this.totalAmount,
  });
  int productId;
  String productName;
  int quantity;
  int variationId;
  double totalAmount;
}
