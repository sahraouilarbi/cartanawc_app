import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/domain/usecase/customer_profile_edit_usecase.dart';
import '/presentation/base/base_viewmodel.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';
import '/presentation/customer_profile_edit/view/customer_profile_edit_page.dart';

class CustomerProfileEditViewModel extends BaseViewModel
    with
        CustomerProfileEditViewModelInputs,
        CustomerProfileEditViewModelOutputs {
  final ShippingEditUsecase _customerProfileEditUsecase;
  late final CustomerProfileEditPage customerProfileEditPage;
  CustomerProfileEditViewModel(
    this._customerProfileEditUsecase,
    this.customerProfileEditPage,
  );

  final StreamController _firstNameShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _lastNameShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _companyShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _address1ShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _address2ShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _cityShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _postCodeShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _countryShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _stateShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _phoneShippingStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final _customerProfileEditStreamController =
      BehaviorSubject<CustomerDetailEntity>();

  late CustomerDetailEntity customerDetailEntity;
  late ShippingEditEntity shippingEditEntity;

  String firstNameShipping = '';
  String lastNameShipping = '';
  String companyShipping = '';
  String address1Shipping = '';
  String address2Shipping = '';
  String cityShipping = '';
  String postCodeShipping = '';
  String countryShipping = '';
  String stateShipping = '';
  String phoneShipping = '';

  @override
  Future<void> start() async {
    customerProfileEditPage = instance<CustomerProfileEditPage>();
    customerDetailEntity = customerProfileEditPage.customerProfileEdit;
    shippingEditEntity.userId = customerDetailEntity.id!;
    shippingEditEntity.shippingEntity = customerDetailEntity.shipping!;
    updateShippingInformations();
  }

  @override
  void dispose() {
    _firstNameShippingStreamController.close();
    _lastNameShippingStreamController.close();
    _companyShippingStreamController.close();
    _address1ShippingStreamController.close();
    _address2ShippingStreamController.close();
    _cityShippingStreamController.close();
    _postCodeShippingStreamController.close();
    _countryShippingStreamController.close();
    _stateShippingStreamController.close();
    _phoneShippingStreamController.close();
    _isAllInputsValidStreamController.close();
    _customerProfileEditStreamController.close();
    super.dispose();
  }

  Future<void> updateShippingInformations() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
    );
    shippingEditEntity.shippingEntity.firstName = firstNameShipping;
    shippingEditEntity.shippingEntity.lastName = lastNameShipping;
    shippingEditEntity.shippingEntity.company = companyShipping;
    shippingEditEntity.shippingEntity.address1 = address1Shipping;
    shippingEditEntity.shippingEntity.address2 = address2Shipping;
    shippingEditEntity.shippingEntity.city = cityShipping;
    shippingEditEntity.shippingEntity.postcode = postCodeShipping;
    shippingEditEntity.shippingEntity.country = countryShipping;
    shippingEditEntity.shippingEntity.state = stateShipping;
    shippingEditEntity.shippingEntity.phone = phoneShipping;

    (await _customerProfileEditUsecase.execute(shippingEditEntity)).fold(
        (failure) => inputState.add(
              ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message),
            ), (data) {
      inputState.add(ContentState());
      //isCustomerProfilEditSuccessfullyStreamController.add(data);
    });
  }

  // Inputs ******************************************************************
  @override
  void setFirstNameShipping(String _firstNameShipping) {
    inputFirstNameShipping.add(_firstNameShipping);
    firstNameShipping = _firstNameShipping;
    _validate();
  }

  @override
  void setLastNameShipping(String _lastNameShipping) {
    inputLastNameShipping.add(_lastNameShipping);
    lastNameShipping = _lastNameShipping;
    _validate();
  }

  @override
  void setCompanyShipping(String _companyShipping) {
    inputCompanyShipping.add(_companyShipping);
    companyShipping = _companyShipping;
    _validate();
  }

  @override
  void setAddress1Shipping(String _address1Shipping) {
    inputAddress1Shipping.add(_address1Shipping);
    address1Shipping = _address1Shipping;
    _validate();
  }

  @override
  void setAddress2Shipping(String _address2Shipping) {
    inputAddress2Shipping.add(_address2Shipping);
    address2Shipping = _address2Shipping;
    _validate();
  }

  @override
  void setCityShipping(String _cityShipping) {
    inputCityShipping.add(_cityShipping);
    cityShipping = _cityShipping;
    _validate();
  }

  @override
  void setPostCodeShipping(String _postCodeShipping) {
    inputPostCodeShipping.add(_postCodeShipping);
    postCodeShipping = _postCodeShipping;
    _validate();
  }

  @override
  void setCountryShipping(String _countryShipping) {
    inputCountryShipping.add(_countryShipping);
    countryShipping = _countryShipping;
    _validate();
  }

  @override
  void setStateShipping(String _stateShipping) {
    inputStateShipping.add(_stateShipping);
    stateShipping = _stateShipping;
    _validate();
  }

  @override
  void setPhoneShipping(String _phoneShipping) {
    inputPhoneShipping.add(phoneShipping);
    phoneShipping = _phoneShipping;
    _validate();
  }

  @override
  Sink get inputFirstNameShipping => _firstNameShippingStreamController.sink;

  @override
  Sink get inputLastNameShipping => _lastNameShippingStreamController.sink;

  @override
  Sink get inputCompanyShipping => _companyShippingStreamController.sink;

  @override
  Sink get inputAddress1Shipping => _address1ShippingStreamController.sink;

  @override
  Sink get inputAddress2Shipping => _address2ShippingStreamController.sink;

  @override
  Sink get inputCityShipping => _cityShippingStreamController.sink;

  @override
  Sink get inputPostCodeShipping => _postCodeShippingStreamController.sink;

  @override
  Sink get inputCountryShipping => _countryShippingStreamController.sink;

  @override
  Sink get inputStateShipping => _stateShippingStreamController.sink;

  @override
  Sink get inputPhoneShipping => _phoneShippingStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  // Outputs ******************************************************************
  @override
  Stream<bool> get outputIsFirstNameShippingValid =>
      _firstNameShippingStreamController.stream.map((firstNameShipping) =>
          _isFirstNameShippingValid(firstNameShipping as String));

  @override
  Stream<bool> get outputIsLastNameShippingValid =>
      _lastNameShippingStreamController.stream.map((lastNameShipping) =>
          _isLastNameShippingValid(lastNameShipping as String));

  @override
  Stream<bool> get outputIsCompanyShippingValid =>
      _companyShippingStreamController.stream.map((companyShipping) =>
          _isCompanyShippingValid(companyShipping as String));

  @override
  Stream<bool> get outputIsAddress1ShippingValid =>
      _address1ShippingStreamController.stream.map((address1Shipping) =>
          _isAddress1ShippingValid(address1Shipping as String));

  @override
  Stream<bool> get outputIsAddress2ShippingValid =>
      _address2ShippingStreamController.stream.map((address2Shipping) =>
          _isAddress2ShippingValid(address2Shipping as String));

  @override
  Stream<bool> get outputIsCityShippingValid =>
      _cityShippingStreamController.stream
          .map((cityShipping) => _isCityShippingValid(cityShipping as String));

  @override
  Stream<bool> get outputIsPostCodeShippingValid =>
      _postCodeShippingStreamController.stream.map((postCodeShipping) =>
          _isPostCodeShippingValid(postCodeShipping as String));

  @override
  Stream<bool> get outputIsCountryShippingValid =>
      _countryShippingStreamController.stream.map((countryShipping) =>
          _isCountryShippingValid(countryShipping as String));

  @override
  Stream<bool> get outputIsStateShippingValid => _stateShippingStreamController
      .stream
      .map((stateShipping) => _isStateShippingValid(stateShipping as String));

  @override
  Stream<bool> get outputIsPhoneShippingValid => _phoneShippingStreamController
      .stream
      .map((phoneShipping) => _isPhoneShippingValid(phoneShipping as String));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  void _validate() {
    inputIsAllInputsValid.add(null);
  }

  bool _isFirstNameShippingValid(String firstNameShipping) {
    return firstNameShipping.isNotEmpty;
  }

  bool _isLastNameShippingValid(String lastNameShipping) {
    return lastNameShipping.isNotEmpty;
  }

  bool _isCompanyShippingValid(String companyShipping) {
    return companyShipping.isNotEmpty;
  }

  bool _isAddress1ShippingValid(String address1Shipping) {
    return address1Shipping.isNotEmpty;
  }

  bool _isAddress2ShippingValid(String address2Shipping) {
    return address2Shipping.isNotEmpty;
  }

  bool _isCityShippingValid(String cityShipping) {
    return cityShipping.isNotEmpty;
  }

  bool _isPostCodeShippingValid(String postCodeShipping) {
    return postCodeShipping.isNotEmpty;
  }

  bool _isCountryShippingValid(String countryShipping) {
    return countryShipping.isNotEmpty;
  }

  bool _isStateShippingValid(String stateShipping) {
    return stateShipping.isNotEmpty;
  }

  bool _isPhoneShippingValid(String phoneShipping) {
    return phoneShipping.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isFirstNameShippingValid(firstNameShipping) &&
        _isLastNameShippingValid(lastNameShipping) &&
        _isCompanyShippingValid(companyShipping) &&
        _isAddress1ShippingValid(address1Shipping) &&
        _isAddress2ShippingValid(address2Shipping) &&
        _isCityShippingValid(cityShipping) &&
        _isPostCodeShippingValid(postCodeShipping) &&
        _isCountryShippingValid(countryShipping) &&
        _isStateShippingValid(stateShipping) &&
        _isPhoneShippingValid(phoneShipping);
  }

  @override
  Sink get inputCustomerProfileEditData =>
      _customerProfileEditStreamController.sink;

  @override
  Stream<CustomerDetailEntity> get outputCustomerProfileEditData =>
      _customerProfileEditStreamController.stream.map((data) => data);
}

