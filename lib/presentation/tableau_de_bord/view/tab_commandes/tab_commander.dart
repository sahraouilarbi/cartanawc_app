import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_commandes/custom_expansion_tile.dart';
import 'package:cartanawc_app/presentation/tableau_de_bord/view/tab_commandes/tab_commander_viewmodel.dart';
import 'package:flutter/material.dart';

class TabCommander extends StatefulWidget {
  const TabCommander({Key? key}) : super(key: key);

  @override
  _TabCommanderState createState() => _TabCommanderState();
}

class _TabCommanderState extends State<TabCommander> {
  final TabCommanderViewModel _tabCommanderViewModel =
      instance<TabCommanderViewModel>();

  void _bind() {
    _tabCommanderViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _tabCommanderViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _tabCommanderViewModel.outputState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.getScreenWidget(
            context,
            _getContentWidget(),
            () {
              _tabCommanderViewModel.start();
            },
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<List<ProductEntity>>(
      stream: _tabCommanderViewModel.outputProducts,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('Pas de données'),
            );
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _displayCategories(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            }
            break;
        }
        return const SizedBox();
      },
    );
  }

  CustomScrollView _displayCategories(
    AsyncSnapshot<List<ProductEntity>> snapshot,
  ) {
    var seen = Set<String>();
    final List<ProductCategoryEntity> uniqueCategory = snapshot.data!
        .map((_e) => _e.categories[1])
        .where((element) => seen.add(element.name))
        .cast<ProductCategoryEntity>()
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final List<ProductEntity> _productsInCategory = snapshot.data!
                  .where(
                    (element) =>
                        element.categories[1].id == uniqueCategory[index].id,
                  )
                  .toList()
                ..sort((a, b) => a.name.compareTo(b.name));

              return CustomExpansionTile(
                title: Text(uniqueCategory[index].name),
                trailing: const Text(''),
                leading: const Icon(Icons.keyboard_arrow_right),
                children: [
                  CustomScrollView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int j) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color:
                                        Colors.grey.withOpacity(AppSize.s0_5),
                                  ),
                                ),
                              ),
                              child: ListTile(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (BuildContext context) =>
                                  //         ProductDetailsPage(
                                  //             data: _productsInCategory[j]),
                                  //   ),
                                  // );
                                  Navigator.pushNamed(
                                    context,
                                    ProductDetailsPage.routeName,
                                    arguments: _productsInCategory[j],
                                  );
                                },
                                leading: Image.network(
                                  _productsInCategory[j]
                                      .images[0]
                                      .woocommerceGalleryThumbnail,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(_productsInCategory[j].name),
                                subtitle: Text(
                                  _productsInCategory[j].sku,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                trailing:
                                    Text('${_productsInCategory[j].price} DA'),
                                tileColor: Colors.grey[100],
                              ),
                            );
                          },
                          childCount: _productsInCategory.length,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            childCount: uniqueCategory.length,
          ),
        ),
      ],
    );
  }
}
