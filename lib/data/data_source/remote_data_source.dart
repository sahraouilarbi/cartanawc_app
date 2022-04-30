import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/cart_request_model.dart';
import 'package:cartanawc_app/data/models/cart_response_model.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/forgot_password_response_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/data/models/order_detail_model.dart';
import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/data/models/payment_method_model.dart';
import 'package:cartanawc_app/data/models/product_model.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponseModel> forgotPassword(String email);
  Future<CustomerDetailModel> getCustomerProfile(int userId);
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts({
    String status = 'publish',
    String strSearch,
    int perPage,
    int pageNumber,
    String tagName,
    List<int> productsIds,
    String categoryId,
    String sortBy,
    String sortOrder = 'asc',
  });
  Future<CartResponseModel> addToCart(CartRequestModel model);
  Future<CartResponseModel> getCartItem();
  Future<Map<String, dynamic>> createOrder(OrderModel model);
  Future<List<OrderModel>> getOrders();
  Future<OrderDetailModel> getOrderDetails(int orderId);
  Future<List<PaymentGatewaysModel>> getPaymentGateways();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._apiService);
  final APIService _apiService;
  @override
  Future<LoginResponseModel> login(LoginRequest loginRequest) async {
    return _apiService.login(loginRequest.username, loginRequest.password);
  }

  @override
  Future<CustomerDetailModel> getCustomerProfile(int userId) {
    return _apiService.getCustomerDetails(userId);
  }

  @override
  Future<ForgotPasswordResponseModel> forgotPassword(String email) {
    return _apiService.forgotPassword(email);
  }

  @override
  Future<CartResponseModel> addToCart(CartRequestModel model) {
    return _apiService.addToCart(model);
  }

  @override
  Future<Map<String, dynamic>> createOrder(OrderModel model) {
    return _apiService.createOrder(model);
  }

  @override
  Future<CartResponseModel> getCartItem() {
    return _apiService.getCartItem();
  }

  @override
  Future<List<CategoryModel>> getCategories() {
    return _apiService.getCategories();
  }

  @override
  Future<OrderDetailModel> getOrderDetails(int orderId) {
    return _apiService.getOrderDetails(orderId);
  }

  @override
  Future<List<OrderModel>> getOrders() {
    return _apiService.getOrders();
  }

  @override
  Future<List<PaymentGatewaysModel>> getPaymentGateways() {
    return _apiService.getPaymentGateways();
  }

  @override
  Future<List<ProductModel>> getProducts(
      {String status = 'publish',
      String strSearch,
      int perPage,
      int pageNumber,
      String tagName,
      List<int> productsIds,
      String categoryId,
      String sortBy,
      String sortOrder = 'asc'}) {
    return _apiService.getProducts(
      status: status,
      strSearch: strSearch,
      perPage: perPage,
      pageNumber: pageNumber,
      tagName: tagName,
      productsIds: productsIds,
      categoryId: categoryId,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }
}
