import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class ProductPriceDisplayWidget extends StatelessWidget {
  const ProductPriceDisplayWidget(
      {Key key, @required this.productPrice, @required this.isUserLoggedIn})
      : super(key: key);
  final String productPrice;
  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isUserLoggedIn,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: AppSize.s50,
              height: AppSize.s50,
              color: Colors.black,
              child: Image.asset(
                'assets/images/icon_bottle.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: AppMargin.m20),
              child: Text('${productPrice.replaceAll('.', ',')} DA / U'),
            ),
          ],
        ),
      ),
    );
  }
}
