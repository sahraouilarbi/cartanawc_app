import 'package:flutter/material.dart';

Widget tabPaiement() {
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
