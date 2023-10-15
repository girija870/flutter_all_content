import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flut_all_content/app/app_prefs.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:flut_all_content/presentation/register/register_viewmodel.dart';
import 'package:flut_all_content/presentation/resources/assets_manager.dart';
import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/routes_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/di.dart';
import '../common/widget.dart';
import '../resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';

const String INITIAL_SELECTED = '+977';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _registerViewModel = instance<RegisterViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  ImagePicker picker = instance<ImagePicker>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  _bind() {
    _registerViewModel.start();
    _userNameController.addListener(() {
      _registerViewModel.setUserName(_userNameController.text);
    });

    _emailController.addListener(() {
      _registerViewModel.setEmail(_emailController.text);
    });

    _passwordController.addListener(() {
      _registerViewModel.setPassword(_passwordController.text);
    });

    _mobileNumberController.addListener(() {
      _registerViewModel.setMobileNumber(_mobileNumberController.text);
    });

    _registerViewModel.isUserRegisteredSuccessfullyStreamController.stream
        .listen((isRegisteredSuccess) {
      //navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreferences.setUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
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
      padding: const EdgeInsets.only(top: AppPadding.p8),
      child: SingleChildScrollView(
        child: Form(
          // key: _formKey,
          child: Column(
            children: [
              const Image(image: AssetImage(ImagesAssets.splashLogo)),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.username.tr(),
                        snapshot: snapshot,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.username.tr(),
                        errorText: snapshot.data,
                        controller: _userNameController,
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CountryCodePicker(
                            onInit: (_) {
                              _registerViewModel
                                  .setCountryMobileCode(INITIAL_SELECTED);
                            },
                            initialSelection: INITIAL_SELECTED,
                            favorite: const ['+39', '+33', '+977'],
                            showCountryOnly: true,
                            hideMainText: true,
                            showOnlyCountryWhenClosed: true,
                            onChanged: (country) {
                              //update view model with selected code
                              _registerViewModel.setCountryMobileCode(
                                  country.dialCode ?? INITIAL_SELECTED);
                            },
                          )),
                      Expanded(
                        flex: 3,
                        child: StreamBuilder<String?>(
                          stream: _registerViewModel.outputErrorMobileNumber,
                          builder: (context, snapshot) {
                            return CustomTextFormField(
                              labelText: AppStrings.mobileNumber.tr(),
                              snapshot: snapshot,
                              keyboardType: TextInputType.text,
                              hintText: AppStrings.mobileNumber.tr(),
                              errorText: snapshot.data,
                              controller: _mobileNumberController,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorEmail,
                    builder: (context, snapshot) {
                      return CustomTextFormField(
                        labelText: AppStrings.emailHint.tr(),
                        snapshot: snapshot,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppStrings.emailHint.tr(),
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
                        labelText: AppStrings.password.tr(),
                        snapshot: snapshot,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: AppStrings.password.tr(),
                        errorText: snapshot.data,
                        controller: _passwordController,
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: Container(
                  height: AppSize.s40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      border: Border.all(color: ColorManager.grey)),
                  child: GestureDetector(
                    child: _getMediaWidget(),
                    onTap: () {
                      _showPicker(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _registerViewModel.register();
                                }
                              : null,
                          child: Text(AppStrings.registerText.tr())),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                    top: AppPadding.p8,
                    bottom: AppPadding.p28),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(AppStrings.haveAccount.tr(),
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(AppStrings.profilePicture.tr())),
          Flexible(
            child: StreamBuilder<File?>(
              stream: _registerViewModel.outputIsProfilePictureValid,
              builder: (context, snapshot) {
                return _imagePickedByUser(snapshot.data);
              },
            ),
          ),
          Flexible(child: SvgPicture.asset(ImagesAssets.photoCameraIc)),
        ],
      ),
    );
  }

  Widget _imagePickedByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(image);
    } else {
      return Container();
    }
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: Text(AppStrings.photoGalley.tr()),
                onTap: () {
                  _imageFormGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_rounded),
                title: Text(AppStrings.photoCamera.tr()),
                onTap: () {
                  _imageFormCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  _imageFormGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    _registerViewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFormCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    _registerViewModel.setProfilePicture(File(image?.path ?? ""));
  }
}
