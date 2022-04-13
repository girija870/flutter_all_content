import 'dart:async';

import 'package:flut_all_content/domain/model.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //implement stream controller
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //send this slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex =
          0; //infinite loop to go the first item inside  slider  [ which redirect toward index 3 if length =5]
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length -
          1; //infinite loop to go the length of slider list [ which redirect toward index 3 if length =5]
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //private function
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImagesAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImagesAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImagesAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImagesAssets.onBoardingLogo4),
      ];

  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

//inputs mean orders that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user clicks on left arrow or swipe  right
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to the stream ..stream input
}

//outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject; //
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
