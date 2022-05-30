class CategoryModel {
  int categoryId;
  String categoryName;
  String categorySlug;
  int categoryParent;
  String categoryDisplay;
  String categoryDescription;
  CategoryImageModel categoryImage;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categorySlug,
    this.categoryParent,
    this.categoryDisplay,
    this.categoryDescription,
    this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json['id'] != null ? json['id'] as int : null,
        categoryName: json['name'] != null ? json['name'] as String : null,
        categorySlug: json['slug'] != null ? json['slug'] as String : null,
        categoryParent: json['parent'] != null ? json['parent'] as int : null,
        categoryDisplay:
            json['display'] != null ? json['display'] as String : null,
        categoryDescription:
            json['description'] != null ? json['description'] as String : null,
        categoryImage: json['image'] != null
            ? CategoryImageModel.fromJson(json['image'] as Map<String, dynamic>)
            : null,
      );
}

class CategoryImageModel {
  String src;

  CategoryImageModel({this.src});

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      CategoryImageModel(
        src: json['src'] != null ? json['src'] as String : null,
      );
}
