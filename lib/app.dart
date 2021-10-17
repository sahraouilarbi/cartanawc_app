import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/provider/auth_provider.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/provider/loader_provider.dart';
import 'package:cartanawc_app/provider/order_provider.dart';
import 'package:cartanawc_app/provider/product_provider.dart';
import 'package:cartanawc_app/services/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class CartanaApp extends StatelessWidget {
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
          home: HomePage(),
        ),
      ),
    );
  }
}
