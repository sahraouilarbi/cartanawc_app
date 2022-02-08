import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
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
      future: widget._apiService.getCategories(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategorieModel>> model) {
        if (model.hasData) {
          final List<CategorieModel> categories = model.data
              .where((category) => category.categorieParent != 0)
              .toList();
          print(categories.length);
          return ListView.separated(
              itemBuilder: (context, index) {
                if (categories[index].categorieSlug != 'non-classe') {
                  return CustomExpansionTile(
                      //leading: const Icon(Icons.expand_more),
                      trailing: const Text(''),
                      title: Text(categories[index].categorieName),
                      children: [
                        Text('${categories[index].categorieId}'),
                      ]);
                }
                return null;
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: categories.length);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
