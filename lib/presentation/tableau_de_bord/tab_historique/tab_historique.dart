import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:flutter/material.dart';

Widget tabHistorique() {
  final APIService _apiService = instance<APIService>();
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
