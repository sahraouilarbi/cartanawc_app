import 'package:cartanawc_app/views/widgets/cartana_logo_widget.dart';
import 'package:flutter/material.dart';

class AppBarCartanaLogo extends StatelessWidget {
  const AppBarCartanaLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
      width: 44.0,
      height: 44.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        ),
      ),
      child: buildCartanaLogo(),
    );
  }
}
