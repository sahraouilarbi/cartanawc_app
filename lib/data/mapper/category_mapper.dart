import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

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
