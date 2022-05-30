class PaymentGatewaysEntity {
  PaymentGatewaysEntity({
    this.id,
    this.title,
    this.description,
    this.order,
    this.enabled,
    this.methodTitle,
    this.methodDescription,
    this.methodSupports,
    this.settings,
    this.links,
  });

  String id;
  String title;
  String description;
  int order;
  bool enabled;
  String methodTitle;
  String methodDescription;
  List<String> methodSupports;
  Map<String, SettingEntity> settings;
  LinksEntity links;
}

class LinksEntity {
  LinksEntity({
    this.self,
    this.collection,
  });

  List<CollectionEntity> self;
  List<CollectionEntity> collection;
}

class CollectionEntity {
  CollectionEntity({
    this.href,
  });

  String href;
}

class SettingEntity {
  SettingEntity({
    this.id,
    this.label,
    this.description,
    this.type,
    this.value,
    this.settingDefault,
    this.tip,
    this.placeholder,
    this.options,
  });

  String id;
  String label;
  String description;
  String type;
  String value;
  String settingDefault;
  String tip;
  PaymentGatewaysEntityPlaceholder placeholder;
  SettingsOptionsEntity options;
}

class SettingsOptionsEntity {
  SettingsOptionsEntity({
    this.forfait,
    this.livraisonGratuite,
    this.pointDeVente,
    this.sale,
    this.authorization,
  });

  ForfaitEntity forfait;
  LivraisonGratuiteEntity livraisonGratuite;
  PointDeVenteEntity pointDeVente;
  String sale;
  String authorization;
}

class ForfaitEntity {
  ForfaitEntity({
    this.flatRate,
  });

  String flatRate;
}

class LivraisonGratuiteEntity {
  LivraisonGratuiteEntity({
    this.freeShipping,
    this.freeShipping1,
  });

  String freeShipping;
  String freeShipping1;
}

class PointDeVenteEntity {
  PointDeVenteEntity({
    this.localPickup,
  });

  String localPickup;
}

enum PaymentGatewaysEntityPlaceholder { empty, optionnel, youYourEmailCom }

final placeholderValues = EnumValuesEntity({
  "": PaymentGatewaysEntityPlaceholder.empty,
  "Optionnel": PaymentGatewaysEntityPlaceholder.optionnel,
  "you@youremail.com": PaymentGatewaysEntityPlaceholder.youYourEmailCom
});

class EnumValuesEntity<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValuesEntity(this.map);
}
