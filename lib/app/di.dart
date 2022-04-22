import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flut_all_content/app/app_prefs.dart';
import 'package:flut_all_content/data/data_source/remote_data_source.dart';
import 'package:flut_all_content/data/network/app_api.dart';
import 'package:flut_all_content/data/network/dio_factory.dart';
import 'package:flut_all_content/data/network/network_info.dart';
import 'package:flut_all_content/data/repository/repository_impl.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/forgot_password_usecase.dart';
import 'package:flut_all_content/domain/usecase/login_usecase.dart';
import 'package:flut_all_content/domain/usecase/register_usecase.dart';
import 'package:flut_all_content/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:flut_all_content/presentation/login/login_viewmodel.dart';
import 'package:flut_all_content/presentation/register/register_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPref = await SharedPreferences.getInstance();

  //register sharedPrefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  //register appPrefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(
      instance())); // instance<SharedPreferences>() = <SharedPreferences> doest not require because get recognize automatically

//network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  //dio factory
  instance.registerLazySingleton<DioFactory>(() =>
      DioFactory(instance())); //automatically get _appPreferences instance

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),
      instance())); //(instance(),instance()) -> instance of remoteDataSource & NetworkInfo
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));

    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initRegisterModuleModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));

    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
  }
}
