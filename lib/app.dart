import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/provider/customer_provider.dart';
import 'package:cartanawc_app/provider/loader_provider.dart';
import 'package:cartanawc_app/provider/order_provider.dart';
import 'package:cartanawc_app/provider/product_provider.dart';
import 'package:cartanawc_app/services/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class CartanaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
          //child: const BasePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          //child: const ProductPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          //child: ProductDetails(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
          //child: const OrdersPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
          //child: const MyAccountPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
        FutureProvider(
          create: (context) => GeoLocatorService().getLocation(),
        ),
      ],
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cartana',
          theme: ThemeData(
            primaryColor: Colors.black,
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          //home: const SplashScreenPage(),
          // home: const DefaultTabController(
          //   length: 3,
          //   child: HomePage(),
          // ),
        ),
      ),
    );
  }
}
