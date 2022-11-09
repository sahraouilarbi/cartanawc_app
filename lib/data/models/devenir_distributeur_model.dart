import '/core/extensions.dart';

class DevenirDistributeurRequestModel {
  String yourName;
  String yourEmail;
  String yourPhone;
  String yourAddress;
  String yourCity;
  String yourPostcode;
  String yourSubject;
  String yourMessage;

  DevenirDistributeurRequestModel(
    this.yourName,
    this.yourEmail,
    this.yourPhone,
    this.yourAddress,
    this.yourCity,
    this.yourPostcode,
    this.yourSubject,
    this.yourMessage,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['your-name'] = yourName;
    _data['your-email'] = yourEmail;
    _data['your-phone'] = yourPhone;
    _data['your-address'] = yourAddress;
    _data['your-city'] = yourCity;
    _data['your-postcode'] = yourPostcode;
    _data['your-subject'] = yourSubject;
    _data['your-message'] = yourMessage;
    return _data;
  }
}

class DevenirDistributeurResponseModel {
  int? contactFormId;
  String? status;
  String? message;
  String? postedDataHash;
  String? into;
  List<dynamic>? invalidFields;

  DevenirDistributeurResponseModel({
    this.contactFormId,
    this.status,
    this.message,
    this.postedDataHash,
    this.into,
    this.invalidFields,
  });
  factory DevenirDistributeurResponseModel.fromJson(
          Map<String, dynamic> json) =>
      DevenirDistributeurResponseModel(
        contactFormId: json['contact_form_id'] != null
            ? json['contact_form_id'] as int
            : kZERO,
        status: json['status'] != null ? json['status'] as String : kEMPTY,
        message: json['message'] != null ? json['message'] as String : kEMPTY,
        postedDataHash: json['posted_data_hash'] != null
            ? json['posted_data_hash'] as String
            : kEMPTY,
        into: json['into'] != null ? json['into'] as String : kEMPTY,
        invalidFields: json['invalid_fields'] != null
            ? List.from(json['invalid_fields'] as List)
            : <dynamic>[],
      );
}
