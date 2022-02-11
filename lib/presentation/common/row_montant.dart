import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

Row rowMontant(
    {String textLabel, double valeurMontant, double fontSize = 15.0}) {
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
          '$textLabel : ',
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
            '${valeurMontant.toStringAsFixed(2).replaceAll('.', ',')} DA',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: fontSize, color: Colors.black),
          ),
        ),
      ),
    ],
  );
}
