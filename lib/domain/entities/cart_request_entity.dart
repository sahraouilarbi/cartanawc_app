class CartRequestEntity {
  CartRequestEntity({required this.userId, required this.products});
  int userId;
  List<CartProductsEntity> products;
}

class CartProductsEntity {
  CartProductsEntity({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.productStep,
  });
  int productId;
  int variationId = 0;
  int quantity;
  String productStep;
}
