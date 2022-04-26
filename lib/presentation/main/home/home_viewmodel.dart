import 'package:flut_all_content/domain/usecase/home_usecase.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    // TODO: implement start
  }
}

abstract class HomeViewModelInputs {
  fetchHomeDetails();
}

abstract class HomeViewModelOutPusts {}
