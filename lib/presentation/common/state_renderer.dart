import 'package:flut_all_content/data/mapper/mapper.dart';
import 'package:flut_all_content/presentation/resources/assets_manager.dart';
import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/font_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/resources/styles_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

enum StateRendererType {
  //popup state
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS_STATE,

  //full screen state
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, //the ui of the screen
  EMPTY_SCREEN_STATE, // empty view when we receive no data from api side for list screen
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryActionFunction;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading.tr(),
        title = title ?? EMPTY,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(
            context, [_getAnimatedWidget(JsonAssets.loading)]);

      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedWidget(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);

      case StateRendererType.POPUP_SUCCESS_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedWidget(JsonAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);

      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemInColumn(
            [_getAnimatedWidget(JsonAssets.loading), _getMessage(message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemInColumn([
          _getAnimatedWidget(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retry_again.tr(), context)
        ]);

      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();

      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemInColumn(
            [_getAnimatedWidget(JsonAssets.empty), _getMessage(message)]);

      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedWidget(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), //json image
    );
  }

  Widget _getMessage(String message) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(
              AppPadding.p18,
            ),
            child: Text(message,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s16))));
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                    StateRendererType.FULL_SCREEN_ERROR_STATE) {
                  retryActionFunction
                      ?.call(); //to call the api function again to retry
                } else {
                  Navigator.of(context)
                      .pop(); // popup the error state so we need to dismiss the dialog
                }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
