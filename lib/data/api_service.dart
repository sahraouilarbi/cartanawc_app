import 'package:cartanawc_app/data/http_service.dart';
import 'package:cartanawc_app/data/models/cart_request_model.dart';
import 'package:cartanawc_app/data/models/cart_response_model.dart';
import 'package:cartanawc_app/data/models/categorie_model.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/order_detail_model.dart';
import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/data/models/payment_method_model.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
import 'package:cartanawc_app/services/shared_service.dart';
import 'package:cartanawc_app/data/api_config.dart';
import 'package:cartanawc_app/presentation/common/utils.dart';
import 'package:dio/dio.dart';

class APIService {
  HttpService httpService = HttpService();

  //***************************************************************************
  //Login
  Future<LoginResponseModel> customerLogin(
      String username, String password) async {
    LoginResponseModel loginResponseModel;
    try {
      final Response response =
          await httpService.postRequest(APIConfig().jwtTokenEndPoint, {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        loginResponseModel =
            LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      printDebugMessage('APIService.loginCustomer Exception : ${e.message}');
    }
    return loginResponseModel;
  }

  //***************************************************************************
  // Customer Details
  Future<CustomerDetailModel> customerDetails() async {
    CustomerDetailModel customerDetailModel;
    try {
      final bool isLoggedIn = await SharedService.isLoggedIn();
      if (isLoggedIn) {
        int userId;
        final LoginResponseModel loginResponseModel =
            await SharedService.loginDetails();
        if (loginResponseModel.data != null) {
          userId = loginResponseModel.data.id;
        }
        final Response response =
            await httpService.getRequest(APIConfig().customerEndPoint(userId));
        if (response.statusCode == 200) {
          customerDetailModel = CustomerDetailModel.fromJson(
              response.data as Map<String, dynamic>);
        }
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        printDebugMessage(e.response.statusCode.toString());
      } else {
        printDebugMessage(e.message.toString());
        printDebugMessage(e.error.toString());
      }
    }
    return customerDetailModel;
  }

  //***************************************************************************
  // Categories
  Future<List<CategorieModel>> getCategories() async {
    List<CategorieModel> categories = <CategorieModel>[];
    try {
      final Response response = await httpService.getRequest(
        APIConfig().categoriesEndPoint,
        queryParameters: {
          'hide_empty': false,
          'per_page': 100,
        },
      );
      if (response.statusCode == 200) {
        categories = (response.data as List)
            .map((i) => CategorieModel.fromJson(i as Map<String, dynamic>))
            .toList();
      }
    } on DioError catch (e) {
      printDebugMessage(e.message);
    }
    return categories;
  }

  //***************************************************************************
  //Produits
  Future<List<Product>> getProducts({
    String status = 'publish',
    String strSearch,
    int pageSize,
    int pageNumber,
    String tagName,
    List<int> productsIds,
    String categoryId,
    String sortBy,
    String sortOrder = 'asc',
  }) async {
    CustomerDetailModel customerDetailModel;
    String userRole = '';

    final bool isLoggedIn = await SharedService.isLoggedIn();

    if (isLoggedIn) {
      customerDetailModel = await customerDetails();
      userRole = customerDetailModel.role;
    }

    List<Product> products = <Product>[];

    try {
      final Map<String, dynamic> params = <String, dynamic>{};

      if (status != null) {
        params['status'] = status;
      }
      if (strSearch != null) {
        params['search'] = strSearch;
      }
      if (pageSize != null) {
        params['per_page'] = pageSize;
      }
      if (pageNumber != null) {
        params['page'] = pageNumber;
      }
      if (tagName != null) {
        params['tag'] = tagName;
      }
      if (productsIds != null) {
        params['include'] = productsIds.join(',').toString();
      }
      if (categoryId != null) {
        params['category'] = categoryId;
      }
      if (sortBy != null) {
        params['orderby'] = sortBy;
      }
      if (sortOrder != null) {
        params['order'] = sortOrder;
      }

      final Response response = await httpService.getRequest(
        APIConfig().productsEndPoint,
        queryParameters: params,
      );
      if (response.statusCode == 200) {
        products = (response.data as List)
            .map((i) => Product.fromJson(i as Map<String, dynamic>))
            .where((element) => element.status == 'publish')
            .toList();
        if (userRole != null) {
          for (final Product product in products) {
            switch (userRole) {
              case 'grossite':
                product.price = product.acf.grossite;
                break;
              case 'super_gros':
                product.price = product.acf.superGros;
                break;
              case 'grand_moyenne_surface':
                product.price = product.acf.grandeMoyenneSurface;
                break;
              case 'hypermarche':
                product.price = product.acf.hypermarche;
                break;
              default:
                product.price = '';
            }
          }
        }
      }
    } on DioError catch (e) {
      printDebugMessage('APIService.getProducts Exception : ${e.response}');
    }
    return products;
  }

  //***************************************************************************
  // Add to cart
  Future<CartResponseModel> addToCart(CartRequestModel model) async {
    final LoginResponseModel loginResponseModel =
        await SharedService.loginDetails();
    if (loginResponseModel.data != null) {
      model.userId = loginResponseModel.data.id;
    }
    CartResponseModel responseModel;
    try {
      final Response response = await httpService.postRequest(
          APIConfig().addToCartEndPoint, model.toJson());
      if (response.statusCode == 200) {
        responseModel =
            CartResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        printDebugMessage(
            'APIService.addToCart Exception (response.statusCode): ${e.response.statusCode}');
      } else {
        printDebugMessage(
            'APIService.addToCart Exception (message): ${e.message}');
        printDebugMessage('APIService.addToCart Exception (error): ${e.error}');
      }
    }
    return responseModel;
  }

  //***************************************************************************
  // Get Cart Items
  Future<CartResponseModel> getCartItem() async {
    CartResponseModel responseModel;
    int _userId;
    try {
      final LoginResponseModel loginResponseModel =
          await SharedService.loginDetails();
      if (loginResponseModel.data != null) {
        _userId = loginResponseModel.data.id;
      }

      final Response response =
          await httpService.getRequest(APIConfig().cartItemsEndPoint(_userId));
      if (response.statusCode == 200) {
        responseModel =
            CartResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }

    return responseModel;
  }

  //***************************************************************************
  // Create Order
  Future<bool> createOrder(OrderModel model) async {
    final LoginResponseModel loginResponseModel =
        await SharedService.loginDetails();
    if (loginResponseModel.data != null) {
      model.customerId = loginResponseModel.data.id;
    }
    bool isOrderCreated = false;
    try {
      final Response response = await httpService.postRequest(
          APIConfig().ordersEndPoint, model.toJson());
      if (response.statusCode == 201) {
        isOrderCreated = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        printDebugMessage(e.response.statusCode.toString());
      } else {
        printDebugMessage(e.message);
        printDebugMessage(e.error.toString());
      }
    }

    return isOrderCreated;
  }

  //***************************************************************************
  // Get Orders
  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> data = <OrderModel>[];
    try {
      final Response response =
          await httpService.getRequest(APIConfig().ordersEndPoint);
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map((element) =>
                OrderModel.fromJson(element as Map<String, dynamic>))
            .toList();
      }
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return data;
  }

  //***************************************************************************
  // Get Orders Details
  Future<OrderDetailModel> getOrderDetails(int orderId) async {
    OrderDetailModel responseModel = OrderDetailModel();
    try {
      final Response response =
          await httpService.getRequest(APIConfig().orderEndPoint(orderId));
      if (response.statusCode == 200) {
        responseModel =
            OrderDetailModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return responseModel;
  }

  Future<List<PaymentGateways>> getPaymentGateways() async {
    List<PaymentGateways> data = <PaymentGateways>[];
    try {
      final Response response =
          await httpService.getRequest(APIConfig().paymentGatewaysEndPoint);
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map((element) =>
                PaymentGateways.fromJson(element as Map<String, dynamic>))
            .toList();
      }
    } on DioError catch (e) {
      printDebugMessage(
          'api_service - getPaymentGateways Exception : ${e.response}');
    }

    return data;
  }
}
