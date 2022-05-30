import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'mappers.dart';

// ProductModel
extension ProductModelMapper on ProductModel {
  ProductEntity toDomain() {
    final List<ImageProductEntity> _imagesMapped =
        (images.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ImageProductEntity>()
            .toList();
    final List<CategoriesEntity> _categoriesMapped =
        (categories.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<CategoriesEntity>()
            .toList();
    final List<ProductAttributesEntity> _attributesMapped =
        (attributes.map((v) => v.toDomain()) ?? const Iterable.empty())
            .cast<ProductAttributesEntity>()
            .toList();
    final List<int> _relatedIdsMapped =
        (relatedIds.map((v) => v) ?? const Iterable.empty())
            .cast<int>()
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
      variations: variations.toDomain(),
      metaData: _metaDataMapped,
      acf: acf.toDomain(),
    );
  }
}

// ImageProductModel
extension ProductImageModelMapper on ProductImageModel {
  ImageProductEntity toDomain() {
    return ImageProductEntity(
      src: src,
      woocommerceThumbnail: woocommerceThumbnail,
      woocommerceSingle: woocommerceSingle,
      woocommerceGalleryThumbnail: woocommerceGalleryThumbnail,
    );
  }
}

// CategoriesModel
extension ProductCategoriesModelMapper on ProductCategoriesModel {
  CategoriesEntity toDomain() {
    return CategoriesEntity(
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
extension VariableProductModelMapper on ProductVariationsModel {
  ProductVariationsEntity toDomain() {
    final List<ProductVariationsAttributesEntity> _attributesMapped =
        (attributes.map((e) => e.toDomain()) ?? const Iterable.empty())
            .cast<ProductVariationsAttributesEntity>()
            .toList();
    return ProductVariationsEntity(
        id: id,
        sku: sku,
        price: price,
        regularPrice: regularPrice,
        salePrice: salePrice,
        attributes: _attributesMapped);
  }
}

// ACFModel
extension ACFModelMapper on ProductACFModel {
  ACFEntity toDomain() {
    return ACFEntity(
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