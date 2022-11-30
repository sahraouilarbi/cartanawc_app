import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

extension ContactRequestModelMapper on ContactRequestEntity {
  ContactRequestModel toModel() {
    return ContactRequestModel(
      yourName,
      yourEmail,
      yourTelephone,
      vousEtes,
      yourSubject,
      yourMessage,
    );
  }
}

extension ContactResponseModelMapper on ContactResponseModel? {
  ContactResponseEntity toDomain() {
    final List<dynamic> _invalidFieldsMapped =
        (this?.invalidFields?.map((_e) => _e) ?? const Iterable.empty())
            .cast<dynamic>()
            .toList();
    return ContactResponseEntity(
      this?.contactFormId?.orZero() ?? kZERO,
      this?.status?.orEmpty() ?? kEMPTY,
      this?.message?.orEmpty() ?? kEMPTY,
      this?.postedDataHash?.orEmpty() ?? kEMPTY,
      this?.into?.orEmpty() ?? kEMPTY,
      _invalidFieldsMapped,
    );
  }
}
