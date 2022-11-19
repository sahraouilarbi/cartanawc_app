import '/core/extensions.dart';

class CartResponseModel {
  bool? status;
  List<CartItemModel>? data;
  int? userId;

  CartResponseModel({
    this.status,
    this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        status: json['status'] != null ? json['status'] as bool : null,
        data: json['data'] != null
            ? List<CartItemModel>.from((json['data'] as List<dynamic>)
                .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)))
            : <CartItemModel>[],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItemModel {
  int? productId;
  String? productName;
  String? productRegularPrice;
  String? productSalePrice;
  String? thumbnail;
  int? qty;
  String? productStep;
  double? lineSubtotal;
  double? lineTotal;
  int? variationId;
  String? attribute;
  String? attributeValue;

  CartItemModel({
    this.productId,
    this.productName,
    this.productRegularPrice,
    this.productSalePrice,
    this.thumbnail,
    this.qty,
    this.productStep,
    this.lineSubtotal,
    this.lineTotal,
    this.variationId,
    this.attribute,
    this.attributeValue,
  });
  CartItemModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] != null ? json['product_id'] as int : null;
    productName =
        json['product_name'] != null ? json['product_name'] as String : null;
    productRegularPrice = json['product_regular_price'] != null
        ? json['product_regular_price'] as String
        : null;
    productSalePrice = json['product_sale_price'] != null
        ? json['product_sale_price'] as String
        : null;
    thumbnail = json['thumbnail'] != null ? json['thumbnail'] as String : null;
    qty = json['qty'] != null ? json['qty'] as int : null;
    productStep =
        json['product_step'] != null ? json['product_step'] as String : '1';
    lineSubtotal = json['line_subtotal'] != null
        ? double.parse(json['line_subtotal'].toString())
        : 0.0;
    lineTotal = json['line_total'] != null
        ? double.parse(json['line_total'].toString())
        : 0.0;
    variationId =
        json['variation_id'] != null ? json['variation_id'] as int : null;

    if (json['attribute'] != null) {
      attribute = (json['attribute'].toString() != "[]")
          ? Map<String, dynamic>.from(json['attribute'] as Map<String, dynamic>)
              .keys
              .first
              .toString()
          : kEMPTY;
      attributeValue = (json['attribute'].toString() != "[]")
          ? Map<String, dynamic>.from(json['attribute'] as Map<String, dynamic>)
              .values
              .first
              .toString()
          : kEMPTY;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_regular_price'] = productRegularPrice;
    _data['product_sale_price'] = productSalePrice;
    _data['thumbnail'] = thumbnail;
    _data['qty'] = qty;
    _data['product_step'] = productStep;
    _data['line_subtotal'] = lineSubtotal;
    _data['line_total'] = lineTotal;
    _data['variation_id'] = variationId;

    return _data;
  }
}
