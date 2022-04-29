import 'package:easy_localization/easy_localization.dart';
import 'package:flut_all_content/app/app.dart';
import 'package:flut_all_content/presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //generally prevent null exception so make sure that neccessary widget is binding.
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      child: Phoenix(child: MyApp()),
      supportedLocales: const [ENGLISH_LOCAL, NEPALI_LOCAL],
      path: ASSETS_PATH_LOCALIZATION));
}
