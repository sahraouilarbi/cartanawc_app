import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/presentation/ressources/appsize_manager.dart';

class MyTextButtonWidget extends StatelessWidget {
  const MyTextButtonWidget({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    required this.textButton,
    this.textColor,
    this.hasIcon = false,
    this.svgIconSrc,
    this.inProgress = false,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String textButton;
  final Color? textColor;
  final bool hasIcon;
  final String? svgIconSrc;
  final bool inProgress;
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
        child: !inProgress
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textButton.toUpperCase(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (hasIcon) _hasSvgIcon() else const SizedBox(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _hasSvgIcon() {
    return Row(
      children: [
        const SizedBox(width: AppSize.s5),
        SvgPicture.asset(
          svgIconSrc!,
          color: Colors.white,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
