import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/prefs/app_prefs.dart';
import '/data/api/api_service.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/network/dio_factory.dart';
import '/data/network/network_info.dart';
import '/data/repositories/repository_impl.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/categories_usecase.dart';
import '/domain/usecase/commander_usecase.dart';
import '/domain/usecase/customer_profile_edit_usecase.dart';
import '/domain/usecase/customer_profile_usecase.dart';
import '/domain/usecase/devenir_distributeur_usecase.dart';
import '/domain/usecase/login_usecase.dart';
import '/domain/usecase/products_usecase.dart';
import '/presentation/accueil/view/tab_produits/products_viewmodel.dart';
import '/presentation/accueil/view/tab_produits/tabview_categories_viewmodel.dart';
import '/presentation/customer_profile/view/customer_profile_viewmodel.dart';
import '/presentation/customer_profile_edit/view/customer_profile_edit_viewmodel.dart';
import '/presentation/customer_profile_edit_copy/view/customer_profile_edit_copy_viewmodel.dart';
import '/presentation/devenir_distributeur/view/devenir_distributeur_viewmodel.dart';
import '/presentation/login/view/login_viewmodel.dart';
import '/presentation/tableau_de_bord/view/tab_commandes/tab_commander_viewmodel.dart';

final instance = GetIt.instance;
Future<void> initDIAppModule() async {
  // APIService
  //instance.registerLazySingleton<APIService>(() => APIService(dio));

  // SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferencesImpl(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // DioFactory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // App Service Client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<APIService>(() => APIService(dio));

  // Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      instance(),
    ),
  );

  // Local Data Source
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance(),
      instance(),
      instance(),
    ),
  );
}

void initDILoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(
      () => LoginUsecase(
        instance(),
      ),
    );
    instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(
        instance(),
      ),
    );
  }
}

void initDICustomerProfileModule() {
  if (!GetIt.I.isRegistered<CustomerProfileUsecase>()) {
    instance.registerFactory<CustomerProfileUsecase>(
      () => CustomerProfileUsecase(
        instance(),
      ),
    );
    instance.registerFactory<CustomerProfileViewModel>(
      () => CustomerProfileViewModel(
        instance(),
      ),
    );
  }
}

void initDICustomerProfileEditModule() {
  if (!GetIt.I.isRegistered<ShippingEditUsecase>()) {
    instance.registerFactory<ShippingEditUsecase>(
      () => ShippingEditUsecase(
        instance(),
      ),
    );
    instance.registerFactory<CustomerProfileEditViewModel>(
      () => CustomerProfileEditViewModel(
        instance(),
        instance(),
      ),
    );
  }
}

void initDICustomerProfileEditCopyModule() {
  if (!GetIt.I.isRegistered<ShippingEditUsecase>()) {
    instance.registerFactory<ShippingEditUsecase>(
      () => ShippingEditUsecase(
        instance(),
      ),
    );
    instance.registerFactory<CustomerProfileEditCopyViewModel>(
      () => CustomerProfileEditCopyViewModel(
        instance(),
        instance(),
      ),
    );
  }
}

void initDICustomerProfileEditCopyPageModule() {
  if (!GetIt.I.isRegistered<CustomerDetailEntity>()) {
    instance.registerFactory<CustomerDetailEntity>(
      () => CustomerDetailEntity(),
    );
    instance.registerFactory<CustomerProfileEditCopyViewModel>(
      () => CustomerProfileEditCopyViewModel(
        instance(),
        instance(),
      ),
    );
  }
}

void initDIGetCategoriesModule() {
  if (!GetIt.I.isRegistered<CategoriesUsecase>()) {
    instance.registerFactory<CategoriesUsecase>(
        () => CategoriesUsecase(instance()));
    instance.registerFactory<TabCategoriesViewModel>(
        () => TabCategoriesViewModel(instance()));
  }
}

void initDITabCommanderModule() {
  if (!GetIt.I.isRegistered<CommanderUsecase>()) {
    instance
        .registerFactory<CommanderUsecase>(() => CommanderUsecase(instance()));
    instance.registerFactory<TabCommanderViewModel>(
        () => TabCommanderViewModel(instance()));
  }
}

void initDIGetProductsModule() {
  if (!GetIt.I.isRegistered<ProductsUsecase>()) {
    instance
        .registerFactory<ProductsUsecase>(() => ProductsUsecase(instance()));
    instance.registerFactory<ProductsViewModel>(
        () => ProductsViewModel(instance()));
  }
}

void initDIDevenirDistributeurModule() {
  if (!GetIt.I.isRegistered<DevenirDistributeurUsecase>()) {
    instance.registerFactory<DevenirDistributeurUsecase>(
        () => DevenirDistributeurUsecase(instance()));
    instance.registerFactory<DevenirDistributeurViewModel>(
        () => DevenirDistributeurViewModel(instance()));
  }
}

void resetDIModules() {
  instance.reset(dispose: false);
  initDIAppModule();
  initDILoginModule();
  initDIGetCategoriesModule();
  initDICustomerProfileModule();
  initDICustomerProfileEditModule();
  initDICustomerProfileEditCopyModule();
  initDICustomerProfileEditCopyPageModule();
  initDITabCommanderModule();
  initDIGetProductsModule();
  initDIDevenirDistributeurModule();
}
