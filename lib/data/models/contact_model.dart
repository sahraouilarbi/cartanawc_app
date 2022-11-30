// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactRequestModel {
  String yourName;
  String yourEmail;
  String yourTelephone;
  String vousEtes;
  String yourSubject;
  String yourMessage;

  ContactRequestModel(
    this.yourName,
    this.yourEmail,
    this.yourTelephone,
    this.vousEtes,
    this.yourSubject,
    this.yourMessage,
  );

  Map<String, dynamic> toMap() => {
        'your-name': yourName,
        'your-email': yourEmail,
        'your-telephone': yourTelephone,
        'vous-etes': vousEtes,
        'your-subject': yourSubject,
        'your-message': yourMessage,
      };

  @override
  String toString() =>
      'ContactRequestModel(name: $yourName, email: $yourEmail, telephone: $yourTelephone, vous-êtes: $vousEtes, : $yourSubject, message: $yourMessage)';
}

class ContactResponseModel {
  int? contactFormId;
  String? status;
  String? message;
  String? postedDataHash;
  String? into;
  List<dynamic>? invalidFields;
  ContactResponseModel({
    this.contactFormId,
    this.status,
    this.message,
    this.postedDataHash,
    this.into,
    this.invalidFields,
  });

  Map<String, dynamic> toMap() => {
        'contactFormId': contactFormId,
        'status': status,
        'message': message,
        'posteDataHash': postedDataHash,
        'into': into,
        'invalidFields': invalidFields,
      };

  factory ContactResponseModel.fromMap(Map<String, dynamic> map) {
    return ContactResponseModel(
      contactFormId:
          map['contact_form_id'] != null ? map['contact_form_id'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      postedDataHash: map['posted_data_hash'] != null
          ? map['posted_data_hash'] as String
          : null,
      into: map['into'] != null ? map['into'] as String : null,
      invalidFields: map['invalid_fields'] != null
          ? List.from(map['invalid_fields'] as List<dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactResponseModel.fromJson(String source) =>
      ContactResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ContactResponseModel(contactFormId: $contactFormId, status: $status, message: $message, posteDataHash: $postedDataHash, into: $into, invalidFields: $invalidFields)';
}
