import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';

extension DevenirDitributeurRequestMapper on DevenirDistributeurRequestEntity {
  DevenirDistributeurRequestModel toModel() {
    return DevenirDistributeurRequestModel(
      yourName,
      yourEmail,
      yourPhone,
      yourAddress,
      yourCity,
      yourPostcode,
      yourSubject,
      yourMessage,
    );
  }
}

extension DevenirDistributeurResponseMapper
    on DevenirDistributeurResponseModel? {
  DevenirDistributeurResponseEntity toDomain() {
    final List<dynamic> _invalidFieldsMapped =
        (this?.invalidFields?.map((v) => v) ?? const Iterable.empty())
            .cast<dynamic>()
            .toList();
    return DevenirDistributeurResponseEntity(
      this?.contactFormId?.orZero() ?? kZERO,
      this?.status?.orEmpty() ?? kEMPTY,
      this?.message?.orEmpty() ?? kEMPTY,
      this?.postedDataHash?.orEmpty() ?? kEMPTY,
      this?.into?.orEmpty() ?? kEMPTY,
      _invalidFieldsMapped,
    );
  }
}
