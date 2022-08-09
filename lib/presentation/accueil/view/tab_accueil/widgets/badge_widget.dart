import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class BadgeWidget extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final Color backgroundColor;
  final bool left;
  const BadgeWidget({
    Key key,
    @required this.alignment,
    @required this.text,
    @required this.backgroundColor,
    this.left = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: AppSize.s6,
      alignment: alignment,
      child: Container(
        color: backgroundColor,
        padding: left
            ? const EdgeInsets.fromLTRB(
                AppPadding.p12,
                AppPadding.p2,
                AppPadding.p6,
                AppPadding.p2,
              )
            : const EdgeInsets.fromLTRB(
                AppPadding.p6,
                AppPadding.p2,
                AppPadding.p12,
                AppPadding.p2,
              ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
