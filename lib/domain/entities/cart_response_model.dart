class CartResponseModel {
  CartResponseModel({
    this.status,
    this.data,
  });
  bool status;
  List<CartItem> data;
  int userId;
  CartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    if (json['data'] != null) {
      data = <CartItem>[];
      json['data'].forEach((item) {
        data.add(CartItem.fromJson(item as Map<String, dynamic>));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  CartItem({
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

  int productId;
  String productName;
  String productRegularPrice;
  String productSalePrice;
  String thumbnail;
  int qty;
  String productStep;
  double lineSubtotal;
  double lineTotal;
  int variationId;
  String attribute;
  String attributeValue;

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] as int;
    productName = json['product_name'] as String;
    productRegularPrice = json['product_regular_price'] as String;
    productSalePrice = json['product_sale_price'] as String;
    thumbnail = json['thumbnail'] as String;
    qty = json['qty'] as int;
    productStep = json['product_step'] as String;
    lineSubtotal = json['line_subtotal'] != null
        ? double.parse(json['line_subtotal'].toString())
        : 0.0;
    lineTotal = json['line_total'] != null
        ? double.parse(json['line_total'].toString())
        : 0.0;
    variationId = json['variation_id'] as int;
    if (json['attribute'] != null) {
      attribute = (json['attribute'].toString() != "[]")
          ? Map<String, dynamic>.from(json['attribute'] as Map<String, dynamic>)
              .keys
              .first
              .toString()
          : '';
      attributeValue = (json['attribute'].toString() != "[]")
          ? Map<String, dynamic>.from(json['attribute'] as Map<String, dynamic>)
              .values
              .first
              .toString()
          : '';
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_regular_price'] = productRegularPrice;
    data['product_sale_price'] = productSalePrice;
    data['thumbnail'] = thumbnail;
    data['qty'] = qty;
    data['product_step'] = productStep;
    data['line_subtotal'] = lineSubtotal;
    data['line_total'] = lineTotal;
    data['variation_id'] = variationId;

    return data;
  }
}
