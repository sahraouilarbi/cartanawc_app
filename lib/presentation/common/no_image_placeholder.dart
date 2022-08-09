import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class NoImagePlaceholder extends StatelessWidget {
  const NoImagePlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/no_image_placeholder.png',
      height: AppSize.s56,
      fit: BoxFit.cover,
    );
  }
}
