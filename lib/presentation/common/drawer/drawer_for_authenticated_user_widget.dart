import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/presentation/common/drawer/widgets/drawer_customer_tile.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

import 'models/drawer_model.dart';

class DrawerForAuthenticatedUser extends StatelessWidget {
  DrawerForAuthenticatedUser({Key key}) : super(key: key);
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    final List<DrawerContent> _drawerContent = [
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, '/tableauBord', arguments: 0);
        },
        title: 'COMMANDE',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, '/tableauBord', arguments: 1);
        },
        title: 'PAIMENT',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, '/tableauBord', arguments: 2);
        },
        title: 'HISTORIQUE',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, '/customerProfile');
        },
        title: 'PROFILE',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          _appPreferences.logout();
          Navigator.pushNamed(context, '/');
        },
        title: 'SE DECONNECTER',
        backgroundColor: Colors.white,
      ),
    ];
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSize.s20),
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
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
                Text(
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
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DrawerTile(
                onTap: _drawerContent[index].onTap,
                leadingIcon: _drawerContent[index].leadingIcon,
                color: _drawerContent[index].backgroundColor,
                title: _drawerContent[index].title,
              );
            },
            itemCount: _drawerContent.length,
          ),
        ],
      ),
    );
  }
}
