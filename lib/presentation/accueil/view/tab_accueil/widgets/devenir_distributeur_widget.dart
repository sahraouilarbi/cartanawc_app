import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

import 'background_image_with_overlay_widget.dart';

class DevenirDistributeur extends StatelessWidget {
  const DevenirDistributeur({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const BackgroundImageWithOverlay(
            src: 'assets/images/devenir_distributeur_bg.jpg'),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: AppMargin.m20),
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: AppSize.s3, color: Colors.white),
                ),
              ),
              child: const Text(
                'REJOIGNEZ\nNOTRE RESEAU',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p5, horizontal: AppPadding.p10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppPadding.p5),
                  ),
                ),
                child: const Text(
                  'Devenir distributeur',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
