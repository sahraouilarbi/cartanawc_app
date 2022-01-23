import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

class WhiteAndGreenBar extends StatelessWidget {
  const WhiteAndGreenBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.s14,
          color: Colors.white,
        ),
        Container(
          height: AppSize.s4,
          color: ColorManager.green,
        ),
      ],
    );
  }
}
