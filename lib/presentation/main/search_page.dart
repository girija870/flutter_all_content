import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.search.tr()),
    );
  }
}
