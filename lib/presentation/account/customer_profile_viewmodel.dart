import 'dart:ffi';

import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/usecase/customer_profile_usecase.dart';
import 'package:cartanawc_app/presentation/base/base_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class CustomerProfileViewModel extends BaseViewModel
    with CustomerProfileViewModelInputs, CustomerProfileViewModelOutputs {
  CustomerProfileViewModel(this._customerProfileUsecase);

  final CustomerProfileUsecase _customerProfileUsecase;

  final _customerProfileStreamController =
      BehaviorSubject<CustomerDetailEntity>();

  @override
  void start() {
    _getCustomerProfile();
  }

  @override
  void dispose() {
    _customerProfileStreamController.close();
    super.dispose();
  }

  _getCustomerProfile() async {
    inputState.add(
      LoadingState(
          stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE),
    );
    (await _customerProfileUsecase.execute(CustomerDetailEntity().id)).fold(
      (failure) {
        inputState.add(
          ErrorState(
              StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message),
        );
      },
      (customerProfile) {
        inputState.add(ContentState());
        inputCustomerProfileData.add(
          CustomerDetailEntity(
            id: customerProfile.id,
            email: customerProfile.email,
            firstName: customerProfile.firstName,
            lastName: customerProfile.lastName,
            role: customerProfile.role,
            billing: customerProfile.billing,
            shipping: customerProfile.shipping,
            avatarUrl: customerProfile.avatarUrl,
          ),
        );
      },
    );
  }

  @override
  Sink get inputCustomerProfileData => _customerProfileStreamController.sink;

  @override
  Stream<CustomerDetailEntity> get outputCustomerProfileData =>
      _customerProfileStreamController.stream.map((data) => data);
}

abstract class CustomerProfileViewModelInputs {
  Sink get inputCustomerProfileData;
}

abstract class CustomerProfileViewModelOutputs {
  Stream<CustomerDetailEntity> get outputCustomerProfileData;
}