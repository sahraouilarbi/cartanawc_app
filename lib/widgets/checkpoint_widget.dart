import 'package:flutter/material.dart';

class CheckPoints extends StatelessWidget {
  const CheckPoints({
    Key key,
    this.checkedTill = 1,
    this.checkPoints,
    this.checkPointFilledColor,
  }) : super(key: key);

  final int checkedTill;
  final List<String> checkPoints;
  final Color checkPointFilledColor;

  static double circleDia = 32.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, s) {
      final double cWidth =
          (s.maxWidth - circleDia * (checkPoints.length + 1)) /
              (checkPoints.length - 1);
      return SizedBox(
        height: 56.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: checkPoints.map((e) {
                  final int index = checkPoints.indexOf(e);
                  return SizedBox(
                    height: circleDia,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: circleDia,
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index <= checkedTill
                                ? checkPointFilledColor
                                : checkPointFilledColor.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                        if (index != (checkPoints.length - 1))
                          Container(
                            width: cWidth,
                            height: 2.0,
                            color: index < checkedTill
                                ? checkPointFilledColor
                                : checkPointFilledColor.withOpacity(0.2),
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
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
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
