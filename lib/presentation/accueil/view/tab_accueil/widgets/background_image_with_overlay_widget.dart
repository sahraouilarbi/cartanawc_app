import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class BackgroundImageWithOverlay extends StatelessWidget {
  final String src;
  final double overlayOpacity;
  const BackgroundImageWithOverlay({
    Key key,
    this.src,
    this.overlayOpacity = AppSize.s0_3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppSize.s170,
          width: double.maxFinite,
          child: Image.asset(
            src,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: AppSize.s170,
          width: double.maxFinite,
          color: Colors.black.withOpacity(overlayOpacity),
        ),
      ],
    );
  }
}
