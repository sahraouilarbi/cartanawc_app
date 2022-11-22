class ContactRequestEntity {
  String yourName;
  String yourEmail;
  String yourTelephone;
  String vousEtes;
  String yourSubject;
  String yourMessage;

  ContactRequestEntity(
    this.yourName,
    this.yourEmail,
    this.yourTelephone,
    this.vousEtes,
    this.yourSubject,
    this.yourMessage,
  );
}

class ContactResponseEntity {
  int contactFormId;
  String status;
  String message;
  String postedDataHash;
  String into;
  List<dynamic> invalidFields;
  ContactResponseEntity(
    this.contactFormId,
    this.status,
    this.message,
    this.postedDataHash,
    this.into,
    this.invalidFields,
  );
}
