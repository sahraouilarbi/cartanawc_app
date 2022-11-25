import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class TextCustomerProfileViewWidget extends StatelessWidget {
  const TextCustomerProfileViewWidget({
    Key? key,
    required this.labelText,
    required this.insideFieldText,
  }) : super(key: key);
  final String labelText;
  final String insideFieldText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelText,
          style: const TextStyle(color: Colors.grey),
        ),
        Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m5),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
          child: Text(
            insideFieldText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
