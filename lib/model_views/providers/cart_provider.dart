import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/billing_model.dart';
import 'package:cartanawc_app/data/models/cart_request_model.dart';
import 'package:cartanawc_app/data/models/cart_response_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/data/models/shipping_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  APIService _apiService;
  List<CartItemModel> _cartItems;
  CustomerDetailModel _customerDetailModel;
  OrderModel _orderModel = OrderModel();
  bool _isOrderCreated = false;
  String _orderNumber;

  CustomerDetailModel get customerDetailModel => _customerDetailModel;
  List<CartItemModel> get cartItems => _cartItems;
  double get totalRecords => _cartItems.length.toDouble();
  double get totalAmount => _cartItems != null
      ? _cartItems.map<double>((e) => e.lineSubtotal).reduce((a, b) => a + b)
      : 0;

  OrderModel get orderModel => _orderModel;

  bool get isOrderCreated => _isOrderCreated;

  String get orderNumber => _orderNumber;

  CartProvider() {
    _apiService = APIService();
    _cartItems = <CartItemModel>[];
    //fetchCartItems();
  }

  void resetStream() {
    _apiService = APIService();
    _cartItems = <CartItemModel>[];
    //fetchCartItems();
  }

  Future<void> addToCart(CartProductsModel product, Function onCallBack) async {
    final CartRequestModel requestModel = CartRequestModel();

    requestModel.products = <CartProductsModel>[];

    if (_cartItems == null) {
      await fetchCartItems();
    }
    for (final item in _cartItems) {
      requestModel.products.add(CartProductsModel(
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
        _cartItems = <CartItemModel>[];
        _cartItems.addAll(cartResponseModel.data);
      }
      onCallBack(cartResponseModel);
      notifyListeners();
    });
  }

  Future<void> fetchCartItems() async {
    //final bool isLoggedIn = await SharedService.isLoggedIn();
    final isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    if (_cartItems == null) resetStream();
    if (isUserLoggedIn) {
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
    requestModel.products = <CartProductsModel>[];
    if (_cartItems == null) resetStream();

    for (final element in _cartItems) {
      requestModel.products.add(
        CartProductsModel(
          productId: element.productId,
          quantity: element.qty,
          variationId: element.variationId,
        ),
      );
    }

    await _apiService.addToCart(requestModel).then((cartResponseModel) {
      if (cartResponseModel.data != null) {
        _cartItems = <CartItemModel>[];
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
    final userId = await _appPreferences.getUserId();
    _customerDetailModel = await _apiService
        .getCustomerDetails(userId); //_apiService.customerDetails();
    notifyListeners();
  }

  void processOrder(OrderModel orderModel) {
    _orderModel = orderModel;
    notifyListeners();
  }

  Future<void> createOrder() async {
    _orderModel.shipping ??= ShippingModel();
    _orderModel.billing ??= BillingModel();

    if (_customerDetailModel.shipping != null) {
      _orderModel.shipping = _customerDetailModel.shipping;
    }

    if (_customerDetailModel.billing != null) {
      _orderModel.billing = _customerDetailModel.billing;
    }

    if (orderModel.lineItems == null) {
      _orderModel.lineItems = <OrderLineItemsModel>[];
    }
    for (final element in _cartItems) {
      _orderModel.lineItems.add(
        OrderLineItemsModel(
          productId: element.productId,
          quantity: element.qty,
          variationId: element.variationId,
        ),
      );
    }
    await _apiService.createOrder(orderModel).then(
      (orderCreated) {
        if (orderCreated['isOrderCreated'] == true) {
          _isOrderCreated = true;
          _orderNumber = orderCreated['orderNumber'] as String;
          notifyListeners();
        }
      },
    );
  }
}
