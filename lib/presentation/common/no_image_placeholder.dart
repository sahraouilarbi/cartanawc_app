import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class NoImagePlaceholder extends StatelessWidget {
  const NoImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/no_image_placeholder.png',
      height: AppSize.s56,
      fit: BoxFit.cover,
    );
  }
}
