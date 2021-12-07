import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/product_model.dart';
import 'package:flutter/material.dart';

class SortBy {
  SortBy(this.value, this.text, this.setOrder);
  String value;
  String text;
  String setOrder;
}

enum LoadMoreStatus {
  initial,
  loading,
  stable,
}

class ProductProvider with ChangeNotifier {
  APIService _apiService;
  List<Product> _productList;
  SortBy _sortBy;
  int pageSize = 10;

  List<Product> get allProducts => _productList;

  double get totalRecords => _productList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.stable;

  LoadMoreStatus getLoadMoreStatus() => _loadMoreStatus;

  ProductProvider() {
    resetStreams();
    _sortBy = SortBy('modified', 'Latest', 'asc');
  }

  void resetStreams() {
    _apiService = APIService();
    _productList = <Product>[];
  }

  void setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  void setSortOrder(SortBy sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  Future fetchProducts(
    int pageNumber, {
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String setOrder = 'asc',
  }) async {
    final List<Product> itemModel = await _apiService.getProducts(
      strSearch: strSearch,
      tagName: tagName,
      pageNumber: pageNumber,
      pageSize: pageSize,
      categoryId: categoryId,
      sortBy: _sortBy.value,
      sortOrder: _sortBy.setOrder,
    );
    if (itemModel.isNotEmpty) {
      _productList.addAll(itemModel);
    }
    setLoadingState(LoadMoreStatus.stable);
    notifyListeners();
  }
}
