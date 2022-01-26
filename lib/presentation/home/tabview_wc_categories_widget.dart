import 'package:cartanawc_app/data/api_service.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/presentation/products/products_page.dart';
import 'package:flutter/material.dart';

/*
 * Build Woocommerce Categories List
 */
Widget tabViewWCCategories() {
  final APIService apiService = APIService();
  return FutureBuilder(
    future: apiService.getCategories(),
    builder: (BuildContext context, AsyncSnapshot<List<CategorieModel>> model) {
      if (model.hasData) {
        final List<CategorieModel> categories = model.data
            .where((element) => element.categorieParent == 0)
            .toList();
        return ListView.separated(
            itemBuilder: (context, index) {
              // Exclure la catégorie "Non-classé" de Woocommerce
              if (categories[index].categorieSlug != 'non-classe') {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                            categorieId: categories[index].categorieId),
                      ),
                    );
                  },
                  leading: const Icon(Icons.keyboard_arrow_right),
                  title: Text(categories[index].categorieName),
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
