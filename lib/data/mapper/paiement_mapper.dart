import '/core/extensions.dart';

import '/data/models/models.dart';
import '/domain/entities/entities.dart';

extension PaiementModelMapper on PaiementModel? {
  PaiementEntity toDomain() {
    return PaiementEntity(
      id: this?.id?.orZero() ?? kZERO,
      date: this?.date?.orEmpty() ?? kEMPTY,
      dateGMT: this?.dateGMT?.orEmpty() ?? kEMPTY,
      guid: this!.guid.toDomain(),
      modified: this?.modified?.orEmpty() ?? kEMPTY,
      modifiedGMT: this?.modifiedGMT?.orEmpty() ?? kEMPTY,
      slug: this?.slug?.orEmpty() ?? kEMPTY,
      status: this?.status?.orEmpty() ?? kEMPTY,
      type: this?.type?.orEmpty() ?? kEMPTY,
      link: this?.link?.orEmpty() ?? kEMPTY,
      title: this!.title.toDomain(),
      content: this!.content.toDomain(),
      commentStatus: this?.commentStatus?.orEmpty() ?? kEMPTY,
      pingStatus: this?.pingStatus?.orEmpty() ?? kEMPTY,
      template: this?.template?.orEmpty() ?? kEMPTY,
      meta: this!.meta.toDomain(),
      acf: this!.acf.toDomain(),
    );
  }
}

extension PaiementModelGUIDMapper on PaiementModelGUID? {
  PaiementEntityGUID toDomain() {
    return PaiementEntityGUID(
      rendered: this?.rendered?.orEmpty() ?? kEMPTY,
    );
  }
}

extension PaiementModelTitleMapper on PaiementModelTitle? {
  PaiementEntityTitle toDomain() {
    return PaiementEntityTitle(
      rendered: this?.rendered?.orEmpty() ?? kEMPTY,
    );
  }
}

extension PaiementModelContentMapper on PaiementModelContent? {
  PaiementEntityContent toDomain() {
    return PaiementEntityContent(
      rendered: this?.rendered?.orEmpty() ?? kEMPTY,
      protected: this?.protected?.orFalseBool() ?? false,
    );
  }
}

extension PaiementModelMetaMapper on PaiementModelMeta? {
  PaiementEntityMeta toDomain() {
    return PaiementEntityMeta(
      inlineFeaturedImage: this?.inlineFeaturedImage?.orFalseBool() ?? false,
    );
  }
}

extension PaiementModelACFMapper on PaiementModelACF? {
  PaiementEntityACF toDomain() {
    return PaiementEntityACF(
      montant: this?.montant?.orEmpty() ?? kEMPTY,
      methodeDePaiement: this?.methodeDePaiement?.orEmpty() ?? kEMPTY,
      client: this!.client.toDomain(),
    );
  }
}

extension PaiementModelACFClientMapper on PaiementModelACFClient? {
  PaiementEntityACFClient toDomain() {
    return PaiementEntityACFClient(
      id: this?.id?.orZero() ?? kZERO,
      // userFirstname: this?.userFirstname?.orEmpty() ?? kEMPTY,
      // userLastname: this?.userLastname?.orEmpty() ?? kEMPTY,
      // nickname: this?.nickname?.orEmpty() ?? kEMPTY,
      // userNicename: this?.userNicename?.orEmpty() ?? kEMPTY,
      // displayName: this?.displayName?.orEmpty() ?? kEMPTY,
      // userEmail: this?.userEmail?.orEmpty() ?? kEMPTY,
      // userUrl: this?.userUrl?.orEmpty() ?? kEMPTY,
      // userRegistered: this?.userRegistered?.orEmpty() ?? kEMPTY,
      // userDescription: this?.userDescription?.orEmpty() ?? kEMPTY,
      //userAvatar: this?.userAvatar?.orEmpty() ?? kEMPTY,
    );
  }
}
