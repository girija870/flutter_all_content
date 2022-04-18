import 'package:flut_all_content/presentation/forgot_password/forgot_password.dart';
import 'package:flut_all_content/presentation/login/login.dart';
import 'package:flut_all_content/presentation/main/main.dart';
import 'package:flut_all_content/presentation/onboarding/onboarding.dart';
import 'package:flut_all_content/presentation/register/register.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/splash/splash.dart';
import 'package:flut_all_content/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
