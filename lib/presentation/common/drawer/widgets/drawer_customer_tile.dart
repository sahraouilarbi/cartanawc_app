import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Function() onTap;
  final Icon leadingIcon;
  final Color color;
  final String title;

  const DrawerTile({
    Key key,
    this.onTap,
    this.leadingIcon,
    this.color,
    this.title,
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

// class DrawerTile extends StatelessWidget {
//   const DrawerTile({
//     Key key,
//     this.title,
//     this.textColor,
//     this.backgroundColor,
//     this.ontap,
//   }) : super(key: key);
//   final String title;
//   final Color textColor;
//   final Color backgroundColor;
//   final VoidCallback ontap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ontap,
//       child: Ink(
//         padding: const EdgeInsets.symmetric(
//             vertical: AppSize.s16, horizontal: AppSize.s40),
//         decoration: BoxDecoration(
//           color: backgroundColor ?? Colors.white,
//           border: Border(
//             bottom: BorderSide(color: Colors.black.withOpacity(AppSize.s0_2)),
//           ),
//         ),
//         child: Text(
//           title ?? '',
//           style: TextStyle(color: textColor ?? Colors.black),
//         ),
//       ),
//     );
//   }
// }
