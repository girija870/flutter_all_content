import 'dart:async';

import 'package:flut_all_content/app/functions.dart';
import 'package:flut_all_content/domain/usecase/forgot_password_usecase.dart';
import 'package:flut_all_content/presentation/base/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _isFormValidStreamController =
      StreamController<void>.broadcast();

  String email = "";

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase); //inputs
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _emailController.close();
    _isFormValidStreamController.close();
  }

  @override
  void resetPassword() async {
    (await _forgotPasswordUseCase.execute(email))
        .fold((failure) => () {}, (data) => () {});
  }

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _isValid();
  }

  @override
  Sink get inputEmail => _emailController.sink;

  @override
  Sink get isInputValid => _isFormValidStreamController.sink;

  @override
  Stream<bool> get outputsEmailValid =>
      _emailController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get isOutputsValid =>
      _isFormValidStreamController.stream.map((_) => _isFromInputValid());

  _isValid() {
    isInputValid.add(null);
  }

  bool _isFromInputValid() {
    return isEmailValid(email);
  }
}

abstract class ForgotPasswordViewModelInputs {
  void setEmail(String email);

  void resetPassword();

  Sink get inputEmail;

  Sink get isInputValid;
}

abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputsEmailValid;

  Stream<bool> get isOutputsValid;
}
