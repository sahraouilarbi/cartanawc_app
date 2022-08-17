import '/core/extensions.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// MetaDataModel
extension MetaDataModelMapper on MetaDataModel? {
  MetaDataEntity toDomain() {
    return MetaDataEntity(
      id: this?.id?.orZero() ?? kZERO,
      key: this?.key ?? kEMPTY,
      value: this?.value ?? kEMPTY,
    );
  }
}
