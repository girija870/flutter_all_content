import 'dart:async';

import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/domain/usecase/home_usecase.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';
import 'package:flut_all_content/presentation/common/state_renderer.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  final StreamController _homeDataStreamController =
      BehaviorSubject<HomeData>();
  //inputs
  @override
  void start() {
    _getHomeDetails();
  }

  _getHomeDetails() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _homeUseCase.execute(null)).fold((failure) {
      //left->error
      inputState.add(ErrorState(
          stateRendererType: StateRendererType.FULL_SCREEN_ERROR_STATE,
          message: failure.message));
    }, (homeObject) {
      //right-> success
      inputState.add(ContentState());
      _homeDataStreamController.add(homeObject.data);
    });
  }

  @override
  void dispose() {
    _homeDataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeHomeData => _homeDataStreamController.sink;

  //outputs
  @override
  Stream<HomeData>? get outputHomeHomeData =>
      _homeDataStreamController.stream.map((homeData) => homeData);
}

abstract class HomeViewModelInputs {
  Sink get inputHomeHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeData>? get outputHomeHomeData;
}
