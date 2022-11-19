class CartResponseEntity {
  CartResponseEntity({
    required this.status,
    required this.data,
  });
  bool status;
  List<CartItemEntity> data;
  int? userId;
}

class CartItemEntity {
  CartItemEntity({
    required this.productId,
    required this.productName,
    required this.productRegularPrice,
    required this.productSalePrice,
    required this.thumbnail,
    required this.qty,
    required this.productStep,
    required this.lineSubtotal,
    required this.lineTotal,
    required this.variationId,
    required this.attribute,
    required this.attributeValue,
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
}
