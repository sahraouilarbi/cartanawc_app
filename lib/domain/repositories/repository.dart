import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  // Login
  Future<Either<Failure, LoginResponseModel>> login(LoginRequest loginRequest);

  // Forgot Password
  Future<Either<Failure, ResetPasswordResponseEntity>> forgotPassword(
    String email,
  );

  // Get Customer Profile
  Future<Either<Failure, CustomerDetailEntity>> getCustomerProfile(
    int customerId,
  );

  // Update Customer Profile
  Future<Either<Failure, CustomerDetailEntity>> updateShippingInformations(
    int _userId,
    ShippingEntity _shippingEntity,
  );

  // Get Categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  // GetProducts
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String customerRole, {
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

  // Add to cart
  Future<Either<Failure, CartResponseEntity>> addToCart(CartRequestEntity cart);

  //Get Cart Items
  Future<Either<Failure, CartResponseEntity>> getCartItems(int customerId);

  // Create Order
  Future<Either<Failure, Map<String, dynamic>>> createOrder(OrderEntity order);

  //Get Orders
  Future<Either<Failure, List<OrderEntity>>> getOrders(
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

  // Get OrderDetails
  Future<Either<Failure, OrderDetailEntity>> getOrderDetails(int orderId);

  // Get Payment Gateways
  Future<Either<Failure, List<PaymentGatewaysEntity>>> getPaymentGateways();

  // Devenir distributeur
  Future<Either<Failure, DevenirDistributeurResponseEntity>>
      devenirDistributeur(DevenirDistributeurRequestEntity _formData);

  // Contact
  Future<Either<Failure, ContactResponseEntity>> contact(
    ContactRequestEntity _formData,
  );

  // Get Paiements
  Future<Either<Failure, List<PaiementEntity>>> getPaiements(int customerId);

  // Get Magasins Cosmetiques
  Future<Either<Failure, List<MagasinCosmetiqueEntity>>>
      getMagasinsCosmetiques();
}
