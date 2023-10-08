import 'package:flut_all_content/data/mapper/mapper.dart';
import 'package:flut_all_content/presentation/common/state_renderer.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

//loading state (popup and full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading.tr();

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//error state (popup and full screen)
class ErrorState extends FlowState {
  StateRendererType? stateRendererType;
  String? message;

  ErrorState({this.stateRendererType, this.message});

  @override
  String getMessage() => message!;

  @override
  StateRendererType getStateRendererType() => stateRendererType!;
}

//content state (popup and full screen)
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

//empty state (popup and full screen)
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

//success state
class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.POPUP_SUCCESS_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
            //showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());

            //return the content ui of the screen
            return contentScreenWidget;
          } else //stateRenderType.FULL_SCREEN_LOADING_STATE
          {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }

      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
            //showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());

            //return the content ui of the screen
            return contentScreenWidget;
          } else //stateRenderType.FULL_SCREEN_ERROR_STATE
          {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case SuccessState:
        {
          //first need to check previous(loading) dialog is exists or not if exist then dismiss
          dismissDialog(context);

          //show dialog box
          showPopUp(
              context, StateRendererType.POPUP_SUCCESS_STATE, getMessage(),
              title: AppStrings.success.tr());
          //return content UI of the screen other wise it will show dialog with black background
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = EMPTY}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            title: title,
            retryActionFunction: () {})));
  }
}
