import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Function()? onTap;
  final Icon? leadingIcon;
  final Color? color;
  final String title;

  const DrawerTile({
    Key? key,
    this.onTap,
    this.leadingIcon,
    this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(
            color: Color(
              0xFFD2D2D2,
            ),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leadingIcon,
        title: Text(
          title,
          style: TextStyle(
            color: color != Colors.white ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
