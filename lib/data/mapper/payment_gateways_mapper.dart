import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

extension PaymentGatewaysMapper on PaymentGatewaysModel? {
  PaymentGatewaysEntity toDomain() {
    final List<String> _methodSupportsMapped = List<String>.from(
      this?.methodSupports?.map((_e) => _e) ?? const Iterable.empty(),
    );
    return PaymentGatewaysEntity(
      id: this?.id?.orEmpty() ?? kEMPTY,
      title: this?.title?.orEmpty() ?? kEMPTY,
      description: this?.description?.orEmpty() ?? kEMPTY,
      order: this?.order?.orZero() ?? kZERO,
      enabled: this?.enabled?.orFalseBool() ?? false,
      methodTitle: this?.methodTitle?.orEmpty() ?? kEMPTY,
      methodDescription: this?.methodDescription?.orEmpty() ?? kEMPTY,
      methodSupports: _methodSupportsMapped,
      // TODO A COMMENTER EN CAS DE BLOCAGE
      //settings: this?.settings?.orEmpty() ?? kEMPTY,
      links: this!.links.toDomain(),
    );
  }
}

extension LinksModelMapper on LinksModel? {
  PaymentGatewaysLinksEntity toDomain() {
    final List<PaymentGatewaysCollectionEntity> _selfMapped =
        List<PaymentGatewaysCollectionEntity>.from(
      this?.self?.map((_e) => _e) ?? const Iterable.empty(),
    );
    final List<PaymentGatewaysCollectionEntity> _collectionMapped =
        List<PaymentGatewaysCollectionEntity>.from(
      this?.self?.map((_e) => _e) ?? const Iterable.empty(),
    );
    return PaymentGatewaysLinksEntity(
      self: _selfMapped,
      collection: _collectionMapped,
    );
  }
}

extension SettingModelMapped on SettingModel? {
  PaymentGatewaysSettingEntity toDomain() {
    return PaymentGatewaysSettingEntity(
      id: this?.id?.orEmpty() ?? kEMPTY,
      label: this?.label?.orEmpty() ?? kEMPTY,
      description: this?.description?.orEmpty() ?? kEMPTY,
      type: this?.type?.orEmpty() ?? kEMPTY,
      value: this?.value?.orEmpty() ?? kEMPTY,
      settingDefault: this?.settingDefault?.orEmpty() ?? kEMPTY,
      tip: this?.tip?.orEmpty() ?? kEMPTY,
      //TODO A COMMENTER EN CAS DE BLOCAGE
      //placeholder: placeholder,
      options: this!.options.toDomain(),
    );
  }
}

extension SettingsOptionsModelMapper on SettingsOptionsModel? {
  PaymentGatewaysSettingsOptionsEntity toDomain() {
    return PaymentGatewaysSettingsOptionsEntity(
      forfait: this!.forfait.toDomain(),
      livraisonGratuite: this!.livraisonGratuite.toDomain(),
      pointDeVente: this!.pointDeVente.toDomain(),
      sale: this?.sale?.orEmpty() ?? kEMPTY,
      authorization: this?.authorization?.orEmpty() ?? kEMPTY,
    );
  }
}

extension ForfaitModelMapper on ForfaitModel? {
  PaymentGatewaysForfaitEntity toDomain() {
    return PaymentGatewaysForfaitEntity(
      flatRate: this?.flatRate?.orEmpty() ?? kEMPTY,
    );
  }
}

extension LivraisonGratuiteModelMapper on LivraisonGratuiteModel? {
  PaymentGatewaysLivraisonGratuiteEntity toDomain() {
    return PaymentGatewaysLivraisonGratuiteEntity(
      freeShipping: this?.freeShipping?.orEmpty() ?? kEMPTY,
      freeShipping1: this?.freeShipping1?.orEmpty() ?? kEMPTY,
    );
  }
}

// Point de vente
extension PointDeVenteModelMapper on PointDeVenteModel? {
  PaymentGatewaysPointDeVenteEntity toDomain() {
    return PaymentGatewaysPointDeVenteEntity(
      localPickup: this?.localPickup?.orEmpty() ?? kEMPTY,
    );
  }
}
