class ProductVariationsModel {
  int? id;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  List<ProductVariationsAttributesModel>? attributes;

  ProductVariationsModel({
    this.id,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.attributes,
  });

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
            : null,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'sku': sku,
        'price': price,
        'regular_price': regularPrice,
        'sale_price': salePrice,
        'attributes': attributes != null
            ? attributes!.map((_element) => _element.toJson()).toList()
            : null,
      };
}

class ProductVariationsAttributesModel {
  int? id;
  String? name;
  String? option;

  ProductVariationsAttributesModel({
    this.id,
    this.name,
    this.option,
  });

  factory ProductVariationsAttributesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductVariationsAttributesModel(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null,
        option: json['option'] != null ? json['option'] as String : null,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'option': option,
      };
}
