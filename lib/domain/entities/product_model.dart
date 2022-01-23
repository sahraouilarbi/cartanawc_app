import 'package:cartanawc_app/domain/entities/variable_product_model.dart';

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.type,
    this.status,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
    this.images,
    this.categories,
    this.attributes,
    this.relatedIds,
    this.variableProduct,
    this.productMetaData,
    this.acf,
  });
  int id;
  String name;
  String description;
  String shortDescription;
  String type;
  String status;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String stockStatus;
  List<ImageProduct> images;
  List<Categories> categories;
  List<Attributes> attributes;
  List<int> relatedIds;
  VariableProduct variableProduct;
  List<ProductMetaData> productMetaData;
  ACF acf;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    description = json['description'] as String;
    shortDescription = json['short_description'] as String;
    type = json['type'] as String;
    status = json['status'] as String;
    sku = json['sku'] as String;
    price = json['price'] as String;
    regularPrice = json['regular_price'] as String;
    salePrice = json['sale_price'] != ''
        ? json['sale_price'] as String
        : json['regular_price'] as String;
    stockStatus = json['stock_status'] as String;
    relatedIds = json['related_ids'].cast<int>() as List<int>;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['images'] != null) {
      images = <ImageProduct>[];
      json['images'].forEach((v) {
        images.add(ImageProduct.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes.add(Attributes.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['meta_data'] != null) {
      productMetaData = <ProductMetaData>[];
      json['meta_data'].forEach((v) {
        productMetaData
            .add(ProductMetaData.fromJson(v as Map<String, dynamic>));
      });
    }
    acf = (json['acf'] != null)
        ? ACF.fromJson(json['acf'] as Map<String, dynamic>)
        : null;
  }
}

class ImageProduct {
  ImageProduct({
    this.src,
    this.woocommerceThumbnail,
    this.woocommerceSingle,
    this.woocommerceGalleryThumbnail,
  });
  String src;
  String woocommerceThumbnail;
  String woocommerceSingle;
  String woocommerceGalleryThumbnail;
  ImageProduct.fromJson(Map<String, dynamic> json) {
    src = json['src'] as String;
    woocommerceThumbnail = json['woocommerce_thumbnail'] as String;
    woocommerceSingle = json['woocommerce_single'] as String;
    woocommerceGalleryThumbnail =
        json['woocommerce_gallery_thumbnail'] as String;
  }
}

class Categories {
  Categories({this.id, this.name});
  int id;
  String name;
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Attributes {
  Attributes({this.id, this.name, this.options});
  int id;
  String name;
  List<String> options;
  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    options = json['option'].cast<String>() as List<String>;
  }
}

class ProductMetaData {
  ProductMetaData({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
  ProductMetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    key = json['key'] as String;
    value = json['value'] as String;
  }
}

class ACF {
  ACF({
    this.contenance,
    this.grossite,
    this.superGros,
    this.grandeMoyenneSurface,
    this.hypermarche,
  });
  String contenance;
  String grossite;
  String superGros;
  String grandeMoyenneSurface;
  String hypermarche;

  ACF.fromJson(Map<String, dynamic> json) {
    contenance = json['contenance'] as String;
    grossite = json['grossite'] as String;
    superGros = json['super_gros'] as String;
    grandeMoyenneSurface = json['grande_moyenne_surface'] as String;
    hypermarche = json['hypermarche'] as String;
  }
}
