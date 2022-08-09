import '/data/models/models.dart';
import '/domain/entities/entities.dart';

// MetaDataModel
extension MetaDataModelMapper on MetaDataModel {
  MetaDataEntity toDomain() {
    return MetaDataEntity(
      id: id,
      key: key,
      value: value,
    );
  }
}
