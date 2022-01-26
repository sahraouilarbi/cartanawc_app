class CategorieEntity {
  CategorieEntity(
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
  CategorieImageEntity categorieImage;
}

class CategorieImageEntity {
  CategorieImageEntity({this.src});
  String src;
}
