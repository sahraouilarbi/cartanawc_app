import '/core/extensions.dart';
import '/data/models/models.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? shortDescription;
  String? type;
  String? status;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? stockStatus;
  List<ProductImageModel>? images;
  List<ProductCategoriesModel>? categories;
  List<ProductAttributesModel>? attributes;
  List<int>? relatedIds;
  List<dynamic>? variations;
  List<MetaDataModel>? metaData;
  ProductACFModel? acf;

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
    this.variations,
    this.metaData,
    this.acf,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null,
        description:
            json['description'] != null ? json['description'] as String : null,
        shortDescription: json['short_description'] != null
            ? json['short_description'] as String
            : null,
        type: json['type'] != null ? json['type'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        sku: json['sku'] != null ? json['sku'] as String : null,
        price: json['price'] != null ? json['price'] as String : null,
        regularPrice: json['regular_price'] != null
            ? json['regular_price'] as String
            : null,
        salePrice: json['sale_price'] != kEMPTY
            ? json['sale_price'] as String
            : json['regular_price'] as String,
        stockStatus: json['stock_status'] != null
            ? json['stock_status'] as String
            : null,
        images: json['images'] != null
            ? List<ProductImageModel>.from((json['images'] as List<dynamic>)
                .map((e) =>
                    ProductImageModel.fromJson(e as Map<String, dynamic>)))
            : <ProductImageModel>[],
        categories: json['categories'] != null
            ? List<ProductCategoriesModel>.from(
                (json['categories'] as List<dynamic>).map((e) =>
                    ProductCategoriesModel.fromJson(e as Map<String, dynamic>)))
            : <ProductCategoriesModel>[],
        attributes: json['attributes'] != null || json['attributes'].length == 0
            ? List<ProductAttributesModel>.from(
                (json['attributes'] as List<dynamic>).map((e) =>
                    ProductAttributesModel.fromJson(e as Map<String, dynamic>)))
            : <ProductAttributesModel>[],
        relatedIds: json['related_ids'] != null
            ? List<int>.from(
                (json['related_ids'] as List<dynamic>).map((e) => e))
            : <int>[],
        variations: json['variations'] != null
            ? List<dynamic>.from(
                (json['variations'] as List<dynamic>).map((e) => e))
            : <dynamic>[],
        metaData: json['meta_data'] != null
            ? List<MetaDataModel>.from((json['meta_data'] as List<dynamic>)
                .map((e) => MetaDataModel.fromJson(e as Map<String, dynamic>)))
            : <MetaDataModel>[],
        acf: (json['acf'] != null)
            ? ProductACFModel.fromJson(json['acf'] as Map<String, dynamic>)
            : null,
      );

  @override
  String toString() {
    return """
ProductModel :
    id: ${id.toString()}
    name:$name
    description: $description
    shortDescription: $shortDescription
    type: $type
    status: $status
    sku: $sku
    price: $price
    regularPrice: $regularPrice
    salePrice: $salePrice
    stockStatus: $stockStatus
    relatedIds: ${relatedIds.toString()}
    categories: ${categories.toString()}
    images: ${images.toString()}
    metaData:${metaData.toString()}
    acf: ${acf.toString()}
    """;
  }
}

class ProductImageModel {
  String? src;
  String? woocommerceThumbnail;
  String? woocommerceSingle;
  String? woocommerceGalleryThumbnail;

  ProductImageModel({
    this.src,
    this.woocommerceThumbnail,
    this.woocommerceSingle,
    this.woocommerceGalleryThumbnail,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
        src: json['src'] != null
            ? json['src'] as String
            : "assets/images/no_image_placeholder.png",
        woocommerceThumbnail: json['woocommerce_thumbnail'] != null
            ? json['woocommerce_thumbnail'] as String
            : "assets/images/no_image_placeholder.png",
        woocommerceSingle: json['woocommerce_single'] != null
            ? json['woocommerce_single'] as String
            : "assets/images/no_image_placeholder.png",
        woocommerceGalleryThumbnail:
            json['woocommerce_gallery_thumbnail'] != null
                ? json['woocommerce_gallery_thumbnail'] as String
                : "assets/images/no_image_placeholder.png",
      );
  @override
  String toString() {
    return """
ProductImageModel:
 src: $src
  woocommerceThumbnail: $woocommerceThumbnail
  woocommerceSingle: $woocommerceSingle
  woocommerceGalleryThumbnail: $woocommerceGalleryThumbnail
""";
  }
}

class ProductCategoriesModel {
  ProductCategoriesModel({this.id, this.name});
  int? id;
  String? name;
  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesModel(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductAttributesModel {
  ProductAttributesModel({this.id, this.name, this.options});
  int? id;
  String? name;
  List<dynamic>? options;
  factory ProductAttributesModel.fromJson(Map<String, dynamic> json) =>
      ProductAttributesModel(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null,
        options: json['option'] != null
            ? List<dynamic>.from(
                (json['option'] as List<dynamic>).map((e) => e))
            : <dynamic>[],
      );
}

class ProductACFModel {
  ProductACFModel({
    this.contenance,
    this.grossite,
    this.superGros,
    this.grandeMoyenneSurface,
    this.hypermarche,
  });
  String? contenance;
  String? grossite;
  String? superGros;
  String? grandeMoyenneSurface;
  String? hypermarche;

  factory ProductACFModel.fromJson(Map<String, dynamic> json) =>
      ProductACFModel(
        contenance:
            json['contenance'] != null ? json['contenance'] as String : null,
        grossite: json['grossite'] != null ? json['grossite'] as String : null,
        superGros:
            json['super_gros'] != null ? json['super_gros'] as String : null,
        grandeMoyenneSurface: json['grande_moyenne_surface'] != null
            ? json['grande_moyenne_surface'] as String
            : null,
        hypermarche:
            json['hypermarche'] != null ? json['hypermarche'] as String : null,
      );
}
