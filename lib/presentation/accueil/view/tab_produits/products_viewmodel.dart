import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/usecase/products_usecase.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_renderer.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:rxdart/subjects.dart';

class ProductsViewModel extends BaseViewModel
    with ProductsViewModelInput, ProductsViewModelOutput {
  final ProductsUsecase productsUsecase;
  ProductsViewModel(this.productsUsecase);
  final _productsStreamController = BehaviorSubject<List<ProductEntity>>();

  int categoryId = -1;

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
    (await productsUsecase.execute(categoryId)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (products) {
        inputState.add(ContentState());
        inputProducts.add(products);
      },
    );
  }

  @override
  Sink get inputProducts => _productsStreamController.sink;

  @override
  Stream<List<ProductEntity>> get outputProducts =>
      _productsStreamController.stream.map((_e) => _e);
}

abstract class ProductsViewModelInput {
  Sink get inputProducts;
}

abstract class ProductsViewModelOutput {
  Stream<List<ProductEntity>> get outputProducts;
}
