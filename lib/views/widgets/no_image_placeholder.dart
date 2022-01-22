import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

Image noImagePlaceHolder() {
  return Image.asset(
    'assets/images/no_image_placeholder.png',
    height: AppSize.s56,
    fit: BoxFit.cover,
  );
}
