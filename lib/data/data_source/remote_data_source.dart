import '/data/api/api_service.dart';
import '/data/models/login_request.dart';

import '/data/models/models.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponseModel> forgotPassword(String email);
  Future<CustomerDetailModel> getCustomerProfile(int userId);
  Future<CustomerDetailModel> updateShippingInformations(
      int _userId, ShippingModel _shippingModel);
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts({
    String? status = 'publish',
    String? strSearch,
    int? perPage,
    int? pageNumber,
    String? tagName,
    List<int>? productsIds,
    String? categoryId,
    String? sortBy,
    String? sortOrder = 'asc',
  });
  Future<CartResponseModel> addToCart(CartRequestModel model);
  Future<CartResponseModel> getCartItem();
  Future<Map<String, dynamic>> createOrder(OrderModel model);
  Future<List<OrderModel>> getOrders();
  Future<OrderDetailModel> getOrderDetails(int orderId);
  Future<List<PaymentGatewaysModel>> getPaymentGateways();
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
      DevenirDistributeurRequestModel _formData);
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
  Future<CustomerDetailModel> updateShippingInformations(
      int _userId, ShippingModel shippingModel) {
    return _apiService.updateShippingInformations(_userId, shippingModel);
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
      {String? status = 'publish',
      String? strSearch,
      int? perPage,
      int? pageNumber,
      String? tagName,
      List<int>? productsIds,
      String? categoryId,
      String? sortBy,
      String? sortOrder = 'asc'}) {
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

  @override
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
      DevenirDistributeurRequestModel _formData) {
    return _apiService.devenirDistributeur(_formData);
  }
}
