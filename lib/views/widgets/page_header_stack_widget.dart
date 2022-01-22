import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

Stack pageHeaderStack({String pageHeader}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: AppSize.s3,
        color: Colors.white,
      ),
      Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        color: Colors.black,
        child: Text(
          pageHeader,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
