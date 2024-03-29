import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/tabview_accueil_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_explorer/tabview_explorer_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/tabview_categories_page.dart';
import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_anonymous_widget.dart';
import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key, this.tabSelected = 1}) : super(key: key);

  static const String routeName = '/';
  static Route route({int tabSelected = 1}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => AccueilPage(tabSelected: tabSelected),
    );
  }

  final int? tabSelected;

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> homePageTabs = <Tab>[
    Tab(text: 'PRODUITS'),
    Tab(text: 'ACCUEIL'),
    Tab(text: 'EXPLORER'),
  ];
  //int firstComing = 0;

  TabController? _tabController;

  // late AuthProvider authProvider;

  // Future<void> _bind() async {
  //   authProvider = Provider.of<AuthProvider>(context, listen: false);
  //   await authProvider.isUserLoggedIn();
  //   if (authProvider.loggedInStatus == Status.loggedIn) {
  //     resetModules();
  //     Navigator.pushNamed(context, TableauBordPage.routeName);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //_bind();
    _tabController = TabController(length: homePageTabs.length, vsync: this);

    widget.tabSelected == null
        ? _tabController!.index = 1
        : _tabController!.index = widget.tabSelected!;
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Initialisation de valeurs MediaQuery
    //SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          tabController: _tabController,
          tabs: homePageTabs,
          hasTabs: true,
        ),
        drawer: const DrawerForAnonymous(),
        body: TabBarView(
          controller: _tabController,
          children: const [
            // Afficher le tabView WooCommerce 'WC' Categories
            TabCategories(),

            //Afficher le tabView Accueil
            TabAccueil(),

            //Afficher le tabView Explorer
            TabExplorer(),
          ],
        ),
      ),
    );
  }
}
