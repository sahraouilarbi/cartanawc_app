import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/mapper/mappers.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// ProductModel
extension ProductModelMapper on ProductModel? {
  ProductEntity toDomain() {
    final List<ProductImageEntity> _imagesMapped =
        (this?.images?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<ProductImageEntity>()
            .toList();
    final List<ProductCategoryEntity> _categoriesMapped =
        (this?.categories?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<ProductCategoryEntity>()
            .toList();
    final List<ProductAttributesEntity> _attributesMapped =
        (this?.attributes?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<ProductAttributesEntity>()
            .toList();
    final List<int> _relatedIdsMapped =
        (this?.relatedIds?.map((_e) => _e) ?? const Iterable.empty())
            .cast<int>()
            .toList();
    final List<dynamic> _variationsMapped =
        (this?.variations?.map((_e) => _e) ?? const Iterable.empty())
            .cast<dynamic>()
            .toList();
    final List<MetaDataEntity> _metaDataMapped =
        (this?.metaData?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<MetaDataEntity>()
            .toList();
    return ProductEntity(
      id: this?.id?.orZero() ?? kZERO,
      name: this?.name?.orEmpty() ?? kEMPTY,
      description: this?.description?.orEmpty() ?? kEMPTY,
      shortDescription: this?.shortDescription?.orEmpty() ?? kEMPTY,
      type: this?.type?.orEmpty() ?? kEMPTY,
      status: this?.status?.orEmpty() ?? kEMPTY,
      sku: this?.sku?.orEmpty() ?? kEMPTY,
      price: this?.price?.orEmpty() ?? kEMPTY,
      regularPrice: this?.regularPrice?.orEmpty() ?? kEMPTY,
      salePrice: this?.salePrice?.orEmpty() ?? kEMPTY,
      stockStatus: this?.stockStatus?.orEmpty() ?? kEMPTY,
      images: _imagesMapped,
      categories: _categoriesMapped,
      attributes: _attributesMapped,
      relatedIds: _relatedIdsMapped,
      variations: _variationsMapped,
      metaData: _metaDataMapped,
      acf: this!.acf.toDomain(),
    );
  }
}

// ImageProductModel
extension ProductImageModelMapper on ProductImageModel? {
  ProductImageEntity toDomain() {
    return ProductImageEntity(
      src: this?.src?.orEmpty() ?? kEMPTY,
      woocommerceThumbnail: this?.woocommerceThumbnail?.orEmpty() ?? kEMPTY,
      woocommerceSingle: this?.woocommerceSingle?.orEmpty() ?? kEMPTY,
      woocommerceGalleryThumbnail:
          this?.woocommerceGalleryThumbnail?.orEmpty() ?? kEMPTY,
    );
  }
}

// CategoriesModel
extension ProductCategoriesModelMapper on ProductCategoriesModel? {
  ProductCategoryEntity toDomain() {
    return ProductCategoryEntity(
      id: this?.id.orZero() ?? kZERO,
      name: this?.name?.orEmpty() ?? kEMPTY,
    );
  }
}

// AttributesModel
extension ProductVariationsAttributesModelMapper
    on ProductVariationsAttributesModel? {
  ProductVariationsAttributesEntity toDomain() {
    return ProductVariationsAttributesEntity(
      id: this?.id?.orZero() ?? kZERO,
      name: this?.name?.orEmpty() ?? kEMPTY,
      option: this?.option?.orEmpty() ?? kEMPTY,
    );
  }
}

// TODO A COMMENTER EN CAS DE BLOCKAGE
// VariableProductModel
extension ProductVariationsModelMapper on ProductVariationsModel? {
  ProductVariationsEntity toDomain() {
    final List<ProductVariationsAttributesEntity> _attributesMapped =
        (this?.attributes?.map((_e) => _e.toDomain()) ?? const Iterable.empty())
            .cast<ProductVariationsAttributesEntity>()
            .toList();
    return ProductVariationsEntity(
      id: this?.id?.orZero() ?? kZERO,
      sku: this?.sku?.orEmpty() ?? kEMPTY,
      price: this?.price?.orEmpty() ?? kEMPTY,
      regularPrice: this?.regularPrice?.orEmpty() ?? kEMPTY,
      salePrice: this?.salePrice?.orEmpty() ?? kEMPTY,
      attributes: _attributesMapped,
    );
  }
}

// ACFModel
extension ProductACFModelMapper on ProductACFModel? {
  ProductACFEntity toDomain() {
    return ProductACFEntity(
      contenance: this?.contenance?.orEmpty() ?? kEMPTY,
      grossite: this?.grossite?.orEmpty() ?? kEMPTY,
      superGros: this?.superGros?.orEmpty() ?? kEMPTY,
      grandeMoyenneSurface: this?.grandeMoyenneSurface?.orEmpty() ?? kEMPTY,
      hypermarche: this?.hypermarche?.orEmpty() ?? kEMPTY,
    );
  }
}

extension ProductAttributesModelMapper on ProductAttributesModel? {
  ProductAttributesEntity toDomain() {
    final List<String> _optionsMapped =
        (this?.options?.map((_e) => _e) ?? const Iterable.empty())
            .cast<String>()
            .toList();
    return ProductAttributesEntity(
      id: this?.id?.orZero() ?? kZERO,
      name: this?.name?.orEmpty() ?? kEMPTY,
      options: _optionsMapped,
    );
  }
}
