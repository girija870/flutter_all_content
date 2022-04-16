enum LanguageType { ENGLISH, NEPALI }

const String ENGLISH = "en";
const String NEPALI = "np";

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
