class CartRequestModel {
  CartRequestModel({this.userId, this.products});
  int userId;
  List<CartProducts> products;
  CartRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] as int;
    if (json['products'] != null) {
      products = <CartProducts>[];
      json['products'].forEach((product) {
        products.add(CartProducts.fromJson(product as Map<String, dynamic>));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    if (products != null) {
      data['products'] = products.map((product) => product.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  CartProducts({
    this.productId,
    this.variationId,
    this.quantity,
    this.productStep,
  });
  int productId;
  int variationId = 0;
  int quantity;
  String productStep;

  CartProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] as int;
    variationId = json['variation_id'] as int;
    quantity = json['quantity'] as int;
    productStep = json['product_step'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['variation_id'] = variationId;
    data['quantity'] = quantity;
    data['product_step'] = productStep;
    return data;
  }
}
