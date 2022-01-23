import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

//Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  final double screenHeight = SizeConfig.screenHeight;
  // 812 is te layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

//Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  final double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout Width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
