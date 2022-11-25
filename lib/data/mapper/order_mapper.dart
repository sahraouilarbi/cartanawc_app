import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/mapper/mappers.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// OrderModel - toDomain()
extension OrderModelMapper on OrderModel? {
  OrderEntity toDomain() {
    final List<OrderLineItemsEntity> _lineItemsMapped =
        (this?.lineItems?.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderLineItemsEntity>()
            .toList();
    return OrderEntity(
      customerId: this?.customerId.orZero() ?? kZERO,
      paymentMethod: this?.paymentMethod?.orEmpty() ?? kEMPTY,
      paymentMethodTitle: this?.paymentMethodTitle?.orEmpty() ?? kEMPTY,
      setPaid: this?.setPaid.orFalseBool() ?? false,
      transactionId: this?.transactionId?.orEmpty() ?? kEMPTY,
      lineItems: _lineItemsMapped,
      orderId: this?.orderId.orZero() ?? kZERO,
      orderNumber: this?.orderNumber?.orEmpty() ?? kEMPTY,
      orderKey: this?.orderKey?.orEmpty() ?? kEMPTY,
      status: this?.status?.orEmpty() ?? kEMPTY,
      orderDateCreated: this?.orderDateCreated?.orDateTime() ?? kDateTimeEmpty,
      orderTotal: this?.orderTotal?.orEmpty() ?? kEMPTY,
    );
  }
}

// OrderLineItemsModel - toDomain()
extension OrderLineItemsModelMapper on OrderLineItemsModel? {
  OrderLineItemsEntity toDomain() {
    return OrderLineItemsEntity(
      productId: this?.productId?.orZero() ?? kZERO,
      variationId: this?.variationId?.orZero() ?? kZERO,
      quantity: this?.quantity?.orZero() ?? kZERO,
      subtotal: this?.subtotal?.orEmpty() ?? kEMPTY,
    );
  }
}

// OrderDetailModel - toDomain()
extension OrderDetailModelMappser on OrderDetailModel? {
  OrderDetailEntity toDomain() {
    final List<OrderDetailsLineItemsEntity> lineItemsMapped =
        (this?.lineItems?.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<OrderDetailsLineItemsEntity>()
            .toList();
    return OrderDetailEntity(
      orderId: this?.orderId?.orZero() ?? kZERO,
      orderNumber: this?.orderNumber?.orEmpty() ?? kEMPTY,
      paymentMethod: this?.paymentMethod?.orEmpty() ?? kEMPTY,
      orderStatus: this?.orderStatus?.orEmpty() ?? kEMPTY,
      orderDate: this?.orderDate?.orDateTime() ?? kDateTimeEmpty,
      shipping: this!.shipping.toDomain(),
      lineItems: lineItemsMapped,
      totalAmount: this?.totalAmount?.orZeroDouble() ?? kZeroDouble,
      shippingTotal: this?.shippingTotal?.orZeroDouble() ?? kZeroDouble,
      itemTotalAmount: this?.itemTotalAmount?.orZeroDouble() ?? kZeroDouble,
    );
  }
}

// LineItemsModel - toDomain()
extension LineItemsModelMapper on OrderDetailLineItemsModel? {
  OrderDetailsLineItemsEntity toDomain() {
    return OrderDetailsLineItemsEntity(
      productId: this?.productId?.orZero() ?? kZERO,
      productName: this?.productName?.orEmpty() ?? kEMPTY,
      quantity: this?.quantity?.orZero() ?? kZERO,
      variationId: this?.variationId?.orZero() ?? kZERO,
      totalAmount: this?.totalAmount?.orZeroDouble() ?? kZeroDouble,
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
      billing: billing?.toModel(),
      shipping: shipping?.toModel(),
      paymentMethod: paymentMethod,
      paymentMethodTitle: paymentMethodTitle,
      transactionId: transactionId,
      lineItems: _lineItemsMapped,
      setPaid: setPaid,
    );
  }
}
