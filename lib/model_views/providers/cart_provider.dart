import 'package:cartanawc_app/data/api_service.dart';
import 'package:cartanawc_app/domain/entities/cart_request_model.dart';
import 'package:cartanawc_app/domain/entities/cart_response_model.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_model.dart';
import 'package:cartanawc_app/domain/entities/order_model.dart';
import 'package:cartanawc_app/services/shared_service.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  APIService _apiService;
  List<CartItem> _cartItems;
  CustomerDetailModel _customerDetailModel;
  OrderModel _orderModel = OrderModel();
  bool _isOrderCreated = false;

  CustomerDetailModel get customerDetailModel => _customerDetailModel;
  List<CartItem> get cartItems => _cartItems;
  double get totalRecords => _cartItems.length.toDouble();
  double get totalAmount => _cartItems != null
      ? _cartItems.map<double>((e) => e.lineSubtotal).reduce((a, b) => a + b)
      : 0;

  OrderModel get orderModel => _orderModel;

  bool get isOrderCreated => _isOrderCreated;

  CartProvider() {
    _apiService = APIService();
    _cartItems = <CartItem>[];
  }

  void resetStream() {
    _apiService = APIService();
    _cartItems = <CartItem>[];
  }

  Future<void> addToCart(CartProducts product, Function onCallBack) async {
    final CartRequestModel requestModel = CartRequestModel();

    requestModel.products = <CartProducts>[];

    if (_cartItems == null) {
      await fetchCartItems();
    }
    for (final item in _cartItems) {
      requestModel.products.add(CartProducts(
        productId: item.productId,
        quantity: item.qty,
        productStep: item.productStep,
        variationId: item.variationId,
      ));
    }

    final isProductExist = requestModel.products.firstWhere(
      (item) =>
          item.productId == product.productId &&
          item.variationId == product.variationId,
      orElse: () => null,
    );

    if (isProductExist != null) {
      requestModel.products.remove(isProductExist);
    }

    requestModel.products.add(product);
    await _apiService.addToCart(requestModel).then((cartResponseModel) {
      if (cartResponseModel.data != null) {
        _cartItems = <CartItem>[];
        _cartItems.addAll(cartResponseModel.data);
      }
      onCallBack(cartResponseModel);
      notifyListeners();
    });
  }

  Future<void> fetchCartItems() async {
    final bool isLoggedIn = await SharedService.isLoggedIn();
    if (_cartItems == null) resetStream();
    if (isLoggedIn) {
      await _apiService.getCartItem().then((cartResponseModel) {
        if (cartResponseModel.data != null) {
          _cartItems.clear();
          _cartItems.addAll(cartResponseModel.data);
        }
        notifyListeners();
      });
    }
  }

  void updateQty(int productId, int qty, {int variationId = 0}) {
    final isProductExist = _cartItems.firstWhere(
        (element) =>
            element.productId == productId &&
            element.variationId == variationId,
        orElse: () => null);
    if (isProductExist != null) {
      isProductExist.qty = qty;
    }
    notifyListeners();
  }

  Future<void> updateCart(Function onCallBack) async {
    final CartRequestModel requestModel = CartRequestModel();
    requestModel.products = <CartProducts>[];
    if (_cartItems == null) resetStream();

    for (final element in _cartItems) {
      requestModel.products.add(
        CartProducts(
          productId: element.productId,
          quantity: element.qty,
          variationId: element.variationId,
        ),
      );
    }

    await _apiService.addToCart(requestModel).then((cartResponseModel) {
      if (cartResponseModel.data != null) {
        _cartItems = <CartItem>[];
        _cartItems.addAll(cartResponseModel.data);
      }
      onCallBack(cartResponseModel);
      notifyListeners();
    });
  }

  void removeItem(int productId) {
    final isProductExist = _cartItems.firstWhere(
        (element) => element.productId == productId,
        orElse: () => null);
    if (isProductExist != null) {
      _cartItems.remove(isProductExist);
    }
    notifyListeners();
  }

  Future fetchShippingDetails() async {
    _customerDetailModel ??= CustomerDetailModel();
    _customerDetailModel = await _apiService.customerDetails();
    notifyListeners();
  }

  void processOrder(OrderModel orderModel) {
    _orderModel = orderModel;
    notifyListeners();
  }

  Future<void> createOrder() async {
    _orderModel.shipping ??= Shipping();
    _orderModel.billing ??= Billing();

    if (_customerDetailModel.shipping != null) {
      _orderModel.shipping = _customerDetailModel.shipping;
    }

    if (_customerDetailModel.billing != null) {
      _orderModel.billing = _customerDetailModel.billing;
    }

    if (orderModel.lineItems == null) {
      _orderModel.lineItems = <LineItems>[];
    }
    for (final element in _cartItems) {
      _orderModel.lineItems.add(LineItems(
        productId: element.productId,
        quantity: element.qty,
        variationId: element.variationId,
      ));
    }
    await _apiService.createOrder(orderModel).then((value) {
      if (value) {
        _isOrderCreated = true;
        notifyListeners();
      }
    });
  }
}
