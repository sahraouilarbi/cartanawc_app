import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key, required this.sectionTitle}) : super(key: key);
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 45.0,
          color: Colors.black,
        ),
        Container(
          height: AppSize.s3,
          color: Colors.white,
        ),
        Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          color: Colors.black,
          child: Text(
            sectionTitle,
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
}
