import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/presentation/account/customer_profile.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_edit.dart';
import 'package:cartanawc_app/presentation/accueil/accueil_view.dart';
import 'package:cartanawc_app/presentation/login/login.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String profileRoute = '/profile';
  static const String editProfileRoute = '/editProfile';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.forgotPasswordRoute:
        return null;
        break;
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
        break;
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.profileRoute:
        initCustomerProfileModule();
        return MaterialPageRoute(builder: (_) => const CustomerProfileView());
      case Routes.editProfileRoute:
        return MaterialPageRoute(
            builder: (_) => const CustomerProfileEditView());
        break;
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Page introuvalble'),
        ),
        body: const Center(
          child: Text(
            '404, Page introuvable',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
