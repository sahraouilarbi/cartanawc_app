import 'dart:io';

import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/widgets/cartana_logo_widget.dart';
import 'package:cartanawc_app/widgets/page_header_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AProposPage extends StatelessWidget {
  const AProposPage({Key key}) : super(key: key);

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
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  pageHeaderStack(pageHeader: 'A Propos'),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30.0),
                        SizedBox(height: 100.0, child: buildCartanaLogo()),
                        const SizedBox(height: 30.0),
                        buildContainer('Notre Histoire'),
                        const SizedBox(height: 5.0),
                        const Text(aPropos),
                        const SizedBox(height: 10.0),
                        buildContainer('Nos Valeurs'),
                        const Text('Valeur 1,\nValeur 2,\nValeur 3'),
                        const SizedBox(height: 10.0),
                        buildContainer('Nos Marques'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/touareg.svg',
                              height: 60.0,
                            ),
                            SvgPicture.asset(
                              'assets/images/style_chic.svg',
                              height: 60.0,
                            ),
                            SvgPicture.asset(
                              'assets/images/cartana.svg',
                              height: 60.0,
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
                        pageHeaderStack(pageHeader: 'SUIVER NOUS'),
                        const SizedBox(height: 10.0),
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
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 75.0,
                              height: 75.0,
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
                                      height: 20.0,
                                      width: 20.0,
                                      child: SvgPicture.asset(
                                        'assets/images/headset.svg',
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text(
                                      'Service Clients',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
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
          )),
        ));
  }

  Widget buildSocialMediaLink({String asset}) {
    return InkWell(
      onTap: () {
        if (Platform.isAndroid) {}
        if (Platform.isIOS) {}
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25.0,
        child: SizedBox(
          width: 25.0,
          height: 25.0,
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
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: ThemeConfig.cartanaColorGreen),
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
