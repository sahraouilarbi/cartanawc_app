import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/presentation/ressources/appsize_manager.dart';

class PageSubHeaderWidget extends StatelessWidget {
  const PageSubHeaderWidget({
    Key? key,
    required this.title,
    this.svgUrl,
    required this.hasBackReturn,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);
  final String title;
  final String? svgUrl;
  final bool hasBackReturn;
  final Color textColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
        horizontal: AppPadding.p30,
      ),
      decoration: BoxDecoration(
        border: const Border(bottom: BorderSide()),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (svgUrl != null)
                SvgPicture.asset(
                  svgUrl!,
                  color: textColor,
                  fit: BoxFit.cover,
                ),
              const SizedBox(width: AppSize.s5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
          if (hasBackReturn)
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    color: textColor,
                  ),
                  Text(
                    'Retour',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
