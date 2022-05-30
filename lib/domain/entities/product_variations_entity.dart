class ProductVariationsEntity {
  ProductVariationsEntity({
    this.id,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.attributes,
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
    this.id,
    this.name,
    this.option,
  });
  int id;
  String name;
  String option;
}
