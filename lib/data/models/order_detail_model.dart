import 'package:cartanawc_app/data/models/shipping_model.dart';

class OrderDetailModel {
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
  int orderId;
  String orderNumber;
  String paymentMethod;
  String orderStatus;
  DateTime orderDate;
  ShippingModel shipping;
  List<LineItemsModel> lineItems;
  double totalAmount;
  double shippingTotal;
  double itemTotalAmount;
  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'] as int;
    orderNumber = json['order_key'] as String;
    paymentMethod = json['payment_method'] as String;
    orderStatus = json['status'] as String;
    orderDate = DateTime.parse(json['date_created'] as String);
    shipping = json['shipping'] != null
        ? ShippingModel.fromJson(json['shipping'] as Map<String, dynamic>)
        : null;
    if (json['line_items'] != null) {
      lineItems = <LineItemsModel>[];
      json['line_items'].forEach((element) {
        lineItems.add(LineItemsModel.fromJson(element as Map<String, dynamic>));
      });
      //TODO PEUT ETRE PLACER itemTotalAmount ICI
    }
    totalAmount = double.parse(json['total'] as String);
    shippingTotal = double.parse(json['shipping_total'] as String);
    //TODO A VERIFIER
    itemTotalAmount = lineItems != null
        ? lineItems
            .map<double>((e) => e.totalAmount)
            .reduce((value, element) => value + element)
        : 0;
  }
}

class LineItemsModel {
  LineItemsModel({
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
  LineItemsModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] as int;
    productName = json['name'] as String;
    quantity = json['quantity'] as int;
    variationId = json['variation_id'] as int;
    totalAmount = double.parse(json['total'] as String);
  }
}
