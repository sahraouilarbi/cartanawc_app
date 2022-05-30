import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/products_page.dart';
import 'package:flutter/material.dart';

import '/data/models/models.dart';

/*
 * Build Woocommerce Categories List
 */
Widget tabViewWCCategories() {
  //final APIService apiService = APIServiceImpl();
  final APIService apiService = instance<APIService>();
  return FutureBuilder(
    future: apiService.getCategories(),
    builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> model) {
      if (model.hasData) {
        final List<CategoryModel> categories =
            model.data.where((element) => element.categoryParent == 0).toList();
        return ListView.separated(
            itemBuilder: (context, index) {
              // Exclure la catégorie "Non-classé" de Woocommerce
              if (categories[index].categorySlug != 'non-classe') {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                            categorieId: categories[index].categoryId),
                      ),
                    );
                  },
                  leading: const Icon(Icons.keyboard_arrow_right),
                  title: Text(categories[index].categoryName),
                );
              }
              return null;
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: categories.length);
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}
