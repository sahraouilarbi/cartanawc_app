import '/data/models/models.dart';

class OrderModel {
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

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'] as int;
    orderNumber = json['number'] as String;
    orderKey = json['order_key'] as String;
    status = json['status'] as String;
    orderDateCreated = DateTime.parse(json['date_created'] as String);
    orderTotal = json['total'] as String;

    customerId = json['customer_id'] as int;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    data['set_paid'] = setPaid;
    data['transaction_id'] = transactionId;
    data['shipping'] = shipping!.toJson();
    data['billing'] = billing!.toJson();
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderLineItemsModel {
  OrderLineItemsModel({
    this.productId,
    this.variationId,
    this.quantity,
    this.subtotal,
  });

  int? productId;
  int? variationId;
  int? quantity;
  String? subtotal;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['product_id'] = productId;
    if (variationId != null) {
      _data['variation_id'] = variationId;
    }
    _data['quantity'] = quantity;
    return _data;
  }
}
