import 'package:flut_all_content/domain/usecase/store_details_usecase.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';
import 'package:flut_all_content/presentation/common/state_renderer.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/model/model.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInputs, StoreDetailsViewModelOutputs {
  final StoreDetailsUseCase _storeDetailsUseCase;
  final _storeDetailsStreamController = BehaviorSubject<SingleStoreDetail>();

  StoreDetailsViewModel(this._storeDetailsUseCase);

  @override
  void start() {
    _getStoreDetails();
  }

  _getStoreDetails() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _storeDetailsUseCase.execute(null)).fold((failure) {
      //left->failure
      inputState.add(ErrorState(
          stateRendererType: StateRendererType.FULL_SCREEN_ERROR_STATE,
          message: failure.message));
    }, (storeDetail) async {
      inputState.add(ContentState());
      inputStoreDetails.add(storeDetail);
    });
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  @override
  Stream<SingleStoreDetail> get outputStoreDetails =>
      _storeDetailsStreamController.stream.map((storeDetail) => storeDetail);
}

abstract class StoreDetailsViewModelInputs {
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutputs {
  Stream<SingleStoreDetail> get outputStoreDetails;
}
