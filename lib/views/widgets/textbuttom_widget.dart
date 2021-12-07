import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(20.0)),
    onPressed: onPressed,
    child: iconRight != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(text), const SizedBox(width: 5.0), iconRight],
          )
        : Text(text),
  );
}
