import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class MontantWidget extends StatelessWidget {
  const MontantWidget(
      {Key? key,
      this.label = 'MONTANT',
      required this.value,
      this.fontSize = 15.0})
      : super(key: key);
  final String label;
  final double value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(),
          ),
          child: Text(
            '$label : ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
            ),
            child: Text(
              '${value.toStringAsFixed(2).replaceAll('.', ',')} DA',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: fontSize, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
