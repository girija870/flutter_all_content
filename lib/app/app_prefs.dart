import 'package:flut_all_content/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PRESS_KEY_LANG = "PRESS_KEY_LANG";
const String PRESS_KEY_ONBOARDING_SCREEN = "PRESS_KEY_ONBOARDING_SCREEN";
const String PRESS_KEY_IS_USER_LOGGED_IN = "PRESS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PRESS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PRESS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PRESS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PRESS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isIsUserLoggedIn() async {
    return _sharedPreferences.getBool(PRESS_KEY_IS_USER_LOGGED_IN) ?? false;
  }
}
