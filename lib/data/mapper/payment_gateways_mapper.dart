import '../../domain/entities/entities.dart';
import '../models/models.dart';

extension PaymentGatewaysMapper on PaymentGatewaysModel {
  PaymentGatewaysEntity toDomain() {
    final List<String> _methodSupportsMapped =
        List<String>.from(methodSupports.map((e) => e));
    return PaymentGatewaysEntity(
      id: id,
      title: title,
      description: description,
      order: order,
      enabled: enabled,
      methodTitle: methodTitle,
      methodDescription: methodDescription,
      methodSupports: _methodSupportsMapped,
      //settings: settings,
      links: links.toDomain(),
    );
  }
}

extension LinksModelMapper on LinksModel {
  LinksEntity toDomain() {
    final List<CollectionEntity> _selfMapped =
        List<CollectionEntity>.from(self.map((e) => e));
    final List<CollectionEntity> _collectionMapped =
        List<CollectionEntity>.from(self.map((e) => e));
    return LinksEntity(
      self: _selfMapped,
      collection: _collectionMapped,
    );
  }
}

extension SettingModelMapped on SettingModel {
  SettingEntity toDomain() {
    return SettingEntity(
      id: id,
      label: label,
      description: description,
      type: type,
      value: value,
      settingDefault: settingDefault,
      tip: tip,
      //placeholder: placeholder,
      options: options.toDomain(),
    );
  }
}

extension SettingsOptionsModelMapper on SettingsOptionsModel {
  SettingsOptionsEntity toDomain() {
    return SettingsOptionsEntity(
      forfait: forfait.toDomain(),
      livraisonGratuite: livraisonGratuite.toDomain(),
      pointDeVente: pointDeVente.toDomain(),
      sale: sale,
      authorization: authorization,
    );
  }
}

extension ForfaitModelMapper on ForfaitModel {
  ForfaitEntity toDomain() {
    return ForfaitEntity(
      flatRate: flatRate,
    );
  }
}

extension LivraisonGratuiteModelMapper on LivraisonGratuiteModel {
  LivraisonGratuiteEntity toDomain() {
    return LivraisonGratuiteEntity(
      freeShipping: freeShipping,
      freeShipping1: freeShipping1,
    );
  }
}

// Point de vente
extension PointDeVenteModelMapper on PointDeVenteModel {
  PointDeVenteEntity toDomain() {
    return PointDeVenteEntity(
      localPickup: localPickup,
    );
  }
}
