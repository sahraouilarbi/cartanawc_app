import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';

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
  Repository _repository;
  List<ProductEntity> _productList;
  SortBy _sortBy;
  int pageSize = 10;

  List<ProductEntity> get allProducts => _productList;

  double get totalRecords => _productList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.stable;

  LoadMoreStatus getLoadMoreStatus() => _loadMoreStatus;

  void resetStreams() {
    _repository = instance<Repository>();
    _productList = <ProductEntity>[];
  }

  ProductProvider() {
    resetStreams();
    _sortBy = SortBy('modified', 'Latest', 'asc');
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
    String sortOrder,
  }) async {
    final List<ProductEntity> itemEntity = <ProductEntity>[];
    // itemEntity = await _repository.getProducts(
    //   categoryId,
    //   strSearch: strSearch,
    //   tagName: tagName,
    //   pageNumber: pageNumber,
    //   perPage: pageSize,
    //   categoryId: categoryId,
    //   sortBy: _sortBy.value,
    //   sortOrder: _sortBy.setOrder,
    // );
    if (itemEntity.isNotEmpty) {
      _productList.addAll(itemEntity);
    }
    setLoadingState(LoadMoreStatus.stable);
    notifyListeners();
  }
}

// class ProductProvider with ChangeNotifier {
//   APIService _apiService;
//   List<ProductModel> _productList;
//   SortBy _sortBy;
//   int pageSize = 10;

//   List<ProductModel> get allProducts => _productList;

//   double get totalRecords => _productList.length.toDouble();

//   LoadMoreStatus _loadMoreStatus = LoadMoreStatus.stable;

//   LoadMoreStatus getLoadMoreStatus() => _loadMoreStatus;

//   ProductProvider() {
//     resetStreams();
//     _sortBy = SortBy('modified', 'Latest', 'asc');
//   }

//   void resetStreams() {
//     //_apiService = APIServiceImpl();
//     _apiService = instance<APIService>();
//     _productList = <ProductModel>[];
//   }

//   void setLoadingState(LoadMoreStatus loadMoreStatus) {
//     _loadMoreStatus = loadMoreStatus;
//     notifyListeners();
//   }

//   void setSortOrder(SortBy sortBy) {
//     _sortBy = sortBy;
//     notifyListeners();
//   }

//   Future fetchProducts(
//     int pageNumber, {
//     String strSearch,
//     String tagName,
//     String categoryId,
//     String sortBy,
//     String setOrder = 'asc',
//   }) async {
//     final List<ProductModel> itemModel = await _apiService.getProducts(
//       strSearch: strSearch,
//       tagName: tagName,
//       pageNumber: pageNumber,
//       perPage: pageSize,
//       categoryId: categoryId,
//       sortBy: _sortBy.value,
//       sortOrder: _sortBy.setOrder,
//     );
//     if (itemModel.isNotEmpty) {
//       _productList.addAll(itemModel);
//     }
//     setLoadingState(LoadMoreStatus.stable);
//     notifyListeners();
//   }
// }