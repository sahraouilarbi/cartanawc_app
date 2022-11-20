import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

extension MagasinCosmetiqueModelMapper on MagasinCosmetiqueModel? {
  MagasinCosmetiqueEntity toDomain() {
    return MagasinCosmetiqueEntity(
      id: this?.id?.orZero() ?? kZERO,
      date: this?.date?.orEmpty() ?? kEMPTY,
      dateGmt: this?.dateGmt?.orEmpty() ?? kEMPTY,
      guid: this!.guid.toDomain(),
      modified: this?.modified?.orEmpty() ?? kEMPTY,
      modifiedGmt: this?.modifiedGmt?.orEmpty() ?? kEMPTY,
      slug: this?.slug?.orEmpty() ?? kEMPTY,
      status: this?.status?.orEmpty() ?? kEMPTY,
      type: this?.type?.orEmpty() ?? kEMPTY,
      link: this?.link?.orEmpty() ?? kEMPTY,
      title: this!.title.toDomain(),
      template: this?.template?.orEmpty() ?? kEMPTY,
      meta: this!.meta.toDomain(),
      acf: this!.acf.toDomain(),
    );
  }
}

extension MagasinCosmetiqueModelGUIDMapper on MagasinCosmetiqueModelGUID? {
  MagasinCosmetiqueEntityGUID toDomain() {
    return MagasinCosmetiqueEntityGUID(
      rendered: this?.rendered?.orEmpty() ?? kEMPTY,
    );
  }
}

extension MagasinCosmetiqueModelTitleMapper on MagasinCosmetiqueModelTitle? {
  MagasinCosmetiqueEntityTitle toDomain() {
    return MagasinCosmetiqueEntityTitle(
      rendered: this?.rendered?.orEmpty() ?? kEMPTY,
    );
  }
}

extension MagasinCosmetiqueModelMetaMapper on MagasinCosmetiqueModelMeta? {
  MagasinCosmetiqueEntityMeta toDomain() {
    return MagasinCosmetiqueEntityMeta(
      inlineFeaturedImage: this?.inlineFeaturedImage.orFalseBool() ?? false,
    );
  }
}

extension MagasinCosmetiqueModelACFMapper on MagasinCosmetiqueModelACF? {
  MagasinCosmetiqueEntityACF toDomain() {
    return MagasinCosmetiqueEntityACF(
      latitude: this?.latitude?.orEmpty() ?? kEMPTY,
      longitude: this?.longitude.orEmpty() ?? kEMPTY,
    );
  }
}
