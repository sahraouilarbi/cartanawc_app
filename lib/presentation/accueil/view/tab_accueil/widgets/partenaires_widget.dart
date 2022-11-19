import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/presentation/ressources/appsize_manager.dart';
import 'background_image_with_overlay_widget.dart';

class Partenaire extends StatelessWidget {
  const Partenaire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        const BackgroundImageWithOverlay(
            src:
                'assets/images/partenaire_1_des_professionnels_en_algerie.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.s25),
                  SvgPicture.asset(
                    'assets/images/style_chic.svg',
                    color: Colors.white,
                    height: AppSize.s110,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: RichText(
                text: const TextSpan(
                  text: 'PARTENAIRE N° #',
                  children: <TextSpan>[
                    TextSpan(
                      text: '1\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'DES '),
                    TextSpan(
                      text: 'PROFESSIONNELS\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'DE LA '),
                    TextSpan(
                      text: 'COIFFURE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' EN ALGERIE'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
