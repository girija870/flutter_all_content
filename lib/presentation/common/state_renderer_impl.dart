import 'package:flut_all_content/data/mapper/mapper.dart';
import 'package:flut_all_content/presentation/common/state_renderer.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

//loading state (popup and full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading;

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
      StateRendererType.CONTENT_SCREEN_STATE!;
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
