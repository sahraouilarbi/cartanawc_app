class ProductVariationsEntity {
  ProductVariationsEntity({
    required this.id,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.attributes,
  });
  int id;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  List<ProductVariationsAttributesEntity> attributes;
}

class ProductVariationsAttributesEntity {
  ProductVariationsAttributesEntity({
    required this.id,
    required this.name,
    required this.option,
  });
  int id;
  String name;
  String option;
}
