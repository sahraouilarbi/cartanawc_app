// To parse this JSON data, do
//
//     final paymentGateways = paymentGatewaysFromJson(jsonString);

import 'dart:convert';

List<PaymentGatewaysModel> paymentGatewaysFromJson(String str) =>
    List<PaymentGatewaysModel>.from(
      json.decode(str).map(
            (_e) => PaymentGatewaysModel.fromJson(_e as Map<String, dynamic>),
          ) as List,
    );

String paymentGatewaysToJson(List<PaymentGatewaysModel> data) =>
    json.encode(List<dynamic>.from(data.map((_e) => _e.toJson())));

class PaymentGatewaysModel {
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

  factory PaymentGatewaysModel.fromJson(Map<String, dynamic> json) =>
      PaymentGatewaysModel(
        id: json['id'] != null ? json['id'] as String : null,
        title: json['title'] != null ? json['title'] as String : null,
        description:
            json['description'] != null ? json['description'] as String : null,
        order: json['order'] != null ? json['order'] as int : null,
        enabled: json['enabled'] != null ? json['enabled'] as bool : null,
        methodTitle: json['method_title'] != null
            ? json['method_title'] as String
            : null,
        methodDescription: json['method_description'] != null
            ? json['method_description'] as String
            : null,
        methodSupports: json['method_supports'] != null
            ? List<String>.from(
                (json['method_supports'] as List<dynamic>).map((_e) => _e),
              )
            : null,
        settings: json['settings'] != null
            ? Map.from(json['settings'] as Map<String, dynamic>).map(
                (_k, _v) => MapEntry<String, SettingModel>(
                  _k as String,
                  SettingModel.fromJson(_v as Map<String, dynamic>),
                ),
              )
            : null,
        links: json['_links'] != null
            ? LinksModel.fromJson(json['_links'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'order': order,
        'enabled': enabled,
        'method_title': methodTitle,
        'method_description': methodDescription,
        'method_supports': List<dynamic>.from(methodSupports!.map((_e) => _e)),
        'settings': Map.from(settings!).map(
          (_k, _v) => MapEntry<String, dynamic>(
            _k as String,
            (_v as SettingModel).toJson(),
          ),
        ),
        '_links': links!.toJson(),
      };
}

class LinksModel {
  List<CollectionModel>? self;
  List<CollectionModel>? collection;

  LinksModel({
    this.self,
    this.collection,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        self: json['self'] != null
            ? List<CollectionModel>.from(
                (json['self'] as List<dynamic>).map(
                  (_e) => CollectionModel.fromJson(_e as Map<String, dynamic>),
                ),
              )
            : null,
        collection: json['collection'] != null
            ? List<CollectionModel>.from(
                (json['collection'] as List<dynamic>).map(
                  (_e) => CollectionModel.fromJson(_e as Map<String, dynamic>),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'self': List<dynamic>.from(self!.map((_e) => _e.toJson())),
        'collection': List<dynamic>.from(collection!.map((_e) => _e.toJson())),
      };
}

class CollectionModel {
  String? href;

  CollectionModel({
    this.href,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        href: json['href'] != null ? json['href'] as String : null,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}

class SettingModel {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? settingDefault;
  String? tip;
  PaymentGatewaysModelPlaceholder? placeholder;
  SettingsOptionsModel? options;

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

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json['id'] != null ? json['id'] as String : null,
        label: json['label'] != null ? json['label'] as String : null,
        description:
            json['description'] != null ? json['description'] as String : null,
        type: json['type'] != null ? json['type'] as String : null,
        value: json['value'] != null ? json['value'] as String : null,
        settingDefault:
            json['default'] != null ? json['default'] as String : null,
        tip: json['tip'] != null ? json['tip'] as String : null,
        placeholder: json['placeholder'] != null
            ? placeholderValues.map[json['placeholder']]
            : null,
        options: json['options'] == null
            ? null
            : SettingsOptionsModel.fromJson(
                json['options'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'description': description,
        'type': type,
        'value': value,
        'default': settingDefault,
        'tip': tip,
        'placeholder': placeholderValues.reverse[placeholder],
        'options': options?.toJson(),
      };
}

class SettingsOptionsModel {
  ForfaitModel? forfait;
  LivraisonGratuiteModel? livraisonGratuite;
  PointDeVenteModel? pointDeVente;
  String? sale;
  String? authorization;

  SettingsOptionsModel({
    this.forfait,
    this.livraisonGratuite,
    this.pointDeVente,
    this.sale,
    this.authorization,
  });

  factory SettingsOptionsModel.fromJson(Map<String, dynamic> json) =>
      SettingsOptionsModel(
        forfait: json['Forfait'] == null
            ? null
            : ForfaitModel.fromJson(json['Forfait'] as Map<String, dynamic>),
        livraisonGratuite: json['Livraison gratuite'] == null
            ? null
            : LivraisonGratuiteModel.fromJson(
                json['Livraison gratuite'] as Map<String, dynamic>,
              ),
        pointDeVente: json['Point de vente'] == null
            ? null
            : PointDeVenteModel.fromJson(
                json['Point de vente'] as Map<String, dynamic>,
              ),
        sale: json['sale'] == null ? null : json['sale'] as String,
        authorization: json['authorization'] == null
            ? null
            : json['authorization'] as String,
      );

  Map<String, dynamic> toJson() => {
        'Forfait': forfait?.toJson(),
        'Livraison gratuite': livraisonGratuite?.toJson(),
        'Point de vente': pointDeVente?.toJson(),

        //'sale': sale == null ? null : sale,
        'sale': sale,

        //'authorization': authorization == null ? null : authorization,
        'authorization': authorization,
      };
}

class ForfaitModel {
  String? flatRate;

  ForfaitModel({
    this.flatRate,
  });

  factory ForfaitModel.fromJson(Map<String, dynamic> json) => ForfaitModel(
        flatRate:
            json['flat_rate'] != null ? json['flat_rate'] as String : null,
      );

  Map<String, dynamic> toJson() => {
        'flat_rate': flatRate,
      };
}

class LivraisonGratuiteModel {
  String? freeShipping;
  String? freeShipping1;

  LivraisonGratuiteModel({
    this.freeShipping,
    this.freeShipping1,
  });

  factory LivraisonGratuiteModel.fromJson(Map<String, dynamic> json) =>
      LivraisonGratuiteModel(
        freeShipping: json['free_shipping'] != null
            ? json['free_shipping'] as String
            : null,
        freeShipping1: json['free_shipping:1'] != null
            ? json['free_shipping:1'] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        'free_shipping': freeShipping,
        'free_shipping:1': freeShipping1,
      };
}

class PointDeVenteModel {
  String? localPickup;

  PointDeVenteModel({
    this.localPickup,
  });

  factory PointDeVenteModel.fromJson(Map<String, dynamic> json) =>
      PointDeVenteModel(
        localPickup: json['local_pickup'] != null
            ? json['local_pickup'] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        'local_pickup': localPickup,
      };
}

enum PaymentGatewaysModelPlaceholder { empty, optionnel, youYourEmailCom }

final placeholderValues = EnumValuesModel({
  '': PaymentGatewaysModelPlaceholder.empty,
  'Optionnel': PaymentGatewaysModelPlaceholder.optionnel,
  'you@youremail.com': PaymentGatewaysModelPlaceholder.youYourEmailCom
});

class EnumValuesModel<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValuesModel(this.map);

  Map<T, String> get reverse {
    return reverseMap ??= map.map((_k, _v) => MapEntry(_v, _k));
  }
}
