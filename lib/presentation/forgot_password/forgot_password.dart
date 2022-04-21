import 'package:flut_all_content/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:flut_all_content/presentation/resources/assets_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';
import '../common/state_renderer_impl.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ForgotPasswordViewModel _forgotPasswordViewModel =
      instance<ForgotPasswordViewModel>();

  _bind() {
    _forgotPasswordViewModel.start();
    _emailAddressController.addListener(
        () => _forgotPasswordViewModel.setEmail(_emailAddressController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _forgotPasswordViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<FlowState>(
      stream: _forgotPasswordViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _forgotPasswordViewModel.forgotPassword();
            }) ??
            _getContentWidget();
      },
    ));
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Image(image: AssetImage(ImagesAssets.splashLogo)),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _forgotPasswordViewModel.outputsEmailValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailAddressController,
                        decoration: InputDecoration(
                            hintText: AppStrings.email,
                            labelText: AppStrings.email,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.emailError),
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _forgotPasswordViewModel.isOutputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                                    _forgotPasswordViewModel.forgotPassword();
                                  }
                                : null,
                            child: const Text(AppStrings.resetPassword),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                    top: AppPadding.p8,
                    bottom: AppPadding.p28),
                child: TextButton(
                  onPressed: () {
                    _forgotPasswordViewModel.forgotPassword();
                  },
                  child: Text(AppStrings.didNotReceiveEmail,
                      style: Theme.of(context).textTheme.subtitle2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
