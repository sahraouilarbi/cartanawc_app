import 'package:cartanawc_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class CartanaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
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
    );
  }
}
