import 'package:flutter/material.dart';

class DrawerContent {
  DrawerContent({
    this.icon,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final Icon icon;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;
}
