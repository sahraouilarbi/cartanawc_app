import 'package:cartanawc_app/utils/size_config.dart';
import 'package:cartanawc_app/widgets/appbar_widget.dart';
import 'package:cartanawc_app/widgets/drawer_widget.dart';
import 'package:cartanawc_app/widgets/tabview_accueil_widget.dart';
import 'package:cartanawc_app/widgets/tabview_explorer_widget.dart';
import 'package:cartanawc_app/widgets/tabview_wc_categories_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.tabSelected = 0}) : super(key: key);
  final int tabSelected;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> homePageTabs = <Tab>[
    Tab(text: 'Produits'),
    Tab(text: 'Accueil'),
    Tab(text: 'Explorer'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: homePageTabs.length, vsync: this);
    _tabController.index = widget.tabSelected;
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
        appBar: buildAppBar(
          context,
          tabController: _tabController,
          tabs: homePageTabs,
          hasTabs: true,
        ),
        drawer: buildDrawer(context),
        body: TabBarView(
          controller: _tabController,
          children: [
            buildTabWCCategoriesList(),
            buildTabAccueil(),
            buildTabExplorer(context),
          ],
        ),
      ),
    );
  }
}
