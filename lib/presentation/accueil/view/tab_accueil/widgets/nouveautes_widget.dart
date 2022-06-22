import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

import 'background_image_with_overlay_widget.dart';
import 'badge_widget.dart';

class Nouveautes extends StatelessWidget {
  const Nouveautes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        const BackgroundImageWithOverlay(
            src: 'assets/images/serum_capillaire_bg.jpg',
            overlayOpacity: AppSize.s0_1),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SERUM CAPILLAIRE',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p5, horizontal: AppPadding.p10),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s5),
                    ),
                  ),
                  child: const Text(
                    'Lire la suite',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        BadgeWidget(
          alignment: Alignment.topLeft,
          text: 'Nouveau',
          backgroundColor: ColorManager.red,
          left: true,
        ),
      ],
    );
  }
}
