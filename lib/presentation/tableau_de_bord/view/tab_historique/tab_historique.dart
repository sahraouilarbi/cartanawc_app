import 'package:flutter/material.dart';

Widget tabHistorique() {
  return FutureBuilder(
    future: null,
    builder: (BuildContext context, AsyncSnapshot<List> model) {
      if (model.hasData) {}
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
