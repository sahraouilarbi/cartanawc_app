import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class ProductPackagingWidget extends StatelessWidget {
  const ProductPackagingWidget({Key? key, required this.productStep})
      : super(key: key);
  final int productStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: AppSize.s50,
            height: AppSize.s50,
            color: Colors.black,
            child: Image.asset(
              'assets/images/icon_packaging.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: AppMargin.m20),
            child: Text('$productStep x pièces / carton'),
          ),
        ],
      ),
    );
  }
}
