import 'package:cartanawc_app/domain/entities/shipping_entity.dart';

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
  List<LineItemsEntity> lineItems;
  double totalAmount;
  double shippingTotal;
  double itemTotalAmount;
}

class LineItemsEntity {
  LineItemsEntity({
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
