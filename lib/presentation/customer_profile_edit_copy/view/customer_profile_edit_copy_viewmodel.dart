import 'dart:async';

import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/usecase/customer_profile_usecase.dart';
import 'package:rxdart/rxdart.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/domain/usecase/customer_profile_edit_usecase.dart';
import '/presentation/base/base_viewmodel.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';

class CustomerProfileEditCopyViewModel extends BaseViewModel
    with
        CustomerProfileEditCopyViewModelInputs,
        CustomerProfileEditCopyViewModelOutputs {
  final CustomerProfileUsecase _customerProfileUsecase;
  final ShippingEditUsecase _shippingEditUsecase;

  CustomerProfileEditCopyViewModel(
    this._customerProfileUsecase,
    this._shippingEditUsecase,
  );

  // final CustomerProfileEditCopyPage customerProfileEditCopyPage =
  //     instance<CustomerProfileEditCopyPage>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  late int customerId;

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

  final StreamController isCustomerProfilEditSuccessfullyStreamController =
      StreamController<bool>();

  final StreamController _customerProfileEditStreamController =
      BehaviorSubject<CustomerDetailEntity>();

  late CustomerDetailEntity customerDetailEntity;
  late ShippingEditEntity shippingEditEntity;

  String firstNameShipping = '';
  String lastNameShipping = '';
  String companyShipping = '';
  String address1Shipping = '';
  String address2Shipping = '';
  String cityShipping = '';
  String postcodeShipping = '';
  String countryShipping = '';
  String stateShipping = '';
  String phoneShipping = '';

  @override
  Future<void> start() async {
    customerId = await _appPreferences.getUserId();
    _getCustomerProfile();
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

  Future<void> _getCustomerProfile() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenErrorState,
      ),
    );
    (await _customerProfileUsecase.execute(customerId)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (customerProfile) {
        inputState.add(ContentState());
        firstNameShipping = customerProfile.shipping!.firstName;
        lastNameShipping = customerProfile.shipping!.lastName;
        companyShipping = customerProfile.shipping!.company;
        address1Shipping = customerProfile.shipping!.address1;
        address2Shipping = customerProfile.shipping!.address2;
        cityShipping = customerProfile.shipping!.city;
        postcodeShipping = customerProfile.shipping!.postcode;
        countryShipping = customerProfile.shipping!.country;
        stateShipping = customerProfile.shipping!.state;
        phoneShipping = customerProfile.shipping!.phone;
        inputCustomerProfileEditData.add(
          CustomerDetailEntity(
            id: customerProfile.id,
            email: customerProfile.email,
            firstName: customerProfile.firstName,
            lastName: customerProfile.lastName,
            role: customerProfile.role,
            billing: customerProfile.billing,
            shipping: customerProfile.shipping,
            avatarUrl: countryShipping,
          ),
        );
      },
    );
  }

  Future<void> updateShippingInformations() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
    );
    shippingEditEntity = ShippingEditEntity(
      customerId,
      ShippingEntity(
        firstName: firstNameShipping,
        lastName: lastNameShipping,
        company: companyShipping,
        address1: address1Shipping,
        address2: address2Shipping,
        city: cityShipping,
        postcode: postcodeShipping,
        country: countryShipping,
        state: stateShipping,
        phone: phoneShipping,
      ),
    );

    (await _shippingEditUsecase.execute(shippingEditEntity)).fold(
        (failure) => inputState.add(
              ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message),
            ), (data) {
      inputState.add(ContentState());
      isCustomerProfilEditSuccessfullyStreamController.add(true);
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
  void setPostcodeShipping(String _postCodeShipping) {
    inputPostCodeShipping.add(_postCodeShipping);
    postcodeShipping = _postCodeShipping;
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
        _isPostCodeShippingValid(postcodeShipping) &&
        _isCountryShippingValid(countryShipping) &&
        _isStateShippingValid(stateShipping) &&
        _isPhoneShippingValid(phoneShipping);
  }

  @override
  Sink get inputCustomerProfileEditData =>
      _customerProfileEditStreamController.sink;

  @override
  Stream<CustomerDetailEntity> get outputCustomerProfileEditData =>
      _customerProfileEditStreamController.stream
          .map((data) => data as CustomerDetailEntity);
}

abstract class CustomerProfileEditCopyViewModelInputs {
  void setFirstNameShipping(String firstNameShipping);
  void setLastNameShipping(String lastNameShipping);
  void setCompanyShipping(String companyShipping);
  void setAddress1Shipping(String address1Shipping);
  void setAddress2Shipping(String address2Shipping);
  void setCityShipping(String cityShipping);
  void setPostcodeShipping(String postCodeShipping);
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

abstract class CustomerProfileEditCopyViewModelOutputs {
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
