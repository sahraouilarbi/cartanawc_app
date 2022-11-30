import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({Key? key, required this.productName})
      : super(key: key);
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Text(
        productName,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
