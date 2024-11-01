
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/forgot_password/forgot_password.dart';
import 'package:mutahapplication/presentation/login/login.dart';
import 'package:mutahapplication/presentation/main/main_view.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/splash/splash.dart';



class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>   SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.forgotPasswordRoute:
         return MaterialPageRoute(builder: (_) =>   ForgotPasswordView());
       case Routes.mainRoute:
         return MaterialPageRoute(builder: (_) =>  MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title:  Text(AppStrings.noRouteFound),
          ),
          body: Center(child:  Text(AppStrings.noRouteFound)),
        ));
  }
}