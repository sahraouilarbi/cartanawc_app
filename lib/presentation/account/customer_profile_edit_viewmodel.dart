import 'dart:async';

import 'package:cartanawc_app/domain/usecase/customer_profile_edit_usercase.dart';
import 'package:cartanawc_app/presentation/base/base_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';

class CustomerProfileEditViewModel extends BaseViewModel
    with
        CustomerProfileEditViewModelInputs,
        CustomerProfileEditViewModelOutputs {
  final StreamController _nomStreamController =
      StreamController<String>.broadcast();
  final StreamController _prenomStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _telephoneStreamController =
      StreamController<String>.broadcast();
  final StreamController _adresseStreamController =
      StreamController<String>.broadcast();
  final StreamController _complementAdresseStreamController =
      StreamController<String>.broadcast();
  final StreamController _wilayaStreamController =
      StreamController<String>.broadcast();
  final StreamController _codePostalStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final CustomerProfileEditUsecase _customerProfileEditUsecase;

  CustomerProfileEditViewModel(this._customerProfileEditUsecase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _nomStreamController.close();
    _prenomStreamController.close();
    _emailStreamController.close();
    _telephoneStreamController.close();
    _adresseStreamController.close();
    _complementAdresseStreamController.close();
    _wilayaStreamController.close();
    _codePostalStreamController.close();
    _isAllInputsValidStreamController.close();
    super.dispose();
  }

  updateCustomerProfile() {}
  // Inputs ******************************************************************
  @override
  void setNom(String nom) {
    inputNom.add(nom);
    // TODO: implement setNom
    _validate();
  }

  @override
  void setPrenom(String prenom) {
    inputPrenom.add(prenom);
    // TODO: implement setPrenom
    _validate();
  }

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    // TODO: implement setEmail
    _validate();
  }

  @override
  void setTelephone(String telephone) {
    inputTelephone.add(telephone);
    // TODO: implement setTelephone
    _validate();
  }

  @override
  void setAdresse(String adresse) {
    inputAdresse.add(adresse);
    // TODO: implement setAdresse
    _validate();
  }

  @override
  void setComplementAdresse(String complementAdresse) {
    inputComplementAdresse.add(complementAdresse);
    // TODO: implement setComplementAdresse
    _validate();
  }

  @override
  void setWilaya(String wilaya) {
    inputWilaya.add(wilaya);
    // TODO: implement setWilaya
    _validate();
  }

  @override
  void setCodePostal(String codePostal) {
    inputCodePostal.add(codePostal);
    // TODO: implement setCodePostal
    _validate();
  }

  @override
  Sink get inputNom => _nomStreamController.sink;

  @override
  Sink get inputPrenom => _prenomStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputTelephone => _telephoneStreamController.sink;

  @override
  Sink get inputAdresse => _adresseStreamController.sink;

  @override
  Sink get inputComplementAdresse => _complementAdresseStreamController.sink;

  @override
  Sink get inputWilaya => _wilayaStreamController.sink;

  @override
  Sink get inputCodePostal => _codePostalStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  // Outputs ******************************************************************
  @override
  Stream<bool> get outputIsNomValid =>
      _nomStreamController.stream.map((nom) => _isNomValid(nom as String));

  @override
  Stream<bool> get outputIsPrenomValid => _prenomStreamController.stream
      .map((prenom) => _isPrenomValid(prenom as String));

  @override
  Stream<bool> get outputIsEmailValid => _emailStreamController.stream
      .map((email) => _isEmailValid(email as String));

  @override
  Stream<bool> get outputIsTelephoneValid => _telephoneStreamController.stream
      .map((telephone) => _isTelephoneValid(telephone as String));

  @override
  Stream<bool> get outputIsAdresseValid => _adresseStreamController.stream
      .map((adresse) => _isAdresseValid(adresse as String));

  @override
  Stream<bool> get outputIsComplementAdresseValid =>
      _complementAdresseStreamController.stream.map((complementAdresse) =>
          _isComplementAdresseValid(complementAdresse as String));

  @override
  Stream<bool> get outputIsWilayaValid => _wilayaStreamController.stream
      .map((wilaya) => _isWilayaValid(wilaya as String));

  @override
  Stream<bool> get outputIsCodePostalValid => _codePostalStreamController.stream
      .map((codePostal) => _isCodePostalValid(codePostal as String));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  bool _isNomValid(String nom) {
    return nom.isNotEmpty;
  }

  bool _isPrenomValid(String prenom) {
    return prenom.isNotEmpty;
  }

  bool _isEmailValid(String email) {
    return email.isNotEmpty;
  }

  bool _isTelephoneValid(String telephone) {
    return telephone.isNotEmpty;
  }

  bool _isAdresseValid(String adresse) {
    return adresse.isNotEmpty;
  }

  bool _isComplementAdresseValid(String complementAdresse) {
    return complementAdresse.isNotEmpty;
  }

  bool _isWilayaValid(String wilaya) {
    return wilaya.isNotEmpty;
  }

  bool _isCodePostalValid(String codePostal) {
    return codePostal.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return true;
    /*
        _isNomValid(nom) &&
        _isPrenomValid(prenom) &&
        _isEmailValid(email) &&
        _isTelephoneValid(telephone) &&
        _isAdresseValid(adresse) &&
        _isComplementAdresseValid(complementAdresse) &&
        _isWilayaValid(wilaya) &&
        _isCodePostalValid(codePostal);
     */
  }
}

abstract class CustomerProfileEditViewModelInputs {
  void setNom(String nom);
  void setPrenom(String prenom);
  void setEmail(String email);
  void setTelephone(String telephone);
  void setAdresse(String adresse);
  void setComplementAdresse(String complementAdresse);
  void setWilaya(String wilaya);
  void setCodePostal(String codePostal);

  Sink get inputNom;
  Sink get inputPrenom;
  Sink get inputEmail;
  Sink get inputTelephone;
  Sink get inputAdresse;
  Sink get inputComplementAdresse;
  Sink get inputWilaya;
  Sink get inputCodePostal;
  Sink get inputIsAllInputsValid;
}

abstract class CustomerProfileEditViewModelOutputs {
  Stream<bool> get outputIsNomValid;
  Stream<bool> get outputIsPrenomValid;
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsTelephoneValid;
  Stream<bool> get outputIsAdresseValid;
  Stream<bool> get outputIsComplementAdresseValid;
  Stream<bool> get outputIsWilayaValid;
  Stream<bool> get outputIsCodePostalValid;
  Stream<bool> get outputIsAllInputsValid;
}
