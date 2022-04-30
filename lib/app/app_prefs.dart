import 'dart:ui';

import 'package:flut_all_content/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PRESS_KEY_LANG = "PRESS_KEY_LANG";
const String PRESS_KEY_ONBOARDING_SCREEN = "PRESS_KEY_ONBOARDING_SCREEN";
const String PRESS_KEY_IS_USER_LOGGED_IN = "PRESS_KEY_IS_USER_LOGGED_IN";
const String PRESS_KEY_IS_USER_TOKEN = "PRESS_KEY_IS_USER_TOKEN";

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

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.NEPALI.getValue()) {
      //save pref with english language
      _sharedPreferences.setString(
          PRESS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      //save pref with nepali language
      _sharedPreferences.setString(
          PRESS_KEY_LANG, LanguageType.NEPALI.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.NEPALI.getValue()) {
      //return nepali local
      return NEPALI_LOCAL;
    } else {
      //return english local
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PRESS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PRESS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PRESS_KEY_IS_USER_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PRESS_KEY_IS_USER_TOKEN) ??
        "Token Not Saved";
  }

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PRESS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isIsUserLoggedIn() async {
    return _sharedPreferences.getBool(PRESS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<bool> logout() async {
    return _sharedPreferences.remove(PRESS_KEY_IS_USER_LOGGED_IN);
  }
}
