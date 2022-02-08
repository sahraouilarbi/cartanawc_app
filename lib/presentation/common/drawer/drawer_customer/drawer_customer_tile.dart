import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class DrawerCustomerTile extends StatelessWidget {
  const DrawerCustomerTile({
    Key key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.ontap,
  }) : super(key: key);
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
            vertical: AppSize.s16, horizontal: AppSize.s40),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black.withOpacity(AppSize.s0_2)),
          ),
        ),
        child: Text(
          title ?? '',
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}
