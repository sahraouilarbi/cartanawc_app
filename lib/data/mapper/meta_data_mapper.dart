import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

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
