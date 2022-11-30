import 'package:cartanawc_app/data/models/models.dart';

class OrderModel {
  int? orderId;
  String? orderNumber;
  String? orderKey;
  String? status;
  DateTime? orderDateCreated;
  String? orderTotal;
  int? customerId;
  BillingModel? billing;
  ShippingModel? shipping;
  String? paymentMethod;
  String? paymentMethodTitle;
  String? transactionId;
  List<OrderLineItemsModel>? lineItems;
  bool? setPaid;

  OrderModel({
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
    this.billing,
    this.shipping,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['id'] != null ? json['id'] as int : null,
      orderNumber: json['number'] != null ? json['number'] as String : null,
      orderKey: json['order_key'] != null ? json['order_key'] as String : null,
      status: json['status'] != null ? json['status'] as String : null,
      orderDateCreated: json['date_created'] != null
          ? DateTime.parse(json['date_created'] as String)
          : null,
      orderTotal: json['total'] != null ? json['total'] as String : null,
      customerId:
          json['customer_id'] != null ? json['customer_id'] as int : null,
    );
  }
  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'payment_method': paymentMethod,
        'payment_method_title': paymentMethodTitle,
        'set_paid': setPaid,
        'transaction_id': transactionId,
        'shipping': shipping!.toJson(),
        'billing': billing!.toJson(),
        'line_items': lineItems != null
            ? lineItems!.map((_e) => _e.toJson()).toList()
            : null,
      };
}

class OrderLineItemsModel {
  int? productId;
  int? variationId;
  int? quantity;
  String? subtotal;

  OrderLineItemsModel({
    this.productId,
    this.variationId,
    this.quantity,
    this.subtotal,
  });

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'variation_id': variationId != null ? variationId : null,
        'quantity': quantity,
      };
}
