import 'dart:async';
import 'dart:io';

import 'package:flut_all_content/app/functions.dart';
import 'package:flut_all_content/domain/usecase/register_usecase.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';
import 'package:flut_all_content/presentation/common/freezed_data_classes.dart';
import 'package:flut_all_content/presentation/common/state_renderer.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();

  final StreamController _profilePictureStreamController =
      StreamController<File>.broadcast();

  final StreamController _allInputsValidStreamController =
      StreamController<void>.broadcast();

  final RegisterUseCase _registerUseCase;

  var registerViewObject = RegisterViewObject("", "", "", "", "", "");

  RegisterViewModel(this._registerUseCase);

  //inputs---
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _mobileNumberStreamController.close();
    _profilePictureStreamController.close();
    _allInputsValidStreamController.close();
    super.dispose();
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerViewObject.userName,
            registerViewObject.countryMobileCode,
            registerViewObject.email,
            registerViewObject.password,
            registerViewObject.mobileNumber,
            registerViewObject.profilePicture)))
        .fold(
            (failure) => {
                  //left-failure
                  inputState.add(ErrorState(
                      stateRendererType: StateRendererType.POPUP_ERROR_STATE,
                      message: failure.message))
                },
            (authenticationData) => {
                  //right-> success
                  inputState.add(ContentState())

                  //navigate to main screen
                });
  }

  @override
  setUserName(String userName) {
    if (_isUserNameValid(userName)) {
      //update data to register_view object with userName
      registerViewObject = registerViewObject.copyWith(userName: userName);
    } else {
      //reset username value in registerView object
      registerViewObject = registerViewObject.copyWith(userName: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  setCountryMobileCode(String countryMobileCode) {
    if (countryMobileCode.isNotEmpty) {
      //update data to register_view object with countryMobileCode
      registerViewObject =
          registerViewObject.copyWith(countryMobileCode: countryMobileCode);
    } else {
      //reset countryMobileCode value in registerView object
      registerViewObject = registerViewObject.copyWith(countryMobileCode: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  setEmail(String email) {
    if (isEmailValid(email)) {
      //update data to register_view object with email
      registerViewObject = registerViewObject.copyWith(email: email);
    } else {
      //reset email value in registerView object
      registerViewObject = registerViewObject.copyWith(email: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  setPassword(String password) {
    if (_isPasswordValid(password)) {
      //update data to register_view object with password
      registerViewObject = registerViewObject.copyWith(password: password);
    } else {
      //reset password value in registerView object
      registerViewObject = registerViewObject.copyWith(password: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  setMobileNumber(String mobileNumber) {
    if (_isMobileNumberValid(mobileNumber)) {
      //update data to register_view object with mobileNumber
      registerViewObject =
          registerViewObject.copyWith(mobileNumber: mobileNumber);
    } else {
      //reset mobileNumber value in registerView object
      registerViewObject = registerViewObject.copyWith(mobileNumber: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  setProfilePicture(File profilePicture) {
    if (profilePicture.path.isNotEmpty) {
      //update data to register_view object with profilePicture
      registerViewObject =
          registerViewObject.copyWith(profilePicture: profilePicture.path);
    } else {
      //reset profilePicture value in registerView object
      registerViewObject = registerViewObject.copyWith(profilePicture: "");
    }
    _validate(); //step 1 trigger the validate for botton visiblity
  }

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputAllInputsValid =>
      _allInputsValidStreamController.sink; //setp 2-

  //outputs
  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserNameValid) => isUserNameValid ? null : "invalid Username");

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : "Invalid Email");

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid
      .map((isPasswordValid) => isPasswordValid ? null : "Invalid Password");

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      _mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumberV =>
      outputIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : "Invalid Mobile Number");

  @override
  Stream<File> get outputIsProfilePictureValid =>
      _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsAllInputValid =>
      _allInputsValidStreamController.stream
          .map((_) => _validateAllInputs()); //step 3

  //private function
  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _validateAllInputs() {
    //step 4 check all input validation for visibility of button
    return registerViewObject.userName.isNotEmpty &&
        registerViewObject.countryMobileCode.isNotEmpty &&
        registerViewObject.email.isNotEmpty &&
        registerViewObject.password.isNotEmpty &&
        registerViewObject.mobileNumber.isNotEmpty &&
        registerViewObject.profilePicture.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(
        null); //can do directly because of  _allInputsValidStreamController.sink above
  }
}

abstract class RegisterViewModelInputs {
  setUserName(String userName);

  setCountryMobileCode(String countryMobileCode);

  setEmail(String email);

  setPassword(String password);

  setMobileNumber(String mobileNumber);

  setProfilePicture(File profilePicture);

  register();

  Sink get inputUserName;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputMobileNumber;

  Sink get inputProfilePicture;

  Sink get inputAllInputsValid;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumberV;

  Stream<File> get outputIsProfilePictureValid;

  Stream<bool> get outputIsAllInputValid;
}