abstract class CustomerProfileEditViewModelInputs {
  void setFirstNameShipping(String firstNameShipping);
  void setLastNameShipping(String lastNameShipping);
  void setCompanyShipping(String companyShipping);
  void setAddress1Shipping(String address1Shipping);
  void setAddress2Shipping(String address2Shipping);
  void setCityShipping(String cityShipping);
  void setPostCodeShipping(String postCodeShipping);
  void setCountryShipping(String countryShipping);
  void setStateShipping(String stateShipping);
  void setPhoneShipping(String phoneShipping);

  Sink get inputFirstNameShipping;
  Sink get inputLastNameShipping;
  Sink get inputCompanyShipping;
  Sink get inputAddress1Shipping;
  Sink get inputAddress2Shipping;
  Sink get inputCityShipping;
  Sink get inputPostCodeShipping;
  Sink get inputCountryShipping;
  Sink get inputStateShipping;
  Sink get inputPhoneShipping;
  Sink get inputIsAllInputsValid;
  Sink get inputCustomerProfileEditData;
}

abstract class CustomerProfileEditViewModelOutputs {
  Stream<bool> get outputIsFirstNameShippingValid;
  Stream<bool> get outputIsLastNameShippingValid;
  Stream<bool> get outputIsCompanyShippingValid;
  Stream<bool> get outputIsAddress1ShippingValid;
  Stream<bool> get outputIsAddress2ShippingValid;
  Stream<bool> get outputIsCityShippingValid;
  Stream<bool> get outputIsPostCodeShippingValid;
  Stream<bool> get outputIsCountryShippingValid;
  Stream<bool> get outputIsStateShippingValid;
  Stream<bool> get outputIsPhoneShippingValid;
  Stream<bool> get outputIsAllInputsValid;
  Stream<CustomerDetailEntity> get outputCustomerProfileEditData;
}
