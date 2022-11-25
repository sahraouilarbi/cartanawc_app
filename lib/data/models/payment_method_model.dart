// To parse this JSON data, do
//
//     final paymentGateways = paymentGatewaysFromJson(jsonString);

import 'dart:convert';

List<PaymentGatewaysModel> paymentGatewaysFromJson(String str) =>
    List<PaymentGatewaysModel>.from(
      json.decode(str).map(
            (x) => PaymentGatewaysModel.fromJson(x as Map<String, dynamic>),
          ) as List,
    );

String paymentGatewaysToJson(List<PaymentGatewaysModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentGatewaysModel {
  PaymentGatewaysModel({
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

  String? id;
  String? title;
  String? description;
  int? order;
  bool? enabled;
  String? methodTitle;
  String? methodDescription;
  List<String>? methodSupports;
  Map<String, SettingModel>? settings;
  LinksModel? links;

  factory PaymentGatewaysModel.fromJson(Map<String, dynamic> json) =>
      PaymentGatewaysModel(
        id: json["id"] as String,
        title: json["title"] as String,
        description: json["description"] as String,
        order: json["order"] as int,
        enabled: json["enabled"] as bool,
        methodTitle: json["method_title"] as String,
        methodDescription: json["method_description"] as String,
        methodSupports:
            List<String>.from((json["method_supports"] as List).map((x) => x)),
        settings: Map.from(json["settings"] as Map<String, dynamic>).map(
          (k, v) => MapEntry<String, SettingModel>(
            k as String,
            SettingModel.fromJson(v as Map<String, dynamic>),
          ),
        ),
        links: LinksModel.fromJson(json["_links"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "order": order,
        "enabled": enabled,
        "method_title": methodTitle,
        "method_description": methodDescription,
        "method_supports": List<dynamic>.from(methodSupports!.map((x) => x)),
        "settings": Map.from(settings!)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v.toJson())),
        "_links": links!.toJson(),
      };
}

class LinksModel {
  LinksModel({
    this.self,
    this.collection,
  });

  List<CollectionModel>? self;
  List<CollectionModel>? collection;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        self: List<CollectionModel>.from(
          (json["self"] as List)
              .map((x) => CollectionModel.fromJson(x as Map<String, dynamic>)),
        ),
        collection: List<CollectionModel>.from(
          (json["collection"] as List)
              .map((x) => CollectionModel.fromJson(x as Map<String, dynamic>)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class CollectionModel {
  CollectionModel({
    this.href,
  });

  String? href;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        href: json["href"] as String,
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class SettingModel {
  SettingModel({
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

  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? settingDefault;
  String? tip;
  PaymentGatewaysModelPlaceholder? placeholder;
  SettingsOptionsModel? options;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"] as String,
        label: json["label"] as String,
        description: json["description"] as String,
        type: json["type"] as String,
        value: json["value"] as String,
        settingDefault: json["default"] as String,
        tip: json["tip"] as String,
        placeholder: placeholderValues.map[json["placeholder"]],
        options: json["options"] == null
            ? null
            : SettingsOptionsModel.fromJson(
                json["options"] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
        "type": type,
        "value": value,
        "default": settingDefault,
        "tip": tip,
        "placeholder": placeholderValues.reverse[placeholder],
        "options": options?.toJson(),
      };
}

class SettingsOptionsModel {
  SettingsOptionsModel({
    this.forfait,
    this.livraisonGratuite,
    this.pointDeVente,
    this.sale,
    this.authorization,
  });

  ForfaitModel? forfait;
  LivraisonGratuiteModel? livraisonGratuite;
  PointDeVenteModel? pointDeVente;
  String? sale;
  String? authorization;

  factory SettingsOptionsModel.fromJson(Map<String, dynamic> json) =>
      SettingsOptionsModel(
        forfait: json["Forfait"] == null
            ? null
            : ForfaitModel.fromJson(json["Forfait"] as Map<String, dynamic>),
        livraisonGratuite: json["Livraison gratuite"] == null
            ? null
            : LivraisonGratuiteModel.fromJson(
                json["Livraison gratuite"] as Map<String, dynamic>,
              ),
        pointDeVente: json["Point de vente"] == null
            ? null
            : PointDeVenteModel.fromJson(
                json["Point de vente"] as Map<String, dynamic>,
              ),
        sale: json["sale"] == null ? null : json["sale"] as String,
        authorization: json["authorization"] == null
            ? null
            : json["authorization"] as String,
      );

  Map<String, dynamic> toJson() => {
        "Forfait": forfait?.toJson(),
        "Livraison gratuite": livraisonGratuite?.toJson(),
        "Point de vente": pointDeVente?.toJson(),

        //"sale": sale == null ? null : sale,
        "sale": sale,

        //"authorization": authorization == null ? null : authorization,
        "authorization": authorization,
      };
}

class ForfaitModel {
  String? flatRate;

  ForfaitModel({
    this.flatRate,
  });

  factory ForfaitModel.fromJson(Map<String, dynamic> json) => ForfaitModel(
        flatRate: json["flat_rate"] as String,
      );

  Map<String, dynamic> toJson() => {
        "flat_rate": flatRate,
      };
}

class LivraisonGratuiteModel {
  LivraisonGratuiteModel({
    this.freeShipping,
    this.freeShipping1,
  });

  String? freeShipping;
  String? freeShipping1;

  factory LivraisonGratuiteModel.fromJson(Map<String, dynamic> json) =>
      LivraisonGratuiteModel(
        freeShipping: json["free_shipping"] as String,
        freeShipping1: json["free_shipping:1"] as String,
      );

  Map<String, dynamic> toJson() => {
        "free_shipping": freeShipping,
        "free_shipping:1": freeShipping1,
      };
}

class PointDeVenteModel {
  PointDeVenteModel({
    this.localPickup,
  });

  String? localPickup;

  factory PointDeVenteModel.fromJson(Map<String, dynamic> json) =>
      PointDeVenteModel(
        localPickup: json["local_pickup"] as String,
      );

  Map<String, dynamic> toJson() => {
        "local_pickup": localPickup,
      };
}

enum PaymentGatewaysModelPlaceholder { empty, optionnel, youYourEmailCom }

final placeholderValues = EnumValuesModel({
  "": PaymentGatewaysModelPlaceholder.empty,
  "Optionnel": PaymentGatewaysModelPlaceholder.optionnel,
  "you@youremail.com": PaymentGatewaysModelPlaceholder.youYourEmailCom
});

class EnumValuesModel<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValuesModel(this.map);

  Map<T, String> get reverse {
    return reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
