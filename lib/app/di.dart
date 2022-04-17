import 'package:flut_all_content/app/app_prefs.dart';
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
}
