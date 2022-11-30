import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/data_source/remote_data_source.dart';
import 'package:cartanawc_app/data/network/dio_factory.dart';
import 'package:cartanawc_app/data/network/network_info.dart';
import 'package:cartanawc_app/data/repositories/repository_impl.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/contact_usecase.dart';
import 'package:cartanawc_app/domain/usecase/usecases.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_explorer/tabview_explorer_viewmodel.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/products_viewmodel.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/tabview_categories_viewmodel.dart';
import 'package:cartanawc_app/presentation/contact/view/contact_viewmodel.dart';
import 'package:cartanawc_app/presentation/customer_profile/view/customer_profile_viewmodel.dart';
import 'package:cartanawc_app/presentation/customer_profile_edit/view/customer_profile_edit_viewmodel.dart';
import 'package:cartanawc_app/presentation/customer_profile_edit_copy/view/customer_profile_edit_copy_viewmodel.dart';
import 'package:cartanawc_app/presentation/devenir_distributeur/view/devenir_distributeur_viewmodel.dart';
import 'package:cartanawc_app/presentation/login/view/login_viewmodel.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_commandes/tab_commander_viewmodel.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_historique/tab_historique_viewmodel.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_paiement/tab_paiement_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initDIAppModule() async {
  // APIService
  //instance.registerLazySingleton<APIService>(() => APIService(dio));

  // SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App prefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferencesImpl(
      instance(),
    ),
  );

  // network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(DataConnectionChecker()),
  );

  // DioFactory
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(
      instance(),
    ),
  );

  // App Service Client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<APIService>(
    () => APIService(dio),
  );

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

// TODO A Verifier <CustomerProfileEditCopyUsecase> au lieu de <CustomerDetailEntity> !!
// void initDICustomerProfileEditCopyPageModule() {
//   if (!GetIt.I.isRegistered<CustomerDetailEntity>()) {
//     instance.registerFactory<CustomerDetailEntity>(
//       () => CustomerDetailEntity(),
//     );
//     instance.registerFactory<CustomerProfileEditCopyViewModel>(
//       () => CustomerProfileEditCopyViewModel(
//         instance(),
//         instance(),
//       ),
//     );
//   }
// }

void initDIGetCategoriesModule() {
  if (!GetIt.I.isRegistered<CategoriesUsecase>()) {
    instance.registerFactory<CategoriesUsecase>(
      () => CategoriesUsecase(
        instance(),
      ),
    );
    instance.registerFactory<TabCategoriesViewModel>(
      () => TabCategoriesViewModel(
        instance(),
      ),
    );
  }
}

void initDITabCommanderModule() {
  if (!GetIt.I.isRegistered<CommanderUsecase>()) {
    instance.registerFactory<CommanderUsecase>(
      () => CommanderUsecase(
        instance(),
      ),
    );
    instance.registerFactory<TabCommanderViewModel>(
      () => TabCommanderViewModel(
        instance(),
      ),
    );
  }
}

void initDITabHistoriqueModule() {
  if (!GetIt.I.isRegistered<HistoriqueUsecase>()) {
    instance.registerFactory<HistoriqueUsecase>(
      () => HistoriqueUsecase(
        instance(),
      ),
    );
    instance.registerFactory<TabHistoriqueViewModel>(
      () => TabHistoriqueViewModel(
        instance(),
      ),
    );
  }
}

void initDITabPaiementModule() {
  if (!GetIt.I.isRegistered<PaiementUsecase>()) {
    instance.registerFactory<PaiementUsecase>(
      () => PaiementUsecase(
        instance(),
      ),
    );
    instance.registerFactory<TabPaiementViewModel>(
      () => TabPaiementViewModel(
        instance(),
      ),
    );
  }
}

void initDIGetProductsModule() {
  if (!GetIt.I.isRegistered<ProductsUsecase>()) {
    instance.registerFactory<ProductsUsecase>(
      () => ProductsUsecase(
        instance(),
      ),
    );
    instance.registerFactory<ProductsViewModel>(
      () => ProductsViewModel(
        instance(),
      ),
    );
  }
}

// Devenir Distributeur DI
void initDIDevenirDistributeurModule() {
  if (!GetIt.I.isRegistered<DevenirDistributeurUsecase>()) {
    instance.registerFactory<DevenirDistributeurUsecase>(
      () => DevenirDistributeurUsecase(
        instance(),
      ),
    );
    instance.registerFactory<DevenirDistributeurViewModel>(
      () => DevenirDistributeurViewModel(
        instance(),
      ),
    );
  }
}

// Contact DI
void initDIContactModule() {
  if (!GetIt.I.isRegistered<ContactUsecase>()) {
    instance.registerFactory<ContactUsecase>(
      () => ContactUsecase(
        instance(),
      ),
    );
    instance.registerFactory<ContactViewModel>(
      () => ContactViewModel(
        instance(),
      ),
    );
  }
}

// Magasins Cosmétiques (Tab : Explorer)
void initDIMagasinsCosmetiquesModule() {
  if (!GetIt.I.isRegistered<MagasinsCosmetiquesUseCase>()) {
    instance.registerFactory<MagasinsCosmetiquesUseCase>(
      () => MagasinsCosmetiquesUseCase(
        instance(),
      ),
    );
    instance.registerFactory<TabviewExplorerViewModel>(
      () => TabviewExplorerViewModel(
        instance(),
      ),
    );
  }
}

void resetDIModules() {
  instance.reset(dispose: false);
  initDIAppModule();
  initDIContactModule();
  initDICustomerProfileEditCopyModule();
  //initDICustomerProfileEditCopyPageModule();
  initDICustomerProfileEditModule();
  initDICustomerProfileModule();
  initDIDevenirDistributeurModule();
  initDIGetCategoriesModule();
  initDIGetProductsModule();
  initDILoginModule();
  initDIMagasinsCosmetiquesModule();
  initDITabCommanderModule();
  initDITabHistoriqueModule();
  initDITabPaiementModule();
}
