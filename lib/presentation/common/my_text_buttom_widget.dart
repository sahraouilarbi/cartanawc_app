import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class MyTextButtonWidget extends StatelessWidget {
  const MyTextButtonWidget({
    Key key,
    this.onPressed,
    this.backgroundColor,
    this.textButton,
    this.textColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String textButton;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: const ButtonStyle(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(AppSize.s5),
        ),
        child: Text(
          textButton ?? '',
          style: TextStyle(
            color: textColor ?? Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
