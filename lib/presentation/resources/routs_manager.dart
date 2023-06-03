import 'package:clean_mvvm/presentation/forget_password/forgot_password_voew.dart';
import 'package:clean_mvvm/presentation/login/login_view.dart';
import 'package:clean_mvvm/presentation/main/main_view.dart';
import 'package:clean_mvvm/presentation/onboarding/onboarding_view.dart';
import 'package:clean_mvvm/presentation/register/register_view.dart';
import 'package:clean_mvvm/presentation/resources/string_manager.dart';
import 'package:clean_mvvm/presentation/splash/splash_view.dart';
import 'package:clean_mvvm/presentation/store_details/store_datails_view.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardinghRoute = "/onBoarding";
}
class RoutGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute: return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardinghRoute: return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute: return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute: return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute: return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute: return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute: return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default: return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){

    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title:  Text(StringManager.noRouteFound),
      ),
      body:  Center(child:  Text(StringManager.noRouteFound),
    )
    )
    );

  }

}