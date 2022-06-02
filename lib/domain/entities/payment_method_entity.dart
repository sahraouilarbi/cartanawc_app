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
  Map<String, PaymentGatewaysSettingEntity> settings;
  PaymentGatewaysLinksEntity links;
}

class PaymentGatewaysLinksEntity {
  PaymentGatewaysLinksEntity({
    this.self,
    this.collection,
  });

  List<PaymentGatewaysCollectionEntity> self;
  List<PaymentGatewaysCollectionEntity> collection;
}

class PaymentGatewaysCollectionEntity {
  PaymentGatewaysCollectionEntity({
    this.href,
  });

  String href;
}

class PaymentGatewaysSettingEntity {
  PaymentGatewaysSettingEntity({
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
  PaymentGatewaysSettingsOptionsEntity options;
}

class PaymentGatewaysSettingsOptionsEntity {
  PaymentGatewaysSettingsOptionsEntity({
    this.forfait,
    this.livraisonGratuite,
    this.pointDeVente,
    this.sale,
    this.authorization,
  });

  PaymentGatewaysForfaitEntity forfait;
  PaymentGatewaysLivraisonGratuiteEntity livraisonGratuite;
  PaymentGatewaysPointDeVenteEntity pointDeVente;
  String sale;
  String authorization;
}

class PaymentGatewaysForfaitEntity {
  PaymentGatewaysForfaitEntity({
    this.flatRate,
  });

  String flatRate;
}

class PaymentGatewaysLivraisonGratuiteEntity {
  PaymentGatewaysLivraisonGratuiteEntity({
    this.freeShipping,
    this.freeShipping1,
  });

  String freeShipping;
  String freeShipping1;
}

class PaymentGatewaysPointDeVenteEntity {
  PaymentGatewaysPointDeVenteEntity({
    this.localPickup,
  });

  String localPickup;
}

enum PaymentGatewaysEntityPlaceholder { empty, optionnel, youYourEmailCom }

final placeholderValues = PaymentGatewaysEnumValuesEntity({
  "": PaymentGatewaysEntityPlaceholder.empty,
  "Optionnel": PaymentGatewaysEntityPlaceholder.optionnel,
  "you@youremail.com": PaymentGatewaysEntityPlaceholder.youYourEmailCom
});

class PaymentGatewaysEnumValuesEntity<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  PaymentGatewaysEnumValuesEntity(this.map);
}
