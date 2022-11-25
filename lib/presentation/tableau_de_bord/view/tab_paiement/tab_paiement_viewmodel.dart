import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/usecase/paiement_usecase.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:rxdart/rxdart.dart';

class TabPaiementViewModel extends BaseViewModel
    with TabPaiementViewModelInputs, TabPaiementViewModelOutputs {
  final PaiementUsecase paiementUsecase;
  TabPaiementViewModel(this.paiementUsecase);
  final _paiementStreamController = BehaviorSubject<List<PaiementEntity>>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late int _customerId;
  @override
  Sink get inputPaiement => _paiementStreamController.sink;

  @override
  Stream<List<PaiementEntity>> get outputPaiement =>
      _paiementStreamController.stream.map((e) => e);

  @override
  Future<void> start() async {
    await _loadData();
  }

  @override
  void dispose() {}

  Future<void> _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    _customerId = await _appPreferences.getUserId();
    (await paiementUsecase.execute(_customerId)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (paiements) async {
        inputState.add(ContentState());
        final List<PaiementEntity> _paiements = paiements;
        inputPaiement.add(_paiements);
      },
    );
  }
}

abstract class TabPaiementViewModelInputs {
  Sink get inputPaiement;
}

abstract class TabPaiementViewModelOutputs {
  Stream<List<PaiementEntity>> get outputPaiement;
}
