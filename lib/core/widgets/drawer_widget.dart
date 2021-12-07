import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_a_propos_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_accueil_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_contact_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_devenir_distributeur_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_explorer_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_nouveautes_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_produits_tile.dart';
import 'package:cartanawc_app/core/widgets/drawer_tile/drawer_solutions_packaging_tile.dart';
import 'package:cartanawc_app/core/widgets/white_and_green_top_bar.dart';
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
