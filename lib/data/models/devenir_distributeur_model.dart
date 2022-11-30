// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cartanawc_app/core/extensions.dart';

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

  Map<String, dynamic> toJson() => {
        'your-name': yourName,
        'your-email': yourEmail,
        'your-phone': yourPhone,
        'your-address': yourAddress,
        'your-city': yourCity,
        'your-postcode': yourPostcode,
        'your-subject': yourSubject,
        'your-message': yourMessage,
      };

  @override
  String toString() =>
      'DevenirDistributeurRequestModel(yourName: $yourName, yourEmail: $yourEmail, yourPhone: $yourPhone, yourAddress: $yourAddress, yourCity: $yourCity, yourPostcode: $yourPostcode, yourSubject: $yourSubject, yourMessage: $yourMessage)';
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
    Map<String, dynamic> json,
  ) =>
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
            ? List.from(json['invalid_fields'] as List<dynamic>)
            : <dynamic>[],
      );
}
