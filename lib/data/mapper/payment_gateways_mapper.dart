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
  PaymentGatewaysLinksEntity toDomain() {
    final List<PaymentGatewaysCollectionEntity> _selfMapped =
        List<PaymentGatewaysCollectionEntity>.from(self.map((e) => e));
    final List<PaymentGatewaysCollectionEntity> _collectionMapped =
        List<PaymentGatewaysCollectionEntity>.from(self.map((e) => e));
    return PaymentGatewaysLinksEntity(
      self: _selfMapped,
      collection: _collectionMapped,
    );
  }
}

extension SettingModelMapped on SettingModel {
  PaymentGatewaysSettingEntity toDomain() {
    return PaymentGatewaysSettingEntity(
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
  PaymentGatewaysSettingsOptionsEntity toDomain() {
    return PaymentGatewaysSettingsOptionsEntity(
      forfait: forfait.toDomain(),
      livraisonGratuite: livraisonGratuite.toDomain(),
      pointDeVente: pointDeVente.toDomain(),
      sale: sale,
      authorization: authorization,
    );
  }
}

extension ForfaitModelMapper on ForfaitModel {
  PaymentGatewaysForfaitEntity toDomain() {
    return PaymentGatewaysForfaitEntity(
      flatRate: flatRate,
    );
  }
}

extension LivraisonGratuiteModelMapper on LivraisonGratuiteModel {
  PaymentGatewaysLivraisonGratuiteEntity toDomain() {
    return PaymentGatewaysLivraisonGratuiteEntity(
      freeShipping: freeShipping,
      freeShipping1: freeShipping1,
    );
  }
}

// Point de vente
extension PointDeVenteModelMapper on PointDeVenteModel {
  PaymentGatewaysPointDeVenteEntity toDomain() {
    return PaymentGatewaysPointDeVenteEntity(
      localPickup: localPickup,
    );
  }
}
