import 'package:cartanawc_app/data/models/models.dart';

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
  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    // orderId = id
    orderId = json['id'] as int;

    //orderNumber = order_key
    orderNumber = json['order_key'] as String;

    //paymentMethod = payment_method
    paymentMethod = json['payment_method'] as String;

    //orderStatus = status
    orderStatus = json['status'] as String;

    //orderData = date_created
    orderDate = DateTime.parse(json['date_created'] as String);

    //shipping = shipping
    shipping = json['shipping'] != null
        ? ShippingModel.fromJson(json['shipping'] as Map<String, dynamic>)
        : null;

    //lineItems = line_items
    if (json['line_items'] != null) {
      lineItems = <OrderDetailLineItemsModel>[];
      json['line_items'].forEach((element) {
        lineItems!.add(
          OrderDetailLineItemsModel.fromJson(
            element as Map<String, dynamic>,
          ),
        );
      });
      //TODO PEUT ETRE PLACER itemTotalAmount ICI
    }

    //totalAmount = total
    totalAmount = double.parse(json['total'] as String);

    //shippingTotal = shipping_total
    shippingTotal = double.parse(json['shipping_total'] as String);

    //TODO A VERIFIER
    itemTotalAmount = lineItems != null
        ? lineItems!
            .map<double>((e) => e.totalAmount!)
            .reduce((value, element) => value + element)
        : 0;
  }
}

class OrderDetailLineItemsModel {
  OrderDetailLineItemsModel({
    this.productId,
    this.productName,
    this.quantity,
    this.variationId,
    this.totalAmount,
  });
  int? productId;
  String? productName;
  int? quantity;
  int? variationId;
  double? totalAmount;
  OrderDetailLineItemsModel.fromJson(Map<String, dynamic> json) {
    //productId = product_id
    productId = json['product_id'] as int;

    // productName = name
    productName = json['name'] as String;

    // quantity = quantity
    quantity = json['quantity'] as int;

    // variationId = variation_id
    variationId = json['variation_id'] as int;

    //totalAmount = total
    totalAmount = double.parse(json['total'] as String);
  }
}
