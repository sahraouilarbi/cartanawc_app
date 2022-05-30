import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_customer/drawer_customer_widget.dart';

import 'package:flutter/material.dart';
import 'tab_commandes/tab_commande.dart';
import 'tab_historique/tab_historique.dart';
import 'tab_paiement/tab_paiement.dart';

class TableauBord extends StatefulWidget {
  const TableauBord({Key key, this.tabSelected}) : super(key: key);

  final int tabSelected;

  @override
  _TableauBordState createState() => _TableauBordState();
}

class _TableauBordState extends State<TableauBord>
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
        drawer: BuildDrawerCustomerWidget(),
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
