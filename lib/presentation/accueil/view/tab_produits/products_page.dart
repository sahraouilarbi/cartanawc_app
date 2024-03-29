import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/products_viewmodel.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_produits/widgets/product_card_widget.dart';
import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_anonymous_widget.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsViewModel _viewModel = instance<ProductsViewModel>();

  void _bind() {
    _viewModel.categoryId = widget.categoryId;

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
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const DrawerForAnonymous(),
      body: StreamBuilder<FlowState>(
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
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<List<ProductEntity>>(
      stream: _viewModel.outputProducts,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(child: Text("Aucun produit n'est disponible"));
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _displayProducts(snapshot);
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            break;
          default:
            return const Center(
              child: Text('Pas de données'),
            );
        }
        return const SizedBox();
      },
    );
  }

  Widget _displayProducts(AsyncSnapshot<List<ProductEntity>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProductTile(data: snapshot.data![index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: snapshot.data!.length,
    );
  }
}
// class ProductPage extends StatefulWidget {
//   const ProductPage({Key? key, required this.categoryId}) : super(key: key);
//   final int categoryId;
//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   int _page = 1;
//   final ScrollController _scrollController = ScrollController();
//   final _searchQuery = TextEditingController();
//   Timer? _debounce;
//   final _sortByOptions = [
//     SortBy('popularity', 'Popularity', 'asc'),
//     SortBy('modified', 'Modified', 'asc'),
//     SortBy('price', 'Price: High to low', 'desc'),
//     SortBy('price', 'Price: low to High', 'asc'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final productList = Provider.of<ProductProvider>(context, listen: false);
//     productList.resetStreams();
//     productList.setLoadingState(LoadMoreStatus.initial);
//     productList.fetchProducts(_page, categoryId: widget.categoryId.toString());
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         productList.setLoadingState(LoadMoreStatus.loading);
//         productList.fetchProducts(++_page,
//             categoryId: widget.categoryId.toString());
//       }
//     });
//     _searchQuery.addListener(_onSearchChange);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _searchQuery.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onSearchChange() {
//     final productList = Provider.of<ProductProvider>(context, listen: false);
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(
//       const Duration(milliseconds: AppDuration.ms750),
//       () {
//         productList.resetStreams();
//         productList.setLoadingState(LoadMoreStatus.initial);
//         productList.fetchProducts(
//           _page,
//           categoryId: widget.categoryId.toString(),
//           strSearch: _searchQuery.text,
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _productList();
//   }

//   Widget _productList() {
//     return Consumer<ProductProvider>(
//       builder: (BuildContext context, productsEntity, child) {
//         if (productsEntity.allProducts != null &&
//             productsEntity.allProducts.isNotEmpty &&
//             productsEntity.getLoadMoreStatus() != LoadMoreStatus.initial) {
//           return _buildList(productsEntity.allProducts,
//               productsEntity.getLoadMoreStatus() == LoadMoreStatus.loading);
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }

//   Widget _buildList(List<ProductEntity> items, bool isLoadingMore) {
//     return Column(
//       children: [
//         //_productFilter(),
//         Expanded(
//           child: ListView.separated(
//             shrinkWrap: true,
//             controller: _scrollController,
//             physics: const ClampingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return ProductTile(data: items[index]);
//             },
//             itemCount: items.length,
//             separatorBuilder: (context, index) {
//               return const Divider();
//             },
//           ),
//         ),
//         Visibility(
//           visible: isLoadingMore,
//           child: Container(
//             padding: const EdgeInsets.all(AppPadding.p5),
//             height: 35.0,
//             width: 35.0,
//             child: const CircularProgressIndicator(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _productFilter() {
//     return Container(
//       height: getProportionateScreenHeight(51.0),
//       margin: const EdgeInsets.fromLTRB(
//         AppMargin.m10,
//         AppMargin.m10,
//         AppMargin.m10,
//         AppMargin.m5,
//       ),
//       child: Row(
//         children: [
//           Flexible(
//             child: TextField(
//               controller: _searchQuery,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 hintText: 'Recherche',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s15),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: const Color(0xFFE6E6EC),
//                 filled: true,
//               ),
//             ),
//           ),
//           const SizedBox(width: AppSize.s15),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFFE6E6EC),
//               borderRadius: BorderRadius.circular(AppSize.s9),
//             ),
//             child: PopupMenuButton(
//               onSelected: (SortBy sortBy) {
//                 final productList =
//                     Provider.of<ProductProvider>(context, listen: false);
//                 productList.resetStreams();
//                 productList.setSortOrder(sortBy);
//                 productList.fetchProducts(_page,
//                     categoryId: widget.categoryId.toString());
//               },
//               itemBuilder: (BuildContext context) {
//                 return _sortByOptions.map(
//                   (item) {
//                     return PopupMenuItem(
//                       value: item,
//                       child: Text(item.text),
//                     );
//                   },
//                 ).toList();
//               },
//               icon: const Icon(Icons.more_vert),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
