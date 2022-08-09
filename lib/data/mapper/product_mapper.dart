import '/data/models/models.dart';
import '/domain/entities/entities.dart';
import 'mappers.dart';

// ProductModel
extension ProductModelMapper on ProductModel {
  ProductEntity toDomain() {
    final List<ProductImageEntity> _imagesMapped =
        (images.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ProductImageEntity>()
            .toList();
    final List<ProductCategoryEntity> _categoriesMapped =
        (categories.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ProductCategoryEntity>()
            .toList();
    final List<ProductAttributesEntity> _attributesMapped =
        (attributes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ProductAttributesEntity>()
            .toList();
    final List<int> _relatedIdsMapped =
        (relatedIds.map((v) => v) ?? const Iterable.empty())
            .cast<int>()
            .toList();
    final List<dynamic> _variationsMapped =
        (variations.map((v) => v) ?? const Iterable.empty())
            .cast<dynamic>()
            .toList();
    final List<MetaDataEntity> _metaDataMapped =
        (metaData.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<MetaDataEntity>()
            .toList();
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      shortDescription: shortDescription,
      type: type,
      status: status,
      sku: sku,
      price: price,
      regularPrice: regularPrice,
      salePrice: salePrice,
      stockStatus: stockStatus,
      images: _imagesMapped,
      categories: _categoriesMapped,
      attributes: _attributesMapped,
      relatedIds: _relatedIdsMapped,
      variations: _variationsMapped,
      metaData: _metaDataMapped,
      acf: acf.toDomain(),
    );
  }
}

// ImageProductModel
extension ProductImageModelMapper on ProductImageModel {
  ProductImageEntity toDomain() {
    return ProductImageEntity(
      src: src,
      woocommerceThumbnail: woocommerceThumbnail,
      woocommerceSingle: woocommerceSingle,
      woocommerceGalleryThumbnail: woocommerceGalleryThumbnail,
    );
  }
}

// CategoriesModel
extension ProductCategoriesModelMapper on ProductCategoriesModel {
  ProductCategoryEntity toDomain() {
    return ProductCategoryEntity(
      id: id,
      name: name,
    );
  }
}

// AttributesModel
extension ProductVariationsAttributesModelMapper
    on ProductVariationsAttributesModel {
  ProductVariationsAttributesEntity toDomain() {
    return ProductVariationsAttributesEntity(
      id: id,
      name: name,
      option: option,
    );
  }
}

// VariableProductModel
extension ProductVariationsModelMapper on ProductVariationsModel {
  ProductVariationsEntity toDomain() {
    // final List<ProductVariationsAttributesEntity> _attributesMapped =
    //     (attributes.map((e) => e.toDomain()) ?? const Iterable.empty())
    //         .cast<ProductVariationsAttributesEntity>()
    //         .toList();
    return ProductVariationsEntity(
        // id: id,
        // sku: sku,
        // price: price,
        // regularPrice: regularPrice,
        // salePrice: salePrice
        //attributes: _attributesMapped
        );
  }
}

// ACFModel
extension ProductACFModelMapper on ProductACFModel {
  ProductACFEntity toDomain() {
    return ProductACFEntity(
      contenance: contenance,
      grossite: grossite,
      superGros: superGros,
      grandeMoyenneSurface: grandeMoyenneSurface,
      hypermarche: hypermarche,
    );
  }
}

extension ProductAttributesModelMapper on ProductAttributesModel {
  ProductAttributesEntity toDomain() {
    final List<String> _optionsMapped =
        (options.map((v) => v) ?? const Iterable.empty())
            .cast<String>()
            .toList();
    return ProductAttributesEntity(
      id: id,
      name: name,
      options: _optionsMapped,
    );
  }
}
