import 'package:cartanawc_app/data/models/variable_product_model.dart';

class ProductModel {
  ProductModel({
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
  List<ImageProductModel> images;
  List<CategoriesModel> categories;
  List<AttributesModel> attributes;
  List<int> relatedIds;
  VariableProductModel variableProduct;
  List<ProductMetaDataModel> productMetaData;
  ACFModel acf;

  ProductModel.fromJson(Map<String, dynamic> json) {
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
      categories = <CategoriesModel>[];
      json['categories'].forEach((v) {
        categories.add(CategoriesModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['images'] != null) {
      images = <ImageProductModel>[];
      json['images'].forEach((v) {
        images.add(ImageProductModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['attributes'] != null) {
      attributes = <AttributesModel>[];
      json['attributes'].forEach((v) {
        attributes.add(AttributesModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['meta_data'] != null) {
      productMetaData = <ProductMetaDataModel>[];
      json['meta_data'].forEach((v) {
        productMetaData
            .add(ProductMetaDataModel.fromJson(v as Map<String, dynamic>));
      });
    }
    acf = (json['acf'] != null)
        ? ACFModel.fromJson(json['acf'] as Map<String, dynamic>)
        : null;
  }
}

class ImageProductModel {
  ImageProductModel({
    this.src,
    this.woocommerceThumbnail,
    this.woocommerceSingle,
    this.woocommerceGalleryThumbnail,
  });
  String src;
  String woocommerceThumbnail;
  String woocommerceSingle;
  String woocommerceGalleryThumbnail;
  ImageProductModel.fromJson(Map<String, dynamic> json) {
    src = json['src'] as String;
    woocommerceThumbnail = json['woocommerce_thumbnail'] as String;
    woocommerceSingle = json['woocommerce_single'] as String;
    woocommerceGalleryThumbnail =
        json['woocommerce_gallery_thumbnail'] as String;
  }
}

class CategoriesModel {
  CategoriesModel({this.id, this.name});
  int id;
  String name;
  CategoriesModel.fromJson(Map<String, dynamic> json) {
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

class AttributesModel {
  AttributesModel({this.id, this.name, this.options});
  int id;
  String name;
  List<String> options;
  AttributesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    options = json['option'].cast<String>() as List<String>;
  }
}

class ProductMetaDataModel {
  ProductMetaDataModel({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
  ProductMetaDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    key = json['key'] as String;
    value = json['value'] as String;
  }
}

class ACFModel {
  ACFModel({
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

  ACFModel.fromJson(Map<String, dynamic> json) {
    contenance = json['contenance'] as String;
    grossite = json['grossite'] as String;
    superGros = json['super_gros'] as String;
    grandeMoyenneSurface = json['grande_moyenne_surface'] as String;
    hypermarche = json['hypermarche'] as String;
  }
}
