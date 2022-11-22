import 'dart:async';

import '/domain/entities/contact_entity.dart';
import '/domain/usecase/contact_usecase.dart';
import '/presentation/base/base.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';

class ContactViewModel extends BaseViewModel
    with ContactModelInputs, ContactModelOutputs {
  final ContactUsecase _contactUsecase;
  ContactViewModel(this._contactUsecase);

  final StreamController _yourNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourEmailStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourTelephoneStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourSujetStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourMessageStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isContactSendMessageSuccessfullyStreamController =
      StreamController<ContactResponseEntity>();

  String yourName = '';
  String yourEmail = '';
  String yourTelephone = '';
  String yourSujet = '';
  String vousEtes = '';
  String yourMessage = '';

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputYourEmail => _yourEmailStreamController.sink;

  @override
  Sink get inputYourMessage => _yourMessageStreamController.sink;

  @override
  Sink get inputYourName => _yourNameStreamController.sink;

  @override
  Sink get inputYourSujet => _yourSujetStreamController.sink;

  @override
  Sink get inputYourTelephone => _yourTelephoneStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map(
        (_) => _isAllInputsValid(),
      );

  @override
  Stream<bool> get outputYourEmail => _yourEmailStreamController.stream.map(
        (yourEmail) => _isYourEmailValid(yourEmail as String),
      );

  @override
  Stream<bool> get outputYourMessage => _yourMessageStreamController.stream.map(
        (yourMessage) => _isYourMessageValid(yourMessage as String),
      );

  @override
  Stream<bool> get outputYourName => _yourNameStreamController.stream.map(
        (yourName) => _isYourNameValid(yourName as String),
      );

  @override
  Stream<bool> get outputYourSujet => _yourSujetStreamController.stream.map(
        (yourSujet) => _isYourSujetValid(yourSujet as String),
      );

  @override
  Stream<bool> get outputYourTelephone =>
      _yourTelephoneStreamController.stream.map(
        (yourTelephone) => _isYourTelephoneValid(yourTelephone as String),
      );

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _yourNameStreamController.close();
    _yourEmailStreamController.close();
    _yourTelephoneStreamController.close();
    _yourSujetStreamController.close();
    _yourMessageStreamController.close();
    _isAllInputsValidStreamController.close();
    isContactSendMessageSuccessfullyStreamController.close();
    inputIsAllInputsValid.close();
    inputYourEmail.close();
    inputYourMessage.close();
    inputYourName.close();
    inputYourSujet.close();
    inputYourTelephone.close();
    super.dispose();
  }

  @override
  Future<void> contact() async {
    final ContactRequestEntity _formData = ContactRequestEntity(
      yourName,
      yourEmail,
      yourTelephone,
      vousEtes,
      yourSujet,
      yourMessage,
    );

    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _contactUsecase.execute(_formData)).fold(
      (failure) => inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      ),
      (data) {
        print('### status: ${data.status}');
        if (data.status == "mail_sent") {
          inputState.add(
            SuccessState(data.message),
          );
          Future.delayed(
            const Duration(seconds: 1),
            () {},
          );
          inputState.add(
            ContentState(),
          );
          isContactSendMessageSuccessfullyStreamController.add(data);
        }
      },
    );
  }

  @override
  void setYourEmail(String _yourEmail) {
    inputYourEmail.add(_yourEmail);
    yourEmail = _yourEmail;
    _validate();
  }

  @override
  void setYourMessage(String _yourMessage) {
    yourMessage = _yourMessage;
    _validate();
  }

  @override
  void setYourName(String _yourName) {
    yourName = _yourName;
    _validate();
  }

  @override
  void setYourSujet(String _yourSujet) {
    yourSujet = _yourSujet;
    _validate();
  }

  @override
  void setYourTelephone(String _yourTelephone) {
    yourTelephone = _yourTelephone;
    _validate();
  }

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  // Validate Name
  bool _isYourNameValid(String _yourName) {
    return _yourName.isNotEmpty && _yourName.length > 3;
  }

  // Validate Email
  bool _isYourEmailValid(String _yourEmail) {
    return _yourEmail.isNotEmpty && _yourEmail.contains('@');
  }

  // Validate Telephone
  bool _isYourTelephoneValid(String _yourTelephone) {
    return _yourTelephone.isNotEmpty && _yourTelephone.length > 9;
  }

  // Validate Sujet
  bool _isYourSujetValid(String _yourSujet) {
    return _yourSujet.isNotEmpty && _yourSujet.length > 3;
  }

  // Validate Message
  bool _isYourMessageValid(String _yourMessage) {
    return _yourMessage.isNotEmpty && _yourMessage.length > 3;
  }

  // Validate all inputs
  bool _isAllInputsValid() {
    return _isYourNameValid(yourName) &&
        _isYourEmailValid(yourEmail) &&
        _isYourTelephoneValid(yourTelephone) &&
        _isYourSujetValid(yourSujet) &&
        _isYourMessageValid(yourMessage);
  }
}

abstract class ContactModelInputs {
  void setYourName(String yourName);
  void setYourEmail(String yourEmail);
  void setYourTelephone(String yourTelephone);
  void setYourSujet(String yourSujet);
  void setYourMessage(String yourMessage);
  void contact();
  Sink get inputYourName;
  Sink get inputYourEmail;
  Sink get inputYourTelephone;
  Sink get inputYourSujet;
  Sink get inputYourMessage;
  Sink get inputIsAllInputsValid;
}

abstract class ContactModelOutputs {
  Stream<bool> get outputYourName;
  Stream<bool> get outputYourEmail;
  Stream<bool> get outputYourTelephone;
  Stream<bool> get outputYourSujet;
  Stream<bool> get outputYourMessage;
  Stream<bool> get outputIsAllInputsValid;
}
