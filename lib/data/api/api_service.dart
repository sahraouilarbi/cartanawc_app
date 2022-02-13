import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
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
import 'package:cartanawc_app/data/api/api_endpoint.dart';
import 'package:cartanawc_app/presentation/common/utils.dart';
import 'package:dio/dio.dart';

class APIService {
  final APIEndPoint _apiEndPoint = APIEndPoint();
  HttpService httpService = HttpService();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  //***************************************************************************
  //Login
  Future<LoginResponseModel> login(String username, String password) async {
    LoginResponseModel loginResponseModel;

    try {
      final Response response =
          await httpService.postRequest(APIEndPoint.jwtAuthToken, {
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
  // Get Customer Details
  Future<CustomerDetailModel> getCustomerDetails(int userId) async {
    CustomerDetailModel customerDetailModel;
    try {
      final Response response =
          await httpService.getRequest(_apiEndPoint.customer(userId));
      if (response.statusCode == 200) {
        customerDetailModel =
            CustomerDetailModel.fromJson(response.data as Map<String, dynamic>);
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
  // Customer Details
  // TODO A SUPRIMMER SI gerCustomerDetails() fonctionne !!
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
            await httpService.getRequest(_apiEndPoint.customer(userId));
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
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = <CategoryModel>[];
    try {
      final Response response = await httpService.getRequest(
        APIEndPoint.categories,
        queryParameters: {
          'hide_empty': false,
          'per_page': 100,
        },
      );
      if (response.statusCode == 200) {
        categories = (response.data as List)
            .map((i) => CategoryModel.fromJson(i as Map<String, dynamic>))
            .toList();
      }
    } on DioError catch (e) {
      printDebugMessage(e.message);
    }
    return categories;
  }

  //***************************************************************************
  //Produits
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
  }) async {
    CustomerDetailModel customerDetailModel;
    //String userRole = '';

    //final bool isLoggedIn = await SharedService.isLoggedIn();
    // if (isLoggedIn) {
    //   customerDetailModel = await customerDetails();
    //   userRole = customerDetailModel.role;
    // }

    // ***
    final _isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    final _userId = await _appPreferences.getUserId();
    final _customerDetailModel = await getCustomerDetails(_userId);
    final _userRole = _customerDetailModel.role;
    // ***

    List<ProductModel> products = <ProductModel>[];

    try {
      final Map<String, dynamic> params = <String, dynamic>{};

      if (status != null) {
        params['status'] = status;
      }
      if (strSearch != null) {
        params['search'] = strSearch;
      }
      if (perPage != null) {
        params['per_page'] = perPage;
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
        APIEndPoint.products,
        queryParameters: params,
      );
      if (response.statusCode == 200) {
        products = (response.data as List)
            .map((i) => ProductModel.fromJson(i as Map<String, dynamic>))
            .where((element) => element.status == 'publish')
            .toList();
        if (_userRole != null) {
          for (final ProductModel product in products) {
            switch (_userRole) {
              case 'grossite':
                product.price = _isUserLoggedIn ? product.acf.grossite : '';
                break;
              case 'super_gros':
                product.price = _isUserLoggedIn ? product.acf.superGros : '';
                break;
              case 'grand_moyenne_surface':
                product.price =
                    _isUserLoggedIn ? product.acf.grandeMoyenneSurface : '';
                break;
              case 'hypermarche':
                product.price = _isUserLoggedIn ? product.acf.hypermarche : '';
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
    // final LoginResponseModel loginResponseModel = await SharedService.loginDetails();
    // if (loginResponseModel.data != null) {
    //   model.userId = loginResponseModel.data.id;
    // }
    model.userId = await _appPreferences.getUserId();
    CartResponseModel responseModel;
    try {
      final Response response =
          await httpService.postRequest(APIEndPoint.addToCart, model.toJson());
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
    final _userId = await _appPreferences.getUserId();
    final Map<String, dynamic> params = {'user_id': _userId};
    print('api_service -> getCartItem -> params : $params');
    try {
      final Response response = await httpService.getRequest(
        APIEndPoint.cart,
        queryParameters: params,
      );
      if (response.statusCode == 200) {
        responseModel =
            CartResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    print('api_service -> getCartItems -> responseModel : $responseModel');
    return responseModel;
  }

  //***************************************************************************
  // Create Order
  Future<Map<String, dynamic>> createOrder(OrderModel model) async {
    model.customerId = await _appPreferences.getUserId();
    Map<String, dynamic> myOrderCreated = <String, dynamic>{};
    bool isOrderCreated = false;
    String orderNumber;
    try {
      final Response response =
          await httpService.postRequest(APIEndPoint.orders, model.toJson());
      if (response.statusCode == 201) {
        final responseModel =
            OrderModel.fromJson(response.data as Map<String, dynamic>);
        orderNumber = responseModel.number;
        isOrderCreated = true;

        myOrderCreated = {
          'orderNumber': orderNumber,
          'isOrderCreated': isOrderCreated,
        };
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        printDebugMessage(e.response.statusCode.toString());
      } else {
        printDebugMessage(e.message);
        printDebugMessage(e.error.toString());
      }
    }

    return myOrderCreated;
  }

  //***************************************************************************
  // Get Orders
  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> data = <OrderModel>[];
    try {
      final Response response =
          await httpService.getRequest(APIEndPoint.orders);
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
          await httpService.getRequest(_apiEndPoint.order(orderId));
      if (response.statusCode == 200) {
        responseModel =
            OrderDetailModel.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return responseModel;
  }

  Future<List<PaymentGatewaysModel>> getPaymentGateways() async {
    List<PaymentGatewaysModel> data = <PaymentGatewaysModel>[];
    try {
      final Response response =
          await httpService.getRequest(APIEndPoint.paymentGateways);
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map((element) =>
                PaymentGatewaysModel.fromJson(element as Map<String, dynamic>))
            .toList();
      }
    } on DioError catch (e) {
      printDebugMessage(
          'api_service - getPaymentGateways Exception : ${e.response}');
    }

    return data;
  }
}
