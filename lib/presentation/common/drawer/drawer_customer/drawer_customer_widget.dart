import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_customer/drawer_customer_tile.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';

class BuildDrawerCustomerWidget extends StatelessWidget {
  BuildDrawerCustomerWidget({Key key}) : super(key: key);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSize.s20),
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: AppSize.s20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: AppSize.s17,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                const Text(
                  'ESPACE CLIENT',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Container(
            height: AppSize.s10,
            color: ColorManager.green,
          ),
          DrawerCustomerTile(
            title: 'COMMANDE',
            ontap: () {
              Navigator.pushReplacementNamed(
                  context, Routes.tableauBordCommandeRoute);
              print('commande');
            },
          ),
          DrawerCustomerTile(
            title: 'PAIEMENT',
            ontap: () {
              Navigator.pushReplacementNamed(
                  context, Routes.tableauBordPaiementRoute);
              print('paiement');
            },
          ),
          DrawerCustomerTile(
            title: 'HISTORIQUE',
            ontap: () {
              Navigator.pushReplacementNamed(
                  context, Routes.tableauBordHistoriqueRoute);
              print('historique');
            },
          ),
          DrawerCustomerTile(
            title: 'PROFIL',
            ontap: () {
              Navigator.pushReplacementNamed(context, Routes.profileRoute);
              print('profil');
            },
          ),
          DrawerCustomerTile(
            title: 'SE DECONNECTER',
            textColor: Colors.white,
            backgroundColor: Colors.black,
            ontap: () {
              _appPreferences.logout();
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            },
          ),
        ],
      ),
    );
  }
}
