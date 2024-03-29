class CartRequestModel {
  CartRequestModel({this.userId, this.products});
  int? userId;
  List<CartProductsModel>? products;

  factory CartRequestModel.fromJson(Map<String, dynamic> json) =>
      CartRequestModel(
        userId: json['user_id'] != null ? json['user_id'] as int : null,
        products: json['products'] != null
            ? List<CartProductsModel>.from(
                (json['products'] as List<dynamic>).map(
                  (e) => CartProductsModel.fromJson(e as Map<String, dynamic>),
                ),
              )
            : <CartProductsModel>[],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'products': products != null
            ? products!.map((_product) => _product.toJson()).toList()
            : null,
      };
}

class CartProductsModel {
  CartProductsModel({
    this.productId,
    this.variationId,
    this.quantity,
    this.productStep,
  });
  int? productId;
  int? variationId = 0;
  int? quantity;
  String? productStep;

  factory CartProductsModel.fromJson(Map<String, dynamic> json) =>
      CartProductsModel(
        productId:
            json['product_id'] != null ? json['product_id'] as int : null,
        variationId:
            json['variation_id'] != null ? json['variation_id'] as int : null,
        quantity: json['quantity'] != null ? json['quantity'] as int : null,
        productStep: json['product_step'] != null
            ? json['product_step'] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'variation_id': variationId,
        'quantity': quantity,
        'product_step': productStep,
      };
}
