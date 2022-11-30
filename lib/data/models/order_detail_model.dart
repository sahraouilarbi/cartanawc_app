import 'package:cartanawc_app/data/models/models.dart';

class OrderDetailModel {
  int? orderId;
  String? orderNumber;
  String? paymentMethod;
  String? orderStatus;
  DateTime? orderDate;
  ShippingModel? shipping;
  List<OrderDetailLineItemsModel>? lineItems;
  double? totalAmount;
  double? shippingTotal;
  double? itemTotalAmount;

  OrderDetailModel({
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

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      orderId: json['id'] != null ? json['id'] as int : null,
      orderNumber:
          json['order_key'] != null ? json['order_key'] as String : null,
      paymentMethod: json['payment_method'] != null
          ? json['payment_method'] as String
          : null,
      orderStatus: json['status'] != null ? json['status'] as String : null,
      orderDate: json['date_created'] != null
          ? DateTime.parse(json['date_created'] as String)
          : null,
      shipping: json['shipping'] != null
          ? ShippingModel.fromJson(
              json['shipping'] as Map<String, dynamic>,
            )
          : null,
      lineItems: json['line_items'] != null
          ? List<OrderDetailLineItemsModel>.from(
              json['line_items'] as List,
            )
              .map(
                (_e) => OrderDetailLineItemsModel.fromJson(
                  _e as Map<String, dynamic>,
                ),
              )
              .toList()
          : null,
      totalAmount:
          json['total'] != null ? double.parse(json['total'] as String) : null,
      shippingTotal: json['shipping_total'] != null
          ? double.parse(json['shipping_total'] as String)
          : null,
      itemTotalAmount: json['line_items'] != null
          ? List<OrderDetailLineItemsModel>.from(
              json['line_items'] as List,
            )
              .map(
                (_e) => OrderDetailLineItemsModel.fromJson(
                  _e as Map<String, dynamic>,
                ),
              )
              .toList()
              .map<double>((_e) => _e.totalAmount!)
              .reduce((_value, _element) => _value + _element)
          : 0,
    );
  }
}

class OrderDetailLineItemsModel {
  int? productId;
  String? productName;
  int? quantity;
  int? variationId;
  double? totalAmount;

  OrderDetailLineItemsModel({
    this.productId,
    this.productName,
    this.quantity,
    this.variationId,
    this.totalAmount,
  });

  factory OrderDetailLineItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailLineItemsModel(
      productId: json['product_id'] != null ? json['product_id'] as int : null,
      productName: json['name'] != null ? json['name'] as String : null,
      quantity: json['quantity'] != null ? json['quantity'] as int : null,
      variationId:
          json['variation_id'] != null ? json['variation_id'] as int : null,
      totalAmount:
          json['total'] != null ? double.parse(json['total'] as String) : null,
    );
  }
}
