import 'package:flut_all_content/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    //Card view theme
    //App bar theme
    //Button theme
    //text theme
    //input decoration theme(text form field)
  );
}
