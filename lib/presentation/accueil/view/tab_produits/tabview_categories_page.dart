import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/products_page.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/tabview_categories_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:flutter/material.dart';

/*
 * Build Woocommerce Categories List
 */
class TabCategories extends StatefulWidget {
  const TabCategories({Key? key}) : super(key: key);

  @override
  State<TabCategories> createState() => _TabCategoriesState();
}

class _TabCategoriesState extends State<TabCategories> {
  final TabCategoriesViewModel _viewModel = instance<TabCategoriesViewModel>();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData) {
          return snapshot.data!.getScreenWidget(
            context,
            _getContentWidget(),
            () {
              _viewModel.start();
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<List<CategoryEntity>>(
      stream: _viewModel.outputCategories,
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
            }
            break;
        }
        return const SizedBox();
      },
    );
  }

  ListView _displayCategories(AsyncSnapshot<List<CategoryEntity>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductsPage(categoryId: snapshot.data![index].categoryId),
              ),
            );
          },
          leading: const Icon(Icons.keyboard_arrow_right),
          title: Text(snapshot.data![index].categoryName),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: snapshot.data!.length,
    );
  }
}
// class TabCategories extends StatelessWidget {
//   TabCategories({Key? key}) : super(key: key);

//   final APIService apiService = instance<APIService>();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: apiService.getCategories(),
//       builder:
//           (BuildContext context, AsyncSnapshot<List<CategoryModel>> model) {
//         if (model.hasData) {
//           final List<CategoryModel> categories = model.data
//               .where((element) => element.categoryParent == 0)
//               .toList();
//           return ListView.separated(
//               itemBuilder: (context, index) {
//                 // Exclure la catégorie "Non-classé" de Woocommerce
//                 if (categories[index].categorySlug != 'non-classe') {
//                   return ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductsPage(
//                               categorieId: categories[index].categoryId),
//                         ),
//                       );
//                     },
//                     leading: const Icon(Icons.keyboard_arrow_right),
//                     title: Text(categories[index].categoryName),
//                   );
//                 }
//                 return null;
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider();
//               },
//               itemCount: categories.length);
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
