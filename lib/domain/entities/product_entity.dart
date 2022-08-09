import '/domain/entities/entities.dart';

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
    this.variations,
    this.metaData,
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

class ProductCategoryEntity {
  ProductCategoryEntity({this.id, this.name});
  int id;
  String name;
}

class ProductACFEntity {
  ProductACFEntity({
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

class ProductAttributesEntity {
  int id;
  String name;
  List<dynamic> options;
  ProductAttributesEntity({
    this.id,
    this.name,
    this.options,
  });
}
