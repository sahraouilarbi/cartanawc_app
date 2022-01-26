import 'package:cartanawc_app/data/models/variable_product_model.dart';
import 'package:cartanawc_app/domain/entities/variable_product_entity.dart';

class ProductEntity {
  ProductEntity({
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
  List<ImageProductEntity> images;
  List<CategoriesEntity> categories;
  List<AttributesModel> attributes;
  List<int> relatedIds;
  VariableProductEntity variableProduct;
  List<ProductMetaDataEntity> productMetaData;
  ACFEntity acf;
}

class ImageProductEntity {
  ImageProductEntity({
    this.src,
    this.woocommerceThumbnail,
    this.woocommerceSingle,
    this.woocommerceGalleryThumbnail,
  });
  String src;
  String woocommerceThumbnail;
  String woocommerceSingle;
  String woocommerceGalleryThumbnail;
}

class CategoriesEntity {
  CategoriesEntity({this.id, this.name});
  int id;
  String name;
}

class AttributesEntity {
  AttributesEntity({this.id, this.name, this.options});
  int id;
  String name;
  List<String> options;
}

class ProductMetaDataEntity {
  ProductMetaDataEntity({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
}

class ACFEntity {
  ACFEntity({
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
}
