import '/data/models/models.dart';
import '/domain/entities/entities.dart';
import 'mappers.dart';

// OrderModel - toDomain()
extension OrderModelMapper on OrderModel {
  OrderEntity toDomain() {
    final List<OrderLineItemsEntity> _lineItemsMapped =
        (lineItems.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderLineItemsEntity>()
            .toList();
    return OrderEntity(
      customerId: customerId,
      paymentMethodTitle: paymentMethodTitle,
      setPaid: setPaid,
      transactionId: transactionId,
      lineItems: _lineItemsMapped,
      orderId: orderId,
      orderNumber: orderNumber,
      orderKey: orderKey,
      status: status,
      orderDateCreated: orderDateCreated,
      orderTotal: orderTotal,
    );
  }
}

// OrderLineItemsModel - toDomain()
extension OrderLineItemsModelMapper on OrderLineItemsModel {
  OrderLineItemsEntity toDomain() {
    return OrderLineItemsEntity(
      productId: productId,
      variationId: variationId,
      quantity: quantity,
      subtotal: subtotal,
    );
  }
}

// OrderDetailModel - toDomain()
extension OrderDetailModelMappser on OrderDetailModel {
  OrderDetailEntity toDomain() {
    final List<OrderDetailsLineItemsEntity> lineItemsMapped =
        (lineItems.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderDetailsLineItemsEntity>()
            .toList();
    return OrderDetailEntity(
      orderId: orderId,
      orderNumber: orderNumber,
      paymentMethod: paymentMethod,
      orderStatus: orderStatus,
      orderDate: orderDate,
      shipping: shipping.toDomain(),
      lineItems: lineItemsMapped,
      totalAmount: totalAmount,
      shippingTotal: shippingTotal,
      itemTotalAmount: itemTotalAmount,
    );
  }
}

// LineItemsModel - toDomain()
extension LineItemsModelMapper on OrderDetailLineItemsModel {
  OrderDetailsLineItemsEntity toDomain() {
    return OrderDetailsLineItemsEntity(
      productId: productId,
      productName: productName,
      quantity: quantity,
      variationId: variationId,
      totalAmount: totalAmount,
    );
  }
}

// OrderEntity - toModel()
extension OrderEntityMapper on OrderEntity {
  OrderModel toModel() {
    final List<OrderLineItemsModel> _lineItemsMapped =
        (lineItems.map((e) => e)).cast<OrderLineItemsModel>().toList();
    return OrderModel(
      orderId: orderId,
      orderNumber: orderNumber,
      status: status,
      orderDateCreated: orderDateCreated,
      orderTotal: orderTotal,
      customerId: customerId,
      billing: billing.toModel(),
      shipping: shipping.toModel(),
      paymentMethod: paymentMethod,
      paymentMethodTitle: paymentMethodTitle,
      transactionId: transactionId,
      lineItems: _lineItemsMapped,
      setPaid: setPaid,
    );
  }
}
