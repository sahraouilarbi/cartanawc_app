import 'dart:ffi';
import 'package:rxdart/subjects.dart';

import '/domain/entities/entities.dart';
import '/domain/usecase/magasins_cosmetiques_usecase.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';
import '/presentation/pages.dart';

class TabviewExplorerViewModel extends BaseViewModel
    with TabviewExplorerViewModelInput, TabviewExplorerViewModelOutput {
  final MagasinsCosmetiquesUseCase _cosmetiquesUseCase;
  TabviewExplorerViewModel(this._cosmetiquesUseCase);

  final _magasinsCosmetiquesStreamController =
      BehaviorSubject<List<MagasinCosmetiqueEntity>>();

  @override
  Future<void> start() async {
    _loadData();
  }

  @override
  void dispose() {
    _magasinsCosmetiquesStreamController.close();
    super.dispose();
  }

  Future<void> _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    (await _cosmetiquesUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (data) {
        inputState.add(
          ContentState(),
        );
        final List<MagasinCosmetiqueEntity> _list = data;
        inputMagasinsCosmetiques.add(_list);
      },
    );
  }

  @override
  Sink get inputMagasinsCosmetiques =>
      _magasinsCosmetiquesStreamController.sink;

  @override
  Stream<List<MagasinCosmetiqueEntity>> get outputMagasinsCosmetiques =>
      _magasinsCosmetiquesStreamController.stream.map((e) => e);
}

abstract class TabviewExplorerViewModelInput {
  Sink get inputMagasinsCosmetiques;
}

abstract class TabviewExplorerViewModelOutput {
  Stream<List<MagasinCosmetiqueEntity>> get outputMagasinsCosmetiques;
}
