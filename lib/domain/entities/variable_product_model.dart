class VariableProduct {
  VariableProduct({
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
  List<Attributes> attributes;

  VariableProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    sku = json['sku'] as String;
    price = json['price'] as String;
    regularPrice = json['regular_price'] as String;
    salePrice = json['sale_price'] as String;
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((element) {
        attributes.add(Attributes.fromJson(element as Map<String, dynamic>));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['price'] = price;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    if (attributes != null) {
      data['attributes'] =
          attributes.map((element) => element.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  Attributes({
    this.id,
    this.name,
    this.option,
  });
  int id;
  String name;
  String option;
  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    option = json['option'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['option'] = option;
    return data;
  }
}
