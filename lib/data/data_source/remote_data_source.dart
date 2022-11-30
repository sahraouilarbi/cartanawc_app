import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/login_request.dart';

import 'package:cartanawc_app/data/models/models.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
  Future<ResetPasswordResponseModel> forgotPassword(String email);
  Future<CustomerDetailModel> getCustomerProfile(int userId);
  Future<CustomerDetailModel> updateShippingInformations(
    int _userId,
    ShippingModel _shippingModel,
  );
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
  Future<List<OrderModel>> getOrders(
    int customerID, {
    int? pageNumber = 1,
    int? perPage = 10,
    String? search,
    String? after,
    String? before,
    String? sortOrder = 'desc',
    String? sortBy = 'date',
    String? status = 'any',
    int? product,
  });
  Future<OrderDetailModel> getOrderDetails(int orderId);
  Future<List<PaymentGatewaysModel>> getPaymentGateways();
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
    DevenirDistributeurRequestModel _formData,
  );
  Future<ContactResponseModel> contact(ContactRequestModel _formData);
  Future<List<PaiementModel>> getPaiements();
  Future<List<MagasinCosmetiqueModel>> getMagasinsCosmetiques();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._apiService);
  final APIService _apiService;

  // Login
  @override
  Future<LoginResponseModel> login(LoginRequest loginRequest) async {
    return _apiService.login(loginRequest.username, loginRequest.password);
  }

  // Get Customer Profile
  @override
  Future<CustomerDetailModel> getCustomerProfile(int userId) {
    return _apiService.getCustomerDetails(userId);
  }

  // Update Shipping Informations
  @override
  Future<CustomerDetailModel> updateShippingInformations(
    int _userId,
    ShippingModel shippingModel,
  ) {
    return _apiService.updateShippingInformations(_userId, shippingModel);
  }

  // Forgot Password
  @override
  Future<ResetPasswordResponseModel> forgotPassword(String email) {
    return _apiService.forgotPassword(email);
  }

  // Add to cart
  @override
  Future<CartResponseModel> addToCart(CartRequestModel model) {
    return _apiService.addToCart(model);
  }

  // Create order
  @override
  Future<Map<String, dynamic>> createOrder(OrderModel model) {
    return _apiService.createOrder(model);
  }

  // Get Cart Item
  @override
  Future<CartResponseModel> getCartItem() {
    return _apiService.getCartItem();
  }

  // Get Categories
  @override
  Future<List<CategoryModel>> getCategories() {
    return _apiService.getCategories();
  }

  // Get Order Details
  @override
  Future<OrderDetailModel> getOrderDetails(int orderId) {
    return _apiService.getOrderDetails(orderId);
  }

  // Get Orders
  @override
  Future<List<OrderModel>> getOrders(
    int customerID, {
    int? pageNumber = 1,
    int? perPage = 10,
    String? search,
    String? after,
    String? before,
    String? sortOrder = 'desc',
    String? sortBy = 'date',
    String? status = 'any',
    int? product,
  }) {
    return _apiService.getOrders(
      customerID,
      pageNumber: pageNumber,
      perPage: perPage,
      search: search,
      after: after,
      before: before,
      sortOrder: sortOrder,
      sortBy: sortBy,
      status: status,
      product: product,
    );
  }

  // Get Payment Gateways
  @override
  Future<List<PaymentGatewaysModel>> getPaymentGateways() {
    return _apiService.getPaymentGateways();
  }

  // Get Products
  @override
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
  }) {
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

  // Devenir Distributeur
  @override
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
    DevenirDistributeurRequestModel _formData,
  ) {
    return _apiService.devenirDistributeur(_formData);
  }

  // Contact
  @override
  Future<ContactResponseModel> contact(ContactRequestModel _formData) {
    return _apiService.contact(_formData);
  }

  // Get Paiement
  @override
  Future<List<PaiementModel>> getPaiements() {
    return _apiService.getPaiements();
  }

  // Get Magasins Cosmetiques
  @override
  Future<List<MagasinCosmetiqueModel>> getMagasinsCosmetiques() {
    return _apiService.getMagasinsCosmetiques();
  }
}
