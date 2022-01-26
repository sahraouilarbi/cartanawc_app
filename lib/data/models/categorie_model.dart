class CategorieModel {
  CategorieModel(
    this.categorieId,
    this.categorieName,
    this.categorieSlug,
    this.categorieParent,
    this.categorieDescription,
    this.categorieImage,
  );
  int categorieId;
  String categorieName;
  String categorieSlug;
  int categorieParent;
  String categorieDisplay;
  String categorieDescription;
  CategorieImageModel categorieImage;

  CategorieModel.fromJson(Map<String, dynamic> json) {
    categorieId = json['id'] as int;
    categorieName = json['name'] as String;
    categorieSlug = json['slug'] as String;
    categorieParent = json['parent'] as int;
    categorieDisplay = json['display'] as String;
    categorieDescription = json['description'] as String;
    categorieImage = json['image'] != null
        ? CategorieImageModel.fromJson(json['image'] as Map<String, dynamic>)
        : null;
  }
}

class CategorieImageModel {
  CategorieImageModel({this.src});
  String src;
  CategorieImageModel.fromJson(Map<String, dynamic> json) {
    src = json['src'] as String;
  }
}
