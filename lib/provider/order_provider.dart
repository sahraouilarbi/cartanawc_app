import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  APIService _apiService;
  List<OrderModel> _orderList;
  List<OrderModel> get allOrders => _orderList;
  double get totalRecords => _orderList.length.toDouble();
  OrderProvider() {
    resetStream();
  }
  void resetStream() {
    _apiService = APIService();
  }

  Future fetchOrders() async {
    final List<OrderModel> orderList = await _apiService.getOrders();
    _orderList ??= <OrderModel>[];
    if (orderList.isNotEmpty) {
      _orderList = [];
      _orderList.addAll(orderList);
    }
    notifyListeners();
  }
}
