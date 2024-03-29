import 'package:cartanawc_app/presentation/common/drawer/models/drawer_model.dart';
import 'package:cartanawc_app/presentation/common/drawer/widgets/drawer_customer_tile.dart';
import 'package:cartanawc_app/presentation/common/white_and_green_top_bar.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:flutter/material.dart';

class DrawerForAnonymous extends StatelessWidget {
  const DrawerForAnonymous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DrawerContent> _drawerContent = [
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, AccueilPage.routeName, arguments: 1);
        },
        leadingIcon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: 'ACCUEIL',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, AccueilPage.routeName, arguments: 0);
        },
        title: 'PRODUITS',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, AccueilPage.routeName, arguments: 2);
        },
        title: 'EXPLORER',
        backgroundColor: Colors.white,
      ),
      DrawerContent(
        onTap: () {},
        title: 'NOUVEAUTES',
        backgroundColor: const Color(0xFFDB9F5A),
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, DevenirDistributeurPage.routeName);
        },
        title: 'DEVENIR DISTRIBUTEUR',
        backgroundColor: Colors.black,
      ),
      DrawerContent(
        onTap: () {},
        title: 'SOLUTIONS PACKAGING',
        backgroundColor: Colors.black,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, AProposPage.routeName);
        },
        title: 'A PROPOS',
        backgroundColor: Colors.black,
      ),
      DrawerContent(
        onTap: () {
          Navigator.pushNamed(context, ContactPage.routeName);
        },
        title: 'CONTACT',
        backgroundColor: Colors.black,
      ),
    ];
    return Drawer(
      child: Column(
        children: [
          const WhiteAndGreenBar(),
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
