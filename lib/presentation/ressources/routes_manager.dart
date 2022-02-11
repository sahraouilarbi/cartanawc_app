import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/presentation/account/customer_profile.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_edit.dart';
import 'package:cartanawc_app/presentation/accueil/accueil_view.dart';
import 'package:cartanawc_app/presentation/login/login.dart';
import 'package:cartanawc_app/presentation/product/product_details_page.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/tableau_de_bord_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String profileRoute = '/profile';
  static const String editProfileRoute = '/editProfile';
  static const String tableauBordRoute = '/tableauBord';
  static const String tableauBordCommandeRoute = '/tableauBordCommande';
  static const String tableauBordPaiementRoute = '/tableauBordPaiement';
  static const String tableauBordHistoriqueRoute = '/tableauBordHistorique';
  static const String produitsRoute = '/produits';
  static const String productDetailRoute = '/produitDetail';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.forgotPasswordRoute:
        return null;
        break;
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const AccueilPage());
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
      case Routes.tableauBordRoute:
        return MaterialPageRoute(builder: (_) => const TableauBord());
        break;
      case Routes.tableauBordCommandeRoute:
        return MaterialPageRoute(
            builder: (_) => const TableauBord(
                  tabSelected: 0,
                ));
        break;
      case Routes.tableauBordPaiementRoute:
        return MaterialPageRoute(
            builder: (_) => const TableauBord(
                  tabSelected: 1,
                ));
        break;
      case Routes.tableauBordHistoriqueRoute:
        return MaterialPageRoute(
            builder: (_) => const TableauBord(
                  tabSelected: 2,
                ));
        break;
      case Routes.productDetailRoute:
        return MaterialPageRoute(builder: (_) => ProductDetails());
        break;
      case Routes.produitsRoute:
        return MaterialPageRoute(builder: (_) => null);
        break;
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
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
            '404, Page introuvable',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
