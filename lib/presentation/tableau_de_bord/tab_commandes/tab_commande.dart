import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
import 'package:cartanawc_app/presentation/product/product_details_page.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';

import 'custom_expansion_tile.dart';

class TabCommande extends StatefulWidget {
  TabCommande({Key key}) : super(key: key);

  final APIService _apiService = instance<APIService>();
  @override
  _TabCommandeState createState() => _TabCommandeState();
}

class _TabCommandeState extends State<TabCommande> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._apiService.getProducts(perPage: 100),
      builder: (BuildContext context,
          AsyncSnapshot<List<ProductModel>> _productSnapshot) {
        if (_productSnapshot.hasData) {
          var seen = Set<String>();
          final List<CategoriesModel> uniqueCategory = _productSnapshot.data
              .map((e) => e.categories[1])
              .where((element) => seen.add(element.name))
              .cast<CategoriesModel>()
              .toList()
                ..sort((a, b) => a.name.compareTo(b.name));

          return CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final List<ProductModel> _productsInCategory =
                        _productSnapshot.data
                            .where((element) =>
                                element.categories[1].id ==
                                uniqueCategory[index].id)
                            .toList()
                              ..sort((a, b) => a.name.compareTo(b.name));

                    return CustomExpansionTile(
                      title: Text(uniqueCategory[index].name.toString()),
                      trailing: const Text(''),
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
                                            color: Colors.grey
                                                .withOpacity(AppSize.s0_5)),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ProductDetails(
                                                    data:
                                                        _productsInCategory[j]),
                                          ),
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
                                        _productsInCategory[j].sku ?? '',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      trailing: Text(
                                          '${_productsInCategory[j].price} DA'),
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
        } else if (_productSnapshot.hasError) {
          return Text(_productSnapshot.hasError.toString());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

/**
    return ListView.separated(
    itemBuilder: (context, index) {
    final List<ProductModel> _productsInCategory = _productSnapshot
    .data
    .where((element) =>
    element.categories[1].id == _categoriesModel[index].id)
    .toList();
    print(_productsInCategory.length);
    return CustomExpansionTile(
    title: Text(_categoriesModel[index].name),
    children: [
    ListView.separated(
    itemBuilder: (context, j) {
    return Text(_productsInCategory[j].name);
    },
    separatorBuilder: (context, j) => const Divider(),
    itemCount: _productsInCategory.length,
    ),
    ],
    );
    },
    separatorBuilder: (context, index) => const Divider(),
    itemCount: _categoriesModel.length);
 */
