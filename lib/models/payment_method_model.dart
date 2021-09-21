// To parse this JSON data, do
//
//     final paymentGateways = paymentGatewaysFromJson(jsonString);

import 'dart:convert';

List<PaymentGateways> paymentGatewaysFromJson(String str) =>
    List<PaymentGateways>.from(json
        .decode(str)
        .map((x) => PaymentGateways.fromJson(x as Map<String, dynamic>)));

String paymentGatewaysToJson(List<PaymentGateways> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentGateways {
  PaymentGateways({
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
  Map<String, Setting> settings;
  Links links;

  factory PaymentGateways.fromJson(Map<String, dynamic> json) =>
      PaymentGateways(
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
            (k, v) => MapEntry<String, Setting>(
                k as String, Setting.fromJson(v as Map<String, dynamic>))),
        links: Links.fromJson(json["_links"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "order": order,
        "enabled": enabled,
        "method_title": methodTitle,
        "method_description": methodDescription,
        "method_supports": List<dynamic>.from(methodSupports.map((x) => x)),
        "settings": Map.from(settings)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v.toJson())),
        "_links": links.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from((json["self"] as List)
            .map((x) => Collection.fromJson(x as Map<String, dynamic>))),
        collection: List<Collection>.from((json["collection"] as List)
            .map((x) => Collection.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"] as String,
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Setting {
  Setting({
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
  Placeholder placeholder;
  SettingsOptions options;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
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
            : SettingsOptions.fromJson(json["options"] as Map<String, dynamic>),
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

class SettingsOptions {
  SettingsOptions({
    this.forfait,
    this.livraisonGratuite,
    this.pointDeVente,
    this.sale,
    this.authorization,
  });

  Forfait forfait;
  LivraisonGratuite livraisonGratuite;
  PointDeVente pointDeVente;
  String sale;
  String authorization;

  factory SettingsOptions.fromJson(Map<String, dynamic> json) =>
      SettingsOptions(
        forfait: json["Forfait"] == null
            ? null
            : Forfait.fromJson(json["Forfait"] as Map<String, dynamic>),
        livraisonGratuite: json["Livraison gratuite"] == null
            ? null
            : LivraisonGratuite.fromJson(
                json["Livraison gratuite"] as Map<String, dynamic>),
        pointDeVente: json["Point de vente"] == null
            ? null
            : PointDeVente.fromJson(
                json["Point de vente"] as Map<String, dynamic>),
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
        "sale": sale == null ?? sale,

        //"authorization": authorization == null ? null : authorization,
        "authorization": authorization == null ?? authorization,
      };
}

class Forfait {
  Forfait({
    this.flatRate,
  });

  String flatRate;

  factory Forfait.fromJson(Map<String, dynamic> json) => Forfait(
        flatRate: json["flat_rate"] as String,
      );

  Map<String, dynamic> toJson() => {
        "flat_rate": flatRate,
      };
}

class LivraisonGratuite {
  LivraisonGratuite({
    this.freeShipping,
    this.freeShipping1,
  });

  String freeShipping;
  String freeShipping1;

  factory LivraisonGratuite.fromJson(Map<String, dynamic> json) =>
      LivraisonGratuite(
        freeShipping: json["free_shipping"] as String,
        freeShipping1: json["free_shipping:1"] as String,
      );

  Map<String, dynamic> toJson() => {
        "free_shipping": freeShipping,
        "free_shipping:1": freeShipping1,
      };
}

class PointDeVente {
  PointDeVente({
    this.localPickup,
  });

  String localPickup;

  factory PointDeVente.fromJson(Map<String, dynamic> json) => PointDeVente(
        localPickup: json["local_pickup"] as String,
      );

  Map<String, dynamic> toJson() => {
        "local_pickup": localPickup,
      };
}

enum Placeholder { EMPTY, OPTIONNEL, YOU_YOUREMAIL_COM }

final placeholderValues = EnumValues({
  "": Placeholder.EMPTY,
  "Optionnel": Placeholder.OPTIONNEL,
  "you@youremail.com": Placeholder.YOU_YOUREMAIL_COM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
