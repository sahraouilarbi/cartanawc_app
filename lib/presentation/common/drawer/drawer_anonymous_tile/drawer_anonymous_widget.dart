import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_a_propos_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_accueil_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_contact_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_devenir_distributeur_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_explorer_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_nouveautes_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_produits_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_solutions_packaging_tile.dart';
import 'package:cartanawc_app/presentation/common/white_and_green_top_bar.dart';
import 'package:flutter/material.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        Column(
          children: const [
            WhiteAndGreenBar(),
            DrawerAccueilTile(),
            DrawerProduitsTile(),
            DrawerExplorerTile(),
            DrawerNouveautesTile(),
            DrawerDevenirDistributeurTile(),
            DrawerSolutionsPackagingTile(),
            DrawerAProposTile(),
            DrawerContactTile(),
          ],
        ),
      ],
    ),
  );
}
