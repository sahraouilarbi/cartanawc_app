import 'package:rxdart/rxdart.dart';

import '/core/dependency_injection.dart';
import '/core/prefs/app_prefs.dart';
import '/domain/entities/entities.dart';
import '/domain/usecase/commander_usecase.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';
import '/presentation/pages.dart';

class TabCommanderViewModel extends BaseViewModel
    with TabCommanderViewModelInputs, TabCommanderViewModelOutputs {
  final CommanderUsecase commanderUsecase;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  TabCommanderViewModel(this.commanderUsecase);

  final _productsStreamController = BehaviorSubject<List<ProductEntity>>();

  String _userRole;
  @override
  void start() {
    _loadData();
  }

  @override
  void dispose() {
    _productsStreamController.close();
  }

  Future<void> _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    _userRole = await _appPreferences.getUserRole();
    (await commanderUsecase.execute(_userRole)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (products) async {
      inputState.add(ContentState());
      final List<ProductEntity> _products = products;
      inputProducts.add(_products);
    });
  }

  @override
  Sink get inputProducts => _productsStreamController.sink;

  @override
  Stream<List<ProductEntity>> get outputProducts =>
      _productsStreamController.stream.map((e) => e);
}

abstract class TabCommanderViewModelInputs {
  Sink get inputProducts;
}

abstract class TabCommanderViewModelOutputs {
  Stream<List<ProductEntity>> get outputProducts;
}
