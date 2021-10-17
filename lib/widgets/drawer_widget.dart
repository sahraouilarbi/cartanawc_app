import 'package:cartanawc_app/models/drawer_model.dart';
import 'package:cartanawc_app/pages/apropos_page.dart';
import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/provider/auth_provider.dart';
import 'package:cartanawc_app/utils/size_config.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildDrawer(BuildContext context) {
  final List<DrawerContent> drawerContents = <DrawerContent>[
    DrawerContent(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: 'Accueil',
        textColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(tabSelected: 1),
            ),
          );
        }),
    DrawerContent(
        title: 'Produits',
        textColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(tabSelected: 0),
            ),
          );
        }),
    DrawerContent(
        title: 'Explorer',
        textColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(tabSelected: 2),
            ),
          );
        }),
    DrawerContent(
        title: 'Nouveautés',
        textColor: Colors.white,
        backgroundColor: ThemeConfig.kTercieryColor,
        onTap: () {}),
    DrawerContent(
        title: 'Devenir distributeur',
        textColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: () {}),
    DrawerContent(
        title: 'Solutions packaging',
        textColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: () {}),
    DrawerContent(
        title: 'A Propos',
        textColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AProposPage(),
            ),
          );
        }),
    DrawerContent(
        title: 'Contact',
        textColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: () {}),
  ];

  return Drawer(
    child: SingleChildScrollView(
      child:
          Provider.of<AuthProvider>(context).loggedInStatus == Status.loggedIn
              ? Consumer<AuthProvider>(builder: (context, customer, child) {
                  return Text(customer.customerDetailModel.firstName);
                })
              : Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 40.0,
                    ),
                    Container(
                      color: Colors.white,
                      height: 14.0,
                    ),
                    Container(
                      color: ThemeConfig.kSecondaryColor,
                      height: 5.0,
                    ),
                    SizedBox(
                      height: double.maxFinite,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return _drawerListTile(
                            onTap: drawerContents[index].onTap,
                            icon: drawerContents[index].icon,
                            title: drawerContents[index].title,
                            textColor: drawerContents[index].textColor,
                            tileColor: drawerContents[index].backgroundColor,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          height: 2.0,
                        ),
                        itemCount: drawerContents.length,
                      ),
                    ),
                  ],
                ),
    ),
  );
}

ListTile _drawerListTile({
  VoidCallback onTap,
  Icon icon,
  String title,
  Color textColor,
  Color tileColor,
}) {
  return ListTile(
    onTap: onTap,
    leading: icon,
    title: Text(title,
        style: TextStyle(
          color: textColor,
        )),
    tileColor: tileColor,
    minLeadingWidth: 0,
    contentPadding: EdgeInsets.only(
      left: getProportionateScreenWidth(40.0),
    ),
  );
}
