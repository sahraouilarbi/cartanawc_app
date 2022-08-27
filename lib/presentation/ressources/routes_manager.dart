import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/presentation/pages.dart';

class RouteGenerator {
  final textIntrouvable = '404, Page Introuvable';
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AProposPage.routeName:
        return AProposPage.route();
      case AccueilPage.routeName:
        initGetCategoriesModule();
        initGetProductsModule();
        return AccueilPage.route(
            tabSelected: routeSettings.arguments != null
                ? routeSettings.arguments! as int
                : 1);
      case AuthPage.routeName:
        return AuthPage.route();
      case CartPage.routeName:
        return CartPage.route();
      case CustomerProfilePage.routeName:
        return CustomerProfilePage.route();
      case CustomerProfileEditPage.routeName:
        return CustomerProfileEditPage.route();
      case LoginPage.routeName:
        initLoginModule();
        return LoginPage.route();
      case OrdersPage.routeName:
        return OrdersPage.route();
      case OrderDetailsPage.routeName:
        return OrderDetailsPage.route(orderId: routeSettings.arguments! as int);
      case PaymentMethodsPage.routeName:
        return PaymentMethodsPage.route();
      case ProductDetailsPage.routeName:
        return ProductDetailsPage.route(
            data: routeSettings.arguments! as ProductEntity);
      case TableauBordPage.routeName:
        initTabCommanderModule();
        return TableauBordPage.route(
            tabSelected: routeSettings.arguments != null
                ? routeSettings.arguments! as int
                : 0);
      case VerifyAddressPage.routeName:
        return VerifyAddressPage.route();
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Page introuvalble'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: Text(
            '404, Page Introuvable',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
