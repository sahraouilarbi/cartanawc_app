import 'package:cartanawc_app/data/geolocator_service.dart';
import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/model_views/providers/order_provider.dart';
import 'package:cartanawc_app/model_views/providers/product_provider.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartanaApp extends StatelessWidget {
  factory CartanaApp() => instance;
  const CartanaApp._internal();
  static const CartanaApp instance = CartanaApp._internal();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),

        // ChangeNotifierProvider(
        //   create: (context) => CustomerProvider(),
        // ),
        FutureProvider(
          create: (context) => GeoLocatorService().getLocation(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        initialRoute: Routes.homeRoute,
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        title: 'Cartana',
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
