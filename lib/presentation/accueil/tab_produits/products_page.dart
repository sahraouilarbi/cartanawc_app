import 'dart:async';

import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
import 'package:cartanawc_app/model_views/providers/product_provider.dart';
import 'package:cartanawc_app/presentation/accueil/tab_produits/product_card_widget.dart';
import 'package:cartanawc_app/presentation/common/base_page.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends BasePage {
  const ProductPage({Key key, this.categorieId}) : super(key: key);
  final int categorieId;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BasePageState<ProductPage> {
  int _page = 1;
  final ScrollController _scrollController = ScrollController();
  final _searchQuery = TextEditingController();
  Timer _debounce;
  final _sortByOptions = [
    SortBy('popularity', 'Popularity', 'asc'),
    SortBy('modified', 'Modified', 'asc'),
    SortBy('price', 'Price: High to low', 'desc'),
    SortBy('price', 'Price: low to High', 'asc'),
  ];
  //APIService apiService = APIServiceImpl();
  APIService apiService = instance<APIService>();

  @override
  void initState() {
    super.initState();
    final productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingState(LoadMoreStatus.initial);
    productList.fetchProducts(_page, categoryId: widget.categorieId.toString());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productList.setLoadingState(LoadMoreStatus.loading);
        productList.fetchProducts(++_page,
            categoryId: widget.categorieId.toString());
      }
    });
    _searchQuery.addListener(_onSearchChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchQuery.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChange() {
    final productList = Provider.of<ProductProvider>(context, listen: false);
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: AppDuration.ms750), () {
      productList.resetStreams();
      productList.setLoadingState(LoadMoreStatus.initial);
      productList.fetchProducts(_page,
          categoryId: widget.categorieId.toString(),
          strSearch: _searchQuery.text);
    });
  }

  @override
  Widget pageUI() {
    return _productList();
  }

  Widget _productList() {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, productsModel, child) {
        if (productsModel.allProducts != null &&
            productsModel.allProducts.isNotEmpty &&
            productsModel.getLoadMoreStatus() != LoadMoreStatus.initial) {
          return _buildList(productsModel.allProducts,
              productsModel.getLoadMoreStatus() == LoadMoreStatus.loading);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildList(List<ProductModel> items, bool isLoadingMore) {
    return Column(
      children: [
        //_productFilter(),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductTile(data: items[index]);
            },
            itemCount: items.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
        Visibility(
          visible: isLoadingMore,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p5),
            height: 35.0,
            width: 35.0,
            child: const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _productFilter() {
    return Container(
      height: getProportionateScreenHeight(51.0),
      margin: const EdgeInsets.fromLTRB(
          AppMargin.m10, AppMargin.m10, AppMargin.m10, AppMargin.m5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _searchQuery,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Recherche',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE6E6EC),
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: AppSize.s15),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6EC),
              borderRadius: BorderRadius.circular(AppSize.s9),
            ),
            child: PopupMenuButton(
              onSelected: (SortBy sortBy) {
                final productList =
                    Provider.of<ProductProvider>(context, listen: false);
                productList.resetStreams();
                productList.setSortOrder(sortBy);
                productList.fetchProducts(_page,
                    categoryId: widget.categorieId.toString());
              },
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map(
                  (item) {
                    return PopupMenuItem(
                      value: item,
                      child: Text(item.text),
                    );
                  },
                ).toList();
              },
              icon: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
