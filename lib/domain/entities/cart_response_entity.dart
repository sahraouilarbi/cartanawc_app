class CartResponseEntity {
  CartResponseEntity({
    this.status,
    this.data,
  });
  bool status;
  List<CartItemEntity> data;
  int userId;
}

class CartItemEntity {
  CartItemEntity({
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
}
