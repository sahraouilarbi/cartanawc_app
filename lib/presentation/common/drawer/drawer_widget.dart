import 'package:cartanawc_app/presentation/common/drawer/drawer_a_propos_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_accueil_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_contact_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_devenir_distributeur_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_explorer_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_nouveautes_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_produits_tile.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_solutions_packaging_tile.dart';
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
