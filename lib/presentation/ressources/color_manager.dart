import 'package:flutter/material.dart';

class ColorManager {
  final String hashTag = '#';
  static Color primary = Colors.black;
  static Color blue = HexColor.fromHex('#2699FB');
  static Color green = HexColor.fromHex('#148843');
  static Color greenAccent = HexColor.fromHex('#00AE0C');
  static Color grey = HexColor.fromHex('#7E7E7E');
  static Color orangeAccent = HexColor.fromHex('#DB9F5A');
  static Color purple = HexColor.fromHex('#60009F');
  static Color red = HexColor.fromHex('#C22222');
  static Color yellow = HexColor.fromHex('#FFF700');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    String _hexColorString = hexColorString.replaceAll('#', '');
    if (_hexColorString.length == 6) {
      _hexColorString = 'FF$_hexColorString';
    }
    return Color(int.parse(_hexColorString, radix: 16));
  }
}
