import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_paiement/tab_paiement_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabPaiement extends StatefulWidget {
  const TabPaiement({Key? key}) : super(key: key);

  @override
  State<TabPaiement> createState() => _TabPaiementState();
}

class _TabPaiementState extends State<TabPaiement> {
  final TabPaiementViewModel _tabPaiementViewModel =
      instance<TabPaiementViewModel>();

  Future<void> _bind() async {
    await _tabPaiementViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _tabPaiementViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _tabPaiementViewModel.outputState,
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
              _tabPaiementViewModel.start();
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
        await _tabPaiementViewModel.start();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Column(
            children: [
              const Text(
                'Liste des Paiements',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppSize.s10),
              _displayPaiements(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayPaiements() {
    return StreamBuilder<List<PaiementEntity>>(
      stream: _tabPaiementViewModel.outputPaiement,
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
                child: _paiementDataTable(snapshot),
              );
            }
        }
        return const SizedBox();
      },
    );
  }

  DataTable _paiementDataTable(AsyncSnapshot<List<PaiementEntity>> snapshot) {
    return DataTable(
      columns: _paiementColumns(),
      rows: _paiementRows(snapshot),
    );
  }

  List<DataColumn> _paiementColumns() {
    return const [
      // DataColumn(
      //   label: Text('#'),
      // ),
      DataColumn(
        label: Text('Date'),
      ),
      DataColumn(
        label: Text('Methode'),
      ),
      DataColumn(
        label: Text('Montant'),
      ),
    ];
  }

  List<DataRow> _paiementRows(AsyncSnapshot<List<PaiementEntity>> snapshot) {
    final _dateFormat = DateFormat('dd/MM/yy');
    final _numberFormat = NumberFormat.currency(locale: "fr-FR", symbol: "DA");

    return snapshot.data!
        .map(
          (e) => DataRow(
            cells: [
              // DataCell(
              //   Text('${e.id}'),
              // ),
              DataCell(
                Text(_dateFormat.format(DateTime.parse(e.date))),
              ),
              DataCell(
                Text(e.acf.methodeDePaiement),
              ),
              DataCell(
                Text(
                  _numberFormat.format(
                    double.parse(e.acf.montant),
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
