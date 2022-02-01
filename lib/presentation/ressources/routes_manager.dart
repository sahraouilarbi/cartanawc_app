import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/presentation/home/home_view.dart';
import 'package:cartanawc_app/presentation/login/login.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
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
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Page introuvalble'),
        ),
        body: const Center(
          child: Text('404, Page introuvable'),
        ),
      ),
    );
  }
}
