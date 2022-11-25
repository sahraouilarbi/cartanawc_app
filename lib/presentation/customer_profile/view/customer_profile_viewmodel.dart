import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/usecase/customer_profile_usecase.dart';
import 'package:cartanawc_app/presentation/base/base_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class CustomerProfileViewModel extends BaseViewModel
    with CustomerProfileViewModelInputs, CustomerProfileViewModelOutputs {
  final CustomerProfileUsecase _customerProfileUsecase;

  CustomerProfileViewModel(
    this._customerProfileUsecase,
  );

  final _customerProfileStreamController =
      BehaviorSubject<CustomerDetailEntity>();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  late int customerId;

  @override
  Future<void> start() async {
    customerId = await _appPreferences.getUserId();
    _getCustomerProfile();
  }

  @override
  void dispose() {
    _customerProfileStreamController.close();
    super.dispose();
  }

  Future<void> _getCustomerProfile() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
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
