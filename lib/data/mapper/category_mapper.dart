import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

// CategorieModel
extension CategorieModelMapper on CategoryModel? {
  CategoryEntity toDomain() {
    return CategoryEntity(
      this?.categoryId?.orZero() ?? kZERO,
      this?.categoryName?.orEmpty() ?? kEMPTY,
      this?.categorySlug?.orEmpty() ?? kEMPTY,
      this?.categoryParent?.orZero() ?? kZERO,
      this?.categoryDescription?.orEmpty() ?? kEMPTY,
      this!.categoryImage.toDomain(),
    );
  }
}

// CategorieImageModel
extension CategorieImageModelMapper on CategoryImageModel? {
  CategoryImageEntity toDomain() {
    return CategoryImageEntity(
      src: this?.src?.orEmpty() ?? kEMPTY,
    );
  }
}
