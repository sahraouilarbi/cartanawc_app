class DevenirDistributeurRequestEntity {
  String yourName;
  String yourEmail;
  String yourPhone;
  String yourAddress;
  String yourCity;
  String yourPostcode;
  String yourSubject;
  String yourMessage;

  DevenirDistributeurRequestEntity(
    this.yourName,
    this.yourEmail,
    this.yourPhone,
    this.yourAddress,
    this.yourCity,
    this.yourPostcode,
    this.yourSubject,
    this.yourMessage,
  );
}

class DevenirDistributeurResponseEntity {
  int contactFormId;
  String status;
  String message;
  String postedDataHash;
  String into;
  List<dynamic> invalidFields;

  DevenirDistributeurResponseEntity(
    this.contactFormId,
    this.status,
    this.message,
    this.postedDataHash,
    this.into,
    this.invalidFields,
  );
}
