import 'dart:io';

import 'package:cartanawc_app/presentation/common/cartana_logo_widget.dart';
import 'package:cartanawc_app/presentation/common/section_header_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AProposPage extends StatefulWidget {
  const AProposPage({Key key}) : super(key: key);

  static const String routeName = '/aPropos';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AProposPage(),
    );
  }

  @override
  _AProposPageState createState() => _AProposPageState();
}

class _AProposPageState extends State<AProposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartana'),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  const SectionHeader(sectionTitle: 'A Propos'),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSize.s30),
                        const SizedBox(
                            height: AppSize.s100, child: CartanaLogo()),
                        const SizedBox(height: AppSize.s30),
                        buildContainer('Notre Histoire'),
                        const SizedBox(height: AppSize.s5),
                        const Text(aPropos),
                        const SizedBox(height: AppSize.s10),
                        buildContainer('Nos Valeurs'),
                        const Text('Valeur 1,\nValeur 2,\nValeur 3'),
                        const SizedBox(height: AppSize.s10),
                        buildContainer('Nos Marques'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/touareg.svg',
                              height: AppSize.s60,
                              color: Colors.black,
                            ),
                            SvgPicture.asset(
                              'assets/images/style_chic.svg',
                              height: AppSize.s60,
                              color: Colors.black,
                            ),
                            SvgPicture.asset(
                              'assets/images/cartana.svg',
                              height: AppSize.s60,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SectionHeader(sectionTitle: 'SUIVER NOUS'),
                        const SizedBox(height: AppSize.s10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildSocialMediaLink(
                                asset: 'assets/images/facebook.svg'),
                            buildSocialMediaLink(
                                asset: 'assets/images/instagram.svg'),
                            buildSocialMediaLink(
                                asset: 'assets/images/linkedin.svg'),
                            buildSocialMediaLink(
                                asset: 'assets/images/twitter.svg'),
                          ],
                        ),
                        const SizedBox(height: AppSize.s50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppSize.s75,
                              height: AppSize.s75,
                              child: SvgPicture.asset(
                                'assets/images/cartana_logo_bw.svg',
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: AppSize.s20,
                                      width: AppSize.s20,
                                      child: SvgPicture.asset(
                                        'assets/images/headset.svg',
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.s10),
                                    const Text(
                                      'Service Clients',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSize.s20),
                                const Text(
                                  'E-mail : info@cartana.dz',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  'Tél: +213 560 999 742',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSocialMediaLink({String asset}) {
    return InkWell(
      onTap: () {
        if (Platform.isAndroid) {}
        if (Platform.isIOS) {}
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: AppSize.s25,
        child: SizedBox(
          width: AppSize.s25,
          height: AppSize.s25,
          child: SvgPicture.asset(
            asset,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container buildContainer(String text) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(color: ColorManager.greenAccent),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

const String aPropos =
    "CARTANA est une société spécialisé dans la fabrication et la commercialisation des produits cosmétiques, de parfums, et de produits d’hygiène corporelle.\n\nLa famille HABIBECHE a commencé à s’intéresser au domaine de la parfumerie et de la cosmétique depuis les années 1967, Monsieur HABIBECHE Djilali, qui est le père de famille a fondé en plein centre ville de Mostaganem un premier commerce spécialisé dans le domaine.\n\nAu fil des années, ce commerce est devenu florissant et a connu une renommé appréciable au niveau de la ville d’implantation et des villes avoisinante\n\nEn 1993, une première expérience pour la fabrication des produits cosmétiques avait été lancée et a abouti à la naissance du premier produit qui était la brillantine pour cheveux qui avait connu un succès considérable.";
