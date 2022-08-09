import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

Widget textButton({
  VoidCallback onPressed,
  String text,
  Icon iconRight,
  Color textColor,
  Color backgroundColor,
}) {
  return TextButton(
    style: TextButton.styleFrom(
        primary: textColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(AppPadding.p20)),
    onPressed: onPressed,
    child: iconRight != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.toUpperCase()),
              const SizedBox(width: AppSize.s5),
              iconRight
            ],
          )
        : Text(text.toUpperCase()),
  );
}
