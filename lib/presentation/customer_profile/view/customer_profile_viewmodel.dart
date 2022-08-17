import 'package:rxdart/rxdart.dart';

import '/domain/entities/entities.dart';
import '/domain/usecase/customer_profile_usecase.dart';
import '/presentation/base/base_viewmodel.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';

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

  Future<void> _getCustomerProfile() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
    );
    (await _customerProfileUsecase.execute(CustomerDetailEntity().id!)).fold(
      (failure) {
        inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message),
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
