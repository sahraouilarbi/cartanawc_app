import '../../domain/entities/entities.dart';
import '../models/models.dart';

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
