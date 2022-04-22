import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:flut_all_content/presentation/register/register_viewmodel.dart';
import 'package:flut_all_content/presentation/resources/assets_manager.dart';
import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../app/di.dart';
import '../common/widget.dart';
import '../resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _registerViewModel = instance<RegisterViewModel>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _countryMobileCodeController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _registerViewModel.start();
    _userNameController.addListener(() {
      _registerViewModel.setUserName(_userNameController.text);
    });

    _emailController.addListener(() {
      _registerViewModel.setUserName(_emailController.text);
    });

    _passwordController.addListener(() {
      _registerViewModel.setUserName(_passwordController.text);
    });

    _mobileNumberController.addListener(() {
      _registerViewModel.setUserName(_mobileNumberController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _registerViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          iconTheme: IconThemeData(color: ColorManager.primary),
        ),
        body: StreamBuilder<FlowState>(
          stream: _registerViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _registerViewModel.register();
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
              const Center(
                  child: Image(image: AssetImage(ImagesAssets.splashLogo))),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.userName,
                        snapshot: snapshot,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.userName,
                        errorText: snapshot.data,
                        controller: _userNameController,
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorEmail,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.email,
                        snapshot: snapshot,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppStrings.email,
                        errorText: snapshot.data,
                        controller: _emailController,
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.password,
                        snapshot: snapshot,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: AppStrings.password,
                        errorText: snapshot.data,
                        controller: _passwordController,
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorMobileNumberV,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.mobileNumber,
                        snapshot: snapshot,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.mobileNumber,
                        errorText: snapshot.data,
                        controller: _mobileNumberController,
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
