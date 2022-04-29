import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flut_all_content/presentation/store_details/store_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app/di.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({Key? key}) : super(key: key);

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final StoreDetailsViewModel _storeDetailsViewModel =
      instance<StoreDetailsViewModel>();

  _bind() {
    _storeDetailsViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _storeDetailsViewModel.outputState,
        builder: (context, snapshot) {
          return Scaffold(
            body: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _storeDetailsViewModel.start();
                }) ??
                Container(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title:  Text(AppStrings.storeDetails.tr()),
        elevation: AppSize.s0,
        iconTheme: IconThemeData(
            //back button
            color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        centerTitle: true,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: StreamBuilder<SingleStoreDetail>(
            stream: _storeDetailsViewModel.outputStoreDetails,
            builder: (context, snapshot) {
              return _getItems(snapshot.data);
            },
          ),
        ),
      ),
    );
  }

  Widget _getItems(SingleStoreDetail? singleStoreDetail) {
    if (singleStoreDetail != null) {
      return Column(
        children: [
          Center(
            child: Image.network(
              singleStoreDetail.storeImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          ),
          _getSection(AppStrings.details.tr()),
          _getInfoText(singleStoreDetail.details),
          _getSection(AppStrings.services.tr()),
          _getInfoText(singleStoreDetail.services),
          _getSection(AppStrings.about.tr()),
          _getInfoText(singleStoreDetail.about),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget _getInfoText(String details) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Text(
        details,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  @override
  void dispose() {
    _storeDetailsViewModel.dispose();
    super.dispose();
  }
}
