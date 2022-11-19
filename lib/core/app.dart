import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/geolocator_service.dart';
import '/presentation/pages.dart';
import '/presentation/ressources/routes_manager.dart';
import '/providers/auth_provider.dart';
import '/providers/cart_provider.dart';
import '/providers/loader_provider.dart';
import '/providers/order_provider.dart';
import '/providers/product_provider.dart';

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
        initialRoute: AuthPage.routeName,
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
