class ProductVariationsModel {
  ProductVariationsModel({
    this.id,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.attributes,
  });
  int? id;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  List<ProductVariationsAttributesModel>? attributes;

  factory ProductVariationsModel.fromJson(Map<String, dynamic> json) =>
      ProductVariationsModel(
        id: json['id'] != null ? json['id'] as int : null,
        sku: json['sku'] != null ? json['sku'] as String : null,
        price: json['price'] != null ? json['price'] as String : null,
        regularPrice: json['regular_price'] as String,
        salePrice: json['sale_price'] as String,
        attributes: json['attributes'] != null
            ? List<ProductVariationsAttributesModel>.from(
                (json['attributes'] as List<dynamic>).map(
                  (e) => ProductVariationsAttributesModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                ),
              )
            : <ProductVariationsAttributesModel>[],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['price'] = price;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    if (attributes != null) {
      data['attributes'] =
          attributes!.map((element) => element.toJson()).toList();
    }
    return data;
  }
}

class ProductVariationsAttributesModel {
  ProductVariationsAttributesModel({
    this.id,
    this.name,
    this.option,
  });
  int? id;
  String? name;
  String? option;
  factory ProductVariationsAttributesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductVariationsAttributesModel(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null,
        option: json['option'] != null ? json['option'] as String : null,
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['option'] = option;
    return data;
  }
}
