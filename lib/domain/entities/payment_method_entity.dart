class PaymentGatewaysEntity {
  PaymentGatewaysEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.enabled,
    required this.methodTitle,
    required this.methodDescription,
    required this.methodSupports,
    this.settings,
    required this.links,
  });

  String id;
  String title;
  String description;
  int order;
  bool enabled;
  String methodTitle;
  String methodDescription;
  List<String> methodSupports;
  Map<String, PaymentGatewaysSettingEntity>? settings;
  PaymentGatewaysLinksEntity links;
}

class PaymentGatewaysLinksEntity {
  PaymentGatewaysLinksEntity({
    required this.self,
    required this.collection,
  });

  List<PaymentGatewaysCollectionEntity> self;
  List<PaymentGatewaysCollectionEntity> collection;
}

class PaymentGatewaysCollectionEntity {
  PaymentGatewaysCollectionEntity({
    required this.href,
  });

  String href;
}

class PaymentGatewaysSettingEntity {
  PaymentGatewaysSettingEntity({
    required this.id,
    required this.label,
    required this.description,
    required this.type,
    required this.value,
    required this.settingDefault,
    required this.tip,
    this.placeholder,
    required this.options,
  });

  String id;
  String label;
  String description;
  String type;
  String value;
  String settingDefault;
  String tip;
  PaymentGatewaysEntityPlaceholder? placeholder;
  PaymentGatewaysSettingsOptionsEntity options;
}

class PaymentGatewaysSettingsOptionsEntity {
  PaymentGatewaysSettingsOptionsEntity({
    required this.forfait,
    required this.livraisonGratuite,
    required this.pointDeVente,
    required this.sale,
    required this.authorization,
  });

  PaymentGatewaysForfaitEntity forfait;
  PaymentGatewaysLivraisonGratuiteEntity livraisonGratuite;
  PaymentGatewaysPointDeVenteEntity pointDeVente;
  String sale;
  String authorization;
}

class PaymentGatewaysForfaitEntity {
  PaymentGatewaysForfaitEntity({
    required this.flatRate,
  });

  String flatRate;
}

class PaymentGatewaysLivraisonGratuiteEntity {
  PaymentGatewaysLivraisonGratuiteEntity({
    required this.freeShipping,
    required this.freeShipping1,
  });

  String freeShipping;
  String freeShipping1;
}

class PaymentGatewaysPointDeVenteEntity {
  PaymentGatewaysPointDeVenteEntity({
    required this.localPickup,
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
  Map<T, String>? reverseMap;

  PaymentGatewaysEnumValuesEntity(this.map);
}
