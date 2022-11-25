import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/usecase/historique_usecase.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:rxdart/subjects.dart';

class TabHistoriqueViewModel extends BaseViewModel
    with TabHistoriqueViewModelInputs, TabHistoriqueViewModelOutputs {
  final HistoriqueUsecase historiqueUsecase;
  TabHistoriqueViewModel(this.historiqueUsecase);

  final AppPreferences _appPreferences = instance<AppPreferences>();

  final _historiqueStreamController = BehaviorSubject<List<OrderEntity>>();
  late int _customerId;

  @override
  Sink get inputHistoque => _historiqueStreamController.sink;

  @override
  Stream<List<OrderEntity>> get outputHistoque =>
      _historiqueStreamController.stream.map((e) => e);

  @override
  Future<void> start() async {
    await _loadData();
  }

  @override
  void dispose() {
    _historiqueStreamController.close();
  }

  Future<void> _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    _customerId = await _appPreferences.getUserId();
    (await historiqueUsecase.execute(_customerId)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (historique) async {
        inputState.add(ContentState());
        final List<OrderEntity> _historique = historique;
        inputHistoque.add(_historique);
      },
    );
  }
}

abstract class TabHistoriqueViewModelInputs {
  Sink get inputHistoque;
}

abstract class TabHistoriqueViewModelOutputs {
  Stream<List<OrderEntity>> get outputHistoque;
}
