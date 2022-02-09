import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
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
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> model) {
        if (model.hasData) {
          final List<CategoryModel> categories = model.data
              .where((category) => category.categoryParent != 0)
              .toList();
          return ListView.separated(
              itemBuilder: (context, index) {
                if (categories[index].categorySlug != 'non-classe') {
                  return CustomExpansionTile(
                      //leading: const Icon(Icons.expand_more),
                      trailing: const Text(''),
                      title: Text(categories[index].categoryName),
                      children: [
                        Text('${categories[index].categoryId}'),
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
