import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/data_source/remote_data_source.dart';
import 'package:cartanawc_app/data/network/dio_factory.dart';
import 'package:cartanawc_app/data/network/network_info.dart';
import 'package:cartanawc_app/data/repositories/repository_impl.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/customer_profile_usecase.dart';
import 'package:cartanawc_app/domain/usecase/login_usecase.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_viewmodel.dart';
import 'package:cartanawc_app/presentation/login/login_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // APIService
  instance.registerLazySingleton<APIService>(() => APIServiceImpl());

  // SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // DioFactory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // App Service Client
  // final dio = await instance<DioFactory>().getDio();
  // instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // Local Data Source
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initCustomerProfileModule() {
  if (!GetIt.I.isRegistered<CustomerProfileUsecase>()) {
    instance.registerFactory<CustomerProfileUsecase>(
        () => CustomerProfileUsecase(instance()));
    instance.registerFactory<CustomerProfileViewModel>(
        () => CustomerProfileViewModel(instance()));
  }
}

void resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
}
