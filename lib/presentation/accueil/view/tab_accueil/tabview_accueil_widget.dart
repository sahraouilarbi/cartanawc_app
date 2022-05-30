import 'package:cartanawc_app/presentation/common/page_header_stack_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
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
            paragraphBgGradientColorEnd: ColorManager.purple,
            badgeText: 'TESTER',
            badgeBgColor: ColorManager.purple,
          ),
          const SizedBox(height: AppSize.s10),
          buildStackEspaceProfessionnel(
            src: 'assets/images/magasin_cosmetique.jpg',
            headerText: 'MAGASIN\nCOSMETIQUE',
            paragraphText:
                "Vous disposez d'un point de vente en cosmétique, et vous souhaitez commercialisez nos offres",
            paragraphBgGradientColorStart: const Color(0xFF000D60),
            paragraphBgGradientColorEnd: ColorManager.blue,
            badgeText: 'COMMANDER',
            badgeBgColor: ColorManager.blue,
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

/// Build Stack Nouveautés
Stack buildStackNouveautes() {
  return Stack(
    alignment: AlignmentDirectional.centerStart,
    children: [
      buildStackBackgroundImageWithOverlay(
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
                  )),
            ),
          ],
        ),
      ),
      buildBadgeAlign(
        alignment: Alignment.topLeft,
        text: 'Nouveau',
        backgroundColor: ColorManager.red,
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
          const SizedBox(height: AppSize.s30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
            decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(width: AppSize.s3, color: Colors.white)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p5, horizontal: AppPadding.p10),
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
                      vertical: AppPadding.p5, horizontal: AppPadding.p10),
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
              ))
        ],
      ),
    ],
  );
}

/// Build Background Image with Overlay
Stack buildStackBackgroundImageWithOverlay(
    {String src, double overlayOpacity = AppSize.s0_3}) {
  return Stack(
    children: [
      SizedBox(
        height: AppSize.s170,
        width: double.maxFinite,
        child: Image.asset(
          src,
          fit: BoxFit.fitWidth,
        ),
      ),
      Container(
        height: AppSize.s170,
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
    heightFactor: AppSize.s6,
    alignment: alignment,
    child: Container(
      color: backgroundColor,
      padding: left
          ? const EdgeInsets.fromLTRB(
              AppPadding.p12, AppPadding.p2, AppPadding.p6, AppPadding.p2)
          : const EdgeInsets.fromLTRB(
              AppPadding.p6, AppPadding.p2, AppPadding.p12, AppPadding.p2),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
