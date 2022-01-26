class CartRequestEntity {
  CartRequestEntity({this.userId, this.products});
  int userId;
  List<CartProductsEntity> products;
}

class CartProductsEntity {
  CartProductsEntity({
    this.productId,
    this.variationId,
    this.quantity,
    this.productStep,
  });
  int productId;
  int variationId = 0;
  int quantity;
  String productStep;
}
