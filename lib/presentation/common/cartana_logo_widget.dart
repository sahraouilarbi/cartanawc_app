import 'package:flutter/material.dart';

class CartanaLogo extends StatelessWidget {
  const CartanaLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/cartana_logo.png',
      fit: BoxFit.contain,
    );
  }
}
