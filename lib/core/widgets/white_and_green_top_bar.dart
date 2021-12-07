import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:flutter/material.dart';

class WhiteAndGreenBar extends StatelessWidget {
  const WhiteAndGreenBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 14.0,
          color: Colors.white,
        ),
        Container(
          height: 4.0,
          color: ThemeConfig.kSecondaryColor,
        ),
      ],
    );
  }
}
