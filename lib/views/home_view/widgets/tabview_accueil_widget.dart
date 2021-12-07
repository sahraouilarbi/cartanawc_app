import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/views/widgets/page_header_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
 * Build Page Accueil from de site : www2.cartana.dz
 */
Widget tabViewAccueil() {
  return SingleChildScrollView(
    child: Container(
      color: Colors.black,
      child: Column(
        children: [
          buildStackPartenaire(),
          pageHeaderStack(pageHeader: 'NOUVEAUTES'),
          buildStackNouveautes(),
          pageHeaderStack(pageHeader: 'ESPACE PROFESSIONNEL'),
          buildStackEspaceProfessionnel(
            src: 'assets/images/salon_coiffure_institut_beaute_bg.jpg',
            headerText: 'SALON DE COIFFURE\nINSTITUT DE BEAUTE',
            paragraphText:
                "Bénéficiez d'échantillons gratuits\npour tester nos produits",
            paragraphBgGradientColorStart: const Color(0xFF8200D8),
            paragraphBgGradientColorEnd: ThemeConfig.cartanaColorPurple,
            badgeText: 'TESTER',
            badgeBgColor: ThemeConfig.cartanaColorPurple,
          ),
          const SizedBox(height: 10.0),
          buildStackEspaceProfessionnel(
            src: 'assets/images/magasin_cosmetique.jpg',
            headerText: 'MAGASIN\nCOSMETIQUE',
            paragraphText:
                "Vous disposez d'un point de vente en cosmétique, et vous souhaitez commercialisez nos offres",
            paragraphBgGradientColorStart: const Color(0xFF000D60),
            paragraphBgGradientColorEnd: ThemeConfig.cartanaColorBlue,
            badgeText: 'COMMANDER',
            badgeBgColor: ThemeConfig.cartanaColorBlue,
          ),
          pageHeaderStack(pageHeader: 'DEVENIR DISTRIBUTEUR'),
          buildStackDevenirDistributeur(),
        ],
      ),
    ),
  );
}

/// build Partenaire
Stack buildStackPartenaire() {
  return Stack(
    alignment: AlignmentDirectional.centerStart,
    children: [
      buildStackBackgroundImageWithOverlay(
          src: 'assets/images/partenaire_1_des_professionnels_en_algerie.jpg'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25.0),
                SvgPicture.asset(
                  'assets/images/style_chic.svg',
                  color: Colors.white,
                  height: 110.0,
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

/// Build Stack Nouveautés
Stack buildStackNouveautes() {
  return Stack(
    alignment: AlignmentDirectional.centerStart,
    children: [
      buildStackBackgroundImageWithOverlay(
          src: 'assets/images/serum_capillaire_bg.jpg', overlayOpacity: 0.1),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
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
                      vertical: 5.0, horizontal: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Lire la suite',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      buildBadgeAlign(
        alignment: Alignment.topLeft,
        text: 'Nouveau',
        backgroundColor: ThemeConfig.cartanaColorRed,
        left: true,
      ),
    ],
  );
}

/// Build Espace Professionnel
Stack buildStackEspaceProfessionnel({
  @required String src,
  @required String headerText,
  @required String paragraphText,
  @required Color paragraphBgGradientColorStart,
  @required Color paragraphBgGradientColorEnd,
  @required String badgeText,
  @required Color badgeBgColor,
}) {
  return Stack(
    alignment: AlignmentDirectional.centerStart,
    children: [
      buildStackBackgroundImageWithOverlay(src: src),
      Column(
        children: [
          const SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(width: 3.0, color: Colors.white)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    headerText,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
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
      buildBadgeAlign(
        alignment: Alignment.topRight,
        backgroundColor: badgeBgColor,
        text: badgeText,
      ),
    ],
  );
}

///Build Devenir Distributeur
Stack buildStackDevenirDistributeur() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      buildStackBackgroundImageWithOverlay(
          src: 'assets/images/devenir_distributeur_bg.jpg'),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 3.0, color: Colors.white),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: const Text(
                  'Devenir distributeur',
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ],
      ),
    ],
  );
}

/// Build Background Image with Overlay
Stack buildStackBackgroundImageWithOverlay(
    {String src, double overlayOpacity = 0.3}) {
  return Stack(
    children: [
      SizedBox(
        height: 170.0,
        width: double.maxFinite,
        child: Image.asset(
          src,
          fit: BoxFit.fitWidth,
        ),
      ),
      Container(
        height: 170,
        width: double.maxFinite,
        color: Colors.black.withOpacity(overlayOpacity),
      ),
    ],
  );
}

/// Build Badge Alignement
Align buildBadgeAlign({
  @required Alignment alignment,
  @required String text,
  @required Color backgroundColor,
  bool left = false,
}) {
  return Align(
    heightFactor: 6,
    alignment: alignment,
    child: Container(
      color: backgroundColor,
      padding: left
          ? const EdgeInsets.fromLTRB(12.0, 2.0, 6.0, 2.0)
          : const EdgeInsets.fromLTRB(6.0, 2.0, 12.0, 2.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}