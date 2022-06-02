import 'package:cartanawc_app/presentation/common/cartana_logo_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class AppBarCartanaLogo extends StatelessWidget {
  const AppBarCartanaLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppPadding.p4,
        top: AppPadding.p4,
        right: AppPadding.p4,
      ),
      width: AppSize.s48,
      height: AppSize.s48,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s5),
          topRight: Radius.circular(AppSize.s5),
        ),
      ),
      child: const CartanaLogo(),
    );
  }
}
