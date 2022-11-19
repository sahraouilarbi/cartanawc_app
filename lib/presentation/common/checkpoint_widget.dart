import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class CheckPoints extends StatelessWidget {
  const CheckPoints({
    Key? key,
    this.checkedTill = 1,
    required this.checkPoints,
    this.checkPointFilledColor,
  }) : super(key: key);

  final int? checkedTill;
  final List<String> checkPoints;
  final Color? checkPointFilledColor;

  static double circleDia = AppSize.s32;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, s) {
      final double cWidth =
          (s.maxWidth - circleDia * (checkPoints.length + 1)) /
              (checkPoints.length - 1);
      return SizedBox(
        height: AppSize.s56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                children: checkPoints.map((e) {
                  final int index = checkPoints.indexOf(e);
                  return SizedBox(
                    height: circleDia,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: circleDia,
                          padding: const EdgeInsets.all(AppPadding.p4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index <= checkedTill!
                                ? checkPointFilledColor
                                : checkPointFilledColor!
                                    .withOpacity(AppSize.s0_2),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: AppSize.s18,
                          ),
                        ),
                        if (index != (checkPoints.length - 1))
                          Container(
                            width: cWidth,
                            height: AppSize.s2,
                            color: index < checkedTill!
                                ? checkPointFilledColor
                                : checkPointFilledColor!
                                    .withOpacity(AppSize.s0_2),
                          )
                        else
                          Container(),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: checkPoints.map((e) {
                  return Text(
                    e,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
