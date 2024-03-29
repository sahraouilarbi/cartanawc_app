import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_commandes/tab_commander.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_historique/tab_historique.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_paiement/tab_paiement.dart';
import 'package:flutter/material.dart';

class TableauBordPage extends StatefulWidget {
  const TableauBordPage({Key? key, this.tabSelected}) : super(key: key);

  final int? tabSelected;

  static const String routeName = '/tableauBord';

  static Route route({int? tabSelected}) {
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
    Tab(text: 'COMMANDER'),
    Tab(text: 'PAIEMENT'),
    Tab(text: 'HISTORIQUE'),
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tableauBordTabs.length, vsync: this);

    widget.tabSelected == null
        ? _tabController!.index = 0
        : _tabController!.index = widget.tabSelected!;
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tabController: _tabController,
        tabs: tableauBordTabs,
        hasTabs: true,
      ),
      drawer: DrawerForAuthenticatedUser(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabCommander(),
          TabPaiement(),
          TabHistorique(),
        ],
      ),
    );
  }
}
