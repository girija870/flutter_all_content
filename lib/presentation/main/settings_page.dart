import 'package:easy_localization/easy_localization.dart';
import 'package:flut_all_content/app/app_prefs.dart';
import 'package:flut_all_content/data/data_source/local_data_source.dart';
import 'package:flut_all_content/presentation/resources/assets_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/di.dart';
import '../resources/routes_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppPadding.p8),
      children: [
        ListTile(
          title: Text(AppStrings.changeLanguage.tr(),
              style: Theme.of(context).textTheme.headline4),
          leading: SvgPicture.asset(ImagesAssets.changeLangIc),
          trailing: SvgPicture.asset(ImagesAssets.settingsRightArrowIc),
          onTap: () {
            _changeLanguage();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.contactUs.tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImagesAssets.contactUsIc),
          trailing: SvgPicture.asset(ImagesAssets.settingsRightArrowIc),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          title: Text(AppStrings.inviteYourFriends.tr(),
              style: Theme.of(context).textTheme.headline4),
          leading: SvgPicture.asset(ImagesAssets.inviteFriendIc),
          trailing: SvgPicture.asset(ImagesAssets.settingsRightArrowIc),
          onTap: () {
            _inviteFriends();
          },
        ),
        ListTile(
          title: Text(AppStrings.logout.tr(),
              style: Theme.of(context).textTheme.headline4),
          leading: SvgPicture.asset(ImagesAssets.logoutIc),
          trailing: SvgPicture.asset(ImagesAssets.settingsRightArrowIc),
          onTap: () {
            _logout();
          },
        ),
      ],
    );
  }

  void _changeLanguage() {
    _appPreferences.setLanguageChanged();
    Phoenix.rebirth(context); // restart to the app
  }

  void _contactUs() {
    const WebView(
      initialUrl: "https://www.linkedin.com/in/girija-gurung-986157167",
    );
  }

  void _inviteFriends() {}

  void _logout() {
    _appPreferences.logout(); // clear login flag from the app pref
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
