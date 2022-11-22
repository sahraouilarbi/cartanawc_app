import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/color_manager.dart';
import '/presentation/tableau_de_bord/view/tab_historique/tab_historique_viewmodel.dart';

class TabHistorique extends StatefulWidget {
  const TabHistorique({Key? key}) : super(key: key);

  @override
  State<TabHistorique> createState() => _TabHistoriqueState();
}

class _TabHistoriqueState extends State<TabHistorique> {
  final TabHistoriqueViewModel _tabHistoriqueViewModel =
      instance<TabHistoriqueViewModel>();
  Future<void> _bind() async {
    await _tabHistoriqueViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _tabHistoriqueViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _tabHistoriqueViewModel.outputState,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          return snapshot.data!.getScreenWidget(
            context,
            _getContentWidget(),
            () {
              _tabHistoriqueViewModel.start();
            },
          );
        }
        return const Center(
          child: Text(
            'aucune donnée a affichée',
          ),
        );
      },
    );
  }

  Widget _getContentWidget() {
    return RefreshIndicator(
      onRefresh: () async {
        await _tabHistoriqueViewModel.start();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Column(
            children: [
              const Text(
                'Historique des Commandes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSize.s10),
              _displayHistorique(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayHistorique() {
    return StreamBuilder<List<OrderEntity>>(
      stream: _tabHistoriqueViewModel.outputHistoque,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('Pas de données'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: _ordersDataTable(snapshot),
              );
            }
            break;
        }
        return const SizedBox();
      },
    );
  }

  DataTable _ordersDataTable(AsyncSnapshot<List<OrderEntity>> snapshot) {
    return DataTable(
      columns: _ordersColumns(),
      rows: _ordersRows(snapshot),
    );
  }

  List<DataColumn> _ordersColumns() {
    return const [
      // DataColumn(
      //   label: Text('#'),
      // ),
      DataColumn(
        label: Text('Date'),
      ),
      DataColumn(
        label: Text('Etat'),
      ),
      DataColumn(
        label: Text('Total'),
      ),
    ];
  }

  List<DataRow> _ordersRows(AsyncSnapshot<List<OrderEntity>> snapshot) {
    final _dateFormat = DateFormat('dd/MM/yy');
    final _numberFormat = NumberFormat.currency(locale: "fr-FR", symbol: "DA");
    return snapshot.data!
        .map(
          (e) => DataRow(
            cells: [
              // DataCell(
              //   Text(e.orderNumber),
              // ),
              DataCell(
                Text(
                  _dateFormat.format(e.orderDateCreated),
                ),
              ),
              DataCell(
                Container(
                  padding: const EdgeInsets.all(AppSize.s5),
                  color: commandeStatusColorBg(e.status),
                  child: Text(
                    e.status,
                    style: TextStyle(
                      color: commandeStatusColor(e.status),
                    ),
                  ),
                ),
              ),
              DataCell(
                Text(
                  _numberFormat.format(
                    double.parse(e.orderTotal),
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
  }

  Color commandeStatusColorBg(String status) {
    switch (status) {
      case 'cancelled':
        return ColorManager.commandeStatusCancelledBg;
      case 'checkout-draft':
        return ColorManager.commandeStatusCheckoutDraftBg;
      case 'completed':
        return ColorManager.commandeStatusCompletedBg;
      case 'failed':
        return ColorManager.commandeStatusFailedBg;
      case 'on-hold':
        return ColorManager.commandeStatusOnHoldBg;
      case 'pending':
        return ColorManager.commandeStatusPendingBg;
      case 'processing':
        return ColorManager.commandeStatusProcessingBg;
      case 'refunded':
        return ColorManager.commandeStatusRefundedBg;
      default:
        return Colors.black;
    }
  }

  Color commandeStatusColor(String status) {
    switch (status) {
      case 'cancelled':
        return ColorManager.commandeStatusCancelled;
      case 'checkout-draft':
        return ColorManager.commandeStatusCheckoutDraft;
      case 'completed':
        return ColorManager.commandeStatusCompleted;
      case 'failed':
        return ColorManager.commandeStatusFailed;
      case 'on-hold':
        return ColorManager.commandeStatusOnHold;
      case 'pending':
        return ColorManager.commandeStatusPending;
      case 'processing':
        return ColorManager.commandeStatusProcessing;
      case 'refunded':
        return ColorManager.commandeStatusRefunded;
      default:
        return Colors.white;
    }
  }
}
