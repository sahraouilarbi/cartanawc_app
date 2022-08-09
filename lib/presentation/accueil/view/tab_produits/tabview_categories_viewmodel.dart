import 'dart:ffi';

import 'package:rxdart/subjects.dart';

import '/domain/entities/entities.dart';
import '/domain/usecase/categories_usecase.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/state_render/state_renderer.dart';
import '/presentation/pages.dart';

class TabCategoriesViewModel extends BaseViewModel
    with TabCategoriesViewModelInput, TabCategoriesViewModelOutput {
  final CategoriesUsecase categoriesUsecase;
  TabCategoriesViewModel(this.categoriesUsecase);

  final _categoriesStreamController = BehaviorSubject<List<CategoryEntity>>();
  @override
  void start() {
    _loadData();
  }

  @override
  void dispose() {
    _categoriesStreamController.close();
  }

  Future<void> _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    (await categoriesUsecase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (categories) async {
      inputState.add(ContentState());
      final List<CategoryEntity> _categoriesParentAndNonClass = categories
          .where((element) =>
              element.categoryParent == 0 &&
              element.categorySlug != 'non-classe')
          .toList();
      inputCategories.add(_categoriesParentAndNonClass);
    });
  }

  @override
  Sink get inputCategories => _categoriesStreamController.sink;

  @override
  Stream<List<CategoryEntity>> get outputCategories =>
      _categoriesStreamController.stream.map((e) => e);
}

abstract class TabCategoriesViewModelInput {
  Sink get inputCategories;
}

abstract class TabCategoriesViewModelOutput {
  Stream<List<CategoryEntity>> get outputCategories;
}
