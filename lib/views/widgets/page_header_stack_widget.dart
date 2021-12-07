import 'package:flutter/material.dart';

Stack pageHeaderStack({String pageHeader}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 3.0,
        color: Colors.white,
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
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
