import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, NEPALI }

const String ENGLISH = "en";
const String NEPALI = "ne";
const String ASSETS_PATH_LOCALIZATION = "assets/translations";
const Locale NEPALI_LOCAL = Locale("ne", "NE");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.NEPALI:
        return NEPALI;
    }
  }
}
