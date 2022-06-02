import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';

import 'package:flutter/material.dart';
import 'tab_commandes/tab_commande.dart';
import 'tab_historique/tab_historique.dart';
import 'tab_paiement/tab_paiement.dart';

class TableauBordPage extends StatefulWidget {
  const TableauBordPage({Key key, this.tabSelected}) : super(key: key);

  final int tabSelected;

  static const String routeName = '/tableauBord';

  static Route route({int tabSelected}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => TableauBordPage(
        tabSelected: tabSelected,
      ),
    );
  }

  @override
  _TableauBordPageState createState() => _TableauBordPageState();
}

class _TableauBordPageState extends State<TableauBordPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tableauBordTabs = <Tab>[
    Tab(text: 'COMMANDES'),
    Tab(text: 'PAIEMENT'),
    Tab(text: 'HISTORIQUE'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tableauBordTabs.length, vsync: this);

    widget.tabSelected == null
        ? _tabController.index = 0
        : _tabController.index = widget.tabSelected;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: buildAppBar(
        //   context,
        //   tabController: _tabController,
        //   tabs: tableauBordTabs,
        //   hasTabs: true,
        // ),
        appBar: CustomAppBar(
          tabController: _tabController,
          tabs: tableauBordTabs,
          hasTabs: true,
        ),
        // Build Drawer
        drawer: DrawerForAuthenticatedUser(),
        body: TabBarView(
          controller: _tabController,
          children: [
            TabCommande(),
            tabPaiement(),
            tabHistorique(),
          ],
        ));
  }
}
