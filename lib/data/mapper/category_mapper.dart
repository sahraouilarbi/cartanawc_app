// CategorieModel
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

extension CategorieModelMapper on CategoryModel {
  CategoryEntity toDomain() {
    return CategoryEntity(
      categoryId,
      categoryName,
      categorySlug,
      categoryParent,
      categoryDescription,
      categoryImage.toDomain(),
    );
  }
}

// CategorieImageModel
extension CategorieImageModelMapper on CategoryImageModel {
  CategoryImageEntity toDomain() {
    return CategoryImageEntity(
      src: src,
    );
  }
}
