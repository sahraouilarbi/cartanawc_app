import 'dart:async';

import 'package:cartanawc_app/domain/entities/devenir_distributeur_entity.dart';
import 'package:cartanawc_app/domain/usecase/devenir_distributeur_usecase.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';

import '/presentation/base/base.dart';

class DevenirDistributeurViewModel extends BaseViewModel
    with
        DevenirDistributeurViewModelInputs,
        DevenirDistributeurViewModelOutputs {
  final DevenirDistributeurUsecase _devenirDistributeurUsecase;
  DevenirDistributeurViewModel(this._devenirDistributeurUsecase);

  final StreamController _yourNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourEmailStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourPhoneStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourAddressStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourCityStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourPostcodeStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourSubjectStreamController =
      StreamController<String>.broadcast();
  final StreamController _yourMessageStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController
      isDevenirDistributeurSendMessageSuccessfullyStreamController =
      StreamController<DevenirDistributeurResponseEntity>();

  String yourName = '';
  String yourEmail = '';
  String yourPhone = '';
  String yourAddress = '';
  String yourCity = '';
  String yourPostcode = '';
  String yourSubject = '';
  String yourMessage = '';

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _yourNameStreamController.close();
    _yourEmailStreamController.close();
    _yourPhoneStreamController.close();
    _yourAddressStreamController.close();
    _yourCityStreamController.close();
    _yourPostcodeStreamController.close();
    _yourSubjectStreamController.close();
    _yourMessageStreamController.close();
    _isAllInputsValidStreamController.close();
    isDevenirDistributeurSendMessageSuccessfullyStreamController.close();
    inputYourName.close();
    inputYourPhone.close();
    inputYourEmail.close();
    inputYourAddress.close();
    inputYourCity.close();
    inputYourPostcode.close();
    inputYourSubject.close();
    inputYourMessage.close();
    inputIsAllInputsValid.close();
  }

  @override
  Future<void> devenirDistributeur() async {
    DevenirDistributeurRequestEntity _formData =
        DevenirDistributeurRequestEntity(yourName, yourEmail, yourPhone,
            yourAddress, yourCity, yourPostcode, yourSubject, yourMessage);

    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _devenirDistributeurUsecase.execute(_formData)).fold(
        (failure) => inputState.add(
              ErrorState(StateRendererType.popupErrorState, failure.message),
            ), (data) {
      inputState.add(ContentState());
      isDevenirDistributeurSendMessageSuccessfullyStreamController.add(data);
    });
  }

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputYourAddress => _yourAddressStreamController.sink;

  @override
  Sink get inputYourCity => _yourCityStreamController.sink;

  @override
  Sink get inputYourEmail => _yourEmailStreamController.sink;

  @override
  Sink get inputYourMessage => _yourMessageStreamController.sink;

  @override
  Sink get inputYourName => _yourNameStreamController.sink;

  @override
  Sink get inputYourPhone => _yourPhoneStreamController.sink;

  @override
  Sink get inputYourPostcode => _yourPostcodeStreamController.sink;

  @override
  Sink get inputYourSubject => _yourSubjectStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputIsYourAddressValid =>
      _yourAddressStreamController.stream
          .map((yourAddress) => _isYourAddressValid(yourAddress as String));

  @override
  Stream<bool> get outputIsYourCityValid => _yourCityStreamController.stream
      .map((yourCity) => _isYourCityValid(yourCity as String));

  @override
  Stream<bool> get outputIsYourEmailValid => _yourEmailStreamController.stream
      .map((yourEmail) => _isYourEmailValid(yourEmail as String));

  @override
  Stream<bool> get outputIsYourMessageValid =>
      _yourMessageStreamController.stream
          .map((yourMessage) => _isYourMessageValid(yourMessage as String));

  @override
  Stream<bool> get outputIsYourNameValid => _yourNameStreamController.stream
      .map((yourName) => _isYourNameValid(yourName as String));

  @override
  Stream<bool> get outputIsYourPhoneValid => _yourPhoneStreamController.stream
      .map((yourPhone) => _isYourPhoneValid(yourPhone as String));

  @override
  Stream<bool> get outputIsYourPostcodeValid =>
      _yourPostcodeStreamController.stream
          .map((yourPostcode) => _isYourPostcodeValid(yourPostcode as String));

  @override
  Stream<bool> get outputIsYourSubjectValid =>
      _yourSubjectStreamController.stream
          .map((yourSubject) => _isYourSubjectValid(yourSubject as String));

  @override
  void setYourAddress(String _yourAddress) {
    inputYourAddress.add(_yourAddress);
    yourAddress = _yourAddress;
    _validate();
  }

  @override
  void setYourCity(String _yourCity) {
    inputYourCity.add(_yourCity);
    yourCity = _yourCity;
    _validate();
  }

  @override
  void setYourEmail(String _yourEmail) {
    inputYourEmail.add(_yourEmail);
    yourEmail = _yourEmail;
    _validate();
  }

  @override
  void setYourMessage(String _yourMessage) {
    inputYourMessage.add(_yourMessage);
    yourMessage = _yourMessage;
    _validate();
  }

  @override
  void setYourName(String _yourName) {
    inputYourName.add(_yourName);
    yourName = _yourName;
    _validate();
  }

  @override
  void setYourPhone(String _yourPhone) {
    inputYourPhone.add(_yourPhone);
    yourPhone = _yourPhone;
    _validate();
  }

  @override
  void setYourPostcode(String _yourPostcode) {
    inputYourPostcode.add(_yourPostcode);
    yourPostcode = _yourPostcode;
    _validate();
  }

  @override
  void setYourSubject(String _yourSubject) {
    inputYourSubject.add(_yourSubject);
    yourSubject = _yourSubject;
    _validate();
  }

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  bool _isYourNameValid(String _yourName) {
    return _yourName.isNotEmpty;
  }

  bool _isYourEmailValid(String _yourEmail) {
    return _yourEmail.isNotEmpty && _yourEmail.contains('@');
  }

  bool _isYourPhoneValid(String _yourPhone) {
    return _yourPhone.isNotEmpty && _yourPhone.length >= 9;
  }

  bool _isYourAddressValid(String _yourAddress) {
    return _yourAddress.isNotEmpty;
  }

  bool _isYourCityValid(String _yourCity) {
    return _yourCity.isNotEmpty;
  }

  bool _isYourPostcodeValid(String _yourPostcode) {
    return _yourPostcode.isNotEmpty && _yourPostcode.length == 5;
  }

  bool _isYourSubjectValid(String _yourSubject) {
    return _yourSubject.isNotEmpty;
  }

  bool _isYourMessageValid(String _yourMessage) {
    return _yourMessage.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isYourNameValid(yourName) &&
        _isYourEmailValid(yourEmail) &&
        _isYourPhoneValid(yourPhone) &&
        _isYourAddressValid(yourAddress) &&
        _isYourCityValid(yourCity) &&
        _isYourPostcodeValid(yourPostcode) &&
        _isYourSubjectValid(yourSubject) &&
        _isYourMessageValid(yourMessage);
  }
}

