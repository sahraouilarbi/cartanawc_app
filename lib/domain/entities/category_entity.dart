class CategoryEntity {
  CategoryEntity(
    this.categoryId,
    this.categoryName,
    this.categorySlug,
    this.categoryParent,
    this.categoryDescription,
    this.categoryImage,
  );
  int categoryId;
  String categoryName;
  String categorySlug;
  int categoryParent;
  String categoryDisplay;
  String categoryDescription;
  CategoryImageEntity categoryImage;
}

class CategoryImageEntity {
  CategoryImageEntity({this.src});
  String src;
}
