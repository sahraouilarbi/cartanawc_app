class CategoryModel {
  CategoryModel(
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
  CategoryImageModel categoryImage;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'] as int;
    categoryName = json['name'] as String;
    categorySlug = json['slug'] as String;
    categoryParent = json['parent'] as int;
    categoryDisplay = json['display'] as String;
    categoryDescription = json['description'] as String;
    categoryImage = json['image'] != null
        ? CategoryImageModel.fromJson(json['image'] as Map<String, dynamic>)
        : null;
  }
}

class CategoryImageModel {
  CategoryImageModel({this.src});
  String src;
  CategoryImageModel.fromJson(Map<String, dynamic> json) {
    src = json['src'] as String;
  }
}