abstract class DevenirDistributeurViewModelInputs {
  void setYourName(String _yourName);
  void setYourEmail(String _yourEmail);
  void setYourPhone(String _yourPhone);
  void setYourAddress(String _yourAddress);
  void setYourCity(String _yourCity);
  void setYourPostcode(String _yourPostcode);
  void setYourSubject(String _yourSubject);
  void setYourMessage(String _yourMessage);

  void devenirDistributeur();

  Sink get inputYourName;
  Sink get inputYourPhone;
  Sink get inputYourEmail;
  Sink get inputYourAddress;
  Sink get inputYourCity;
  Sink get inputYourPostcode;
  Sink get inputYourSubject;
  Sink get inputYourMessage;
  Sink get inputIsAllInputsValid;
}

abstract class DevenirDistributeurViewModelOutputs {
  Stream<bool> get outputIsYourNameValid;
  Stream<bool> get outputIsYourEmailValid;
  Stream<bool> get outputIsYourPhoneValid;
  Stream<bool> get outputIsYourAddressValid;
  Stream<bool> get outputIsYourCityValid;
  Stream<bool> get outputIsYourPostcodeValid;
  Stream<bool> get outputIsYourSubjectValid;
  Stream<bool> get outputIsYourMessageValid;
  Stream<bool> get outputIsAllInputsValid;
}
