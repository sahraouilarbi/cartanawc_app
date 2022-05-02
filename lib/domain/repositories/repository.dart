import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';
import 'package:cartanawc_app/domain/entities/cart_request_entity.dart';
import 'package:cartanawc_app/domain/entities/cart_response_entity.dart';
import 'package:cartanawc_app/domain/entities/categorie_entity.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/forgot_password_response_entity.dart';
import 'package:cartanawc_app/domain/entities/order_detail_entity.dart';
import 'package:cartanawc_app/domain/entities/order_entity.dart';
import 'package:cartanawc_app/domain/entities/payment_method_entity.dart';
import 'package:cartanawc_app/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  // Login
  Future<Either<Failure, LoginResponseModel>> login(LoginRequest loginRequest);

  // Forgot Password
  Future<Either<Failure, ForgotPasswordResponseEntity>> forgotPassword(
      String email);

  // Get Customer Profile
  Future<Either<Failure, CustomerDetailEntity>> getCustomerProfile(
      int customerId);

  // Get Categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  // GetProducts
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String customerRole, {
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

  // Add to cart
  Future<Either<Failure, CartResponseEntity>> addToCart(CartRequestEntity cart);

  //Get Cart Items
  Future<Either<Failure, CartResponseEntity>> getCartItems(int customerId);

  // Create Order
  Future<Either<Failure, Map<String, dynamic>>> createOrder(OrderEntity order);

  //Get Orders
  Future<Either<Failure, List<OrderEntity>>> getOrders(
    int customerID, {
    int pageNumber = 1,
    int perPage = 10,
    String search,
    String after,
    String before,
    String sortOrder = 'desc',
    String sortBy = 'date',
    String status = 'any',
    int product,
  });

  // Get OrderDetails
  Future<Either<Failure, OrderDetailEntity>> getOrderDetails(int orderId);

  // Get Payment Gateways
  Future<Either<Failure, List<PaymentGatewaysEntity>>> getPaymentGateways();
}
