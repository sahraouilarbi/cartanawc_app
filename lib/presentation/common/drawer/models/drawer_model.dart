import 'package:flutter/material.dart';

class DrawerContent {
  Function()? onTap;
  Icon? leadingIcon;
  String title;
  Color? backgroundColor;
  DrawerContent({
    this.onTap,
    this.leadingIcon,
    required this.title,
    this.backgroundColor,
  });
}
