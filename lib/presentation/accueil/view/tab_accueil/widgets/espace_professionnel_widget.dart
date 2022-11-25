import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/background_image_with_overlay_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/badge_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class EspaceProfessionnel extends StatelessWidget {
  const EspaceProfessionnel({
    Key? key,
    required this.src,
    required this.headerText,
    required this.paragraphText,
    required this.paragraphBgGradientColorStart,
    required this.paragraphBgGradientColorEnd,
    required this.badgeText,
    required this.badgeBgColor,
  }) : super(key: key);
  final String src;
  final String headerText;
  final String paragraphText;
  final Color paragraphBgGradientColorStart;
  final Color paragraphBgGradientColorEnd;
  final String badgeText;
  final Color badgeBgColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        BackgroundImageWithOverlay(src: src),
        Column(
          children: [
            const SizedBox(height: AppSize.s30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: AppSize.s3, color: Colors.white),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p5,
                      horizontal: AppPadding.p10,
                    ),
                    child: Text(
                      headerText,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p5,
                      horizontal: AppPadding.p10,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          paragraphBgGradientColorStart,
                          paragraphBgGradientColorEnd
                        ],
                      ),
                    ),
                    child: Text(
                      paragraphText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        BadgeWidget(
          alignment: Alignment.topRight,
          backgroundColor: badgeBgColor,
          text: badgeText,
        ),
      ],
    );
  }
}
