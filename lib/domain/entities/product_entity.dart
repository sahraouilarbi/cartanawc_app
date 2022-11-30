import 'package:cartanawc_app/domain/entities/entities.dart';

class ProductEntity {
  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.type,
    required this.status,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.stockStatus,
    required this.images,
    required this.categories,
    required this.attributes,
    required this.relatedIds,
    required this.variations,
    required this.metaData,
    required this.acf,
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
  List<ProductImageEntity> images;
  List<ProductCategoryEntity> categories;
  List<ProductAttributesEntity> attributes;
  List<int> relatedIds;
  List<dynamic> variations;
  List<MetaDataEntity> metaData;
  ProductACFEntity acf;
}

class ProductImageEntity {
  ProductImageEntity({
    required this.src,
    required this.woocommerceThumbnail,
    required this.woocommerceSingle,
    required this.woocommerceGalleryThumbnail,
  });
  String src;
  String woocommerceThumbnail;
  String woocommerceSingle;
  String woocommerceGalleryThumbnail;
}

class ProductCategoryEntity {
  ProductCategoryEntity({required this.id, required this.name});
  int id;
  String name;
}

class ProductACFEntity {
  ProductACFEntity({
    required this.contenance,
    required this.grossite,
    required this.superGros,
    required this.grandeMoyenneSurface,
    required this.hypermarche,
  });
  String contenance;
  String grossite;
  String superGros;
  String grandeMoyenneSurface;
  String hypermarche;
}

class ProductAttributesEntity {
  int id;
  String name;
  List<dynamic> options;
  ProductAttributesEntity({
    required this.id,
    required this.name,
    required this.options,
  });
}
