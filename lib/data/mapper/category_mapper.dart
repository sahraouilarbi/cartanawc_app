// CategorieModel
import '../../domain/entities/entities.dart';
import '../models/models.dart';

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
