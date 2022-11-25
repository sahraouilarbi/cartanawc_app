import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  late APIService _apiService;
  late List<OrderModel> _orderList;
  List<OrderModel> get allOrders => _orderList;
  double get totalRecords => _orderList.length.toDouble();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  late int _customerId;

  OrderProvider() {
    resetStream();
  }

  Future<void> resetStream() async {
    //_apiService = APIServiceImpl();
    _apiService = instance<APIService>();
    _customerId = await _appPreferences.getUserId();
  }

  Future fetchOrders() async {
    final List<OrderModel> orderList = await _apiService.getOrders(_customerId);
    //_orderList ??= <OrderModel>[];
    //if (_orderList == null) _orderList = <OrderModel>[];
    if (orderList.isNotEmpty) {
      _orderList = [];
      _orderList.addAll(orderList);
    }
    notifyListeners();
  }
}
