import 'dart:async';

import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //shared variables and functions that will be used through any view model
  final StreamController _inputStateStreamController =
      StreamController<FlowState>();

  @override
  // TODO: implement inputState
  Sink get inputState => _inputStateStreamController.sink;

  @override
  // TODO: implement outputState
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

abstract class BaseViewModelInputs {
  void start(); // will be called while int. of view model
  void dispose(); // will be called when viewModel dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
