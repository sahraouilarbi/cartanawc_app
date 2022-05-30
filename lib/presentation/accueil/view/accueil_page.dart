import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/tabview_accueil_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_explorer/tabview_explorer_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/tabview_wc_categories_widget.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_widget.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key key, this.tabSelected}) : super(key: key);
  final int tabSelected;
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> homePageTabs = <Tab>[
    Tab(text: 'Produits'),
    Tab(text: 'Accueil'),
    Tab(text: 'Explorer'),
  ];
  int firstComing = 0;

  TabController _tabController;

  AuthProvider authProvider;

  Future<void> _bind() async {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.isUserLoggedIn();
    if (authProvider.loggedInStatus == Status.loggedIn) {
      Navigator.pushReplacementNamed(context, Routes.tableauBordRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _bind();
    _tabController = TabController(length: homePageTabs.length, vsync: this);

    widget.tabSelected == null
        ? _tabController.index = 1
        : _tabController.index = widget.tabSelected;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Initialisation de valeurs MediaQuery
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        //appBar: buildAppBar(
        appBar: CustomAppBar(
          //context,
          tabController: _tabController,
          tabs: homePageTabs,
          hasTabs: true,
        ),
        drawer: buildDrawer(context),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Afficher le tabView WooCommerce 'WC' Categories
            tabViewWCCategories(),
            //Afficher le tabView Accueil
            tabViewAccueil(),
            //Afficher le tabView Explorer
            tabViewExplorer(context),
          ],
        ),
      ),
    );
  }
}
