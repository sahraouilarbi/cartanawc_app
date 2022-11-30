import 'dart:io';

import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_endpoint.dart';
import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/presentation/common/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class APIService {
  factory APIService(Dio dio) = _APIServiceImpl;
  Future<LoginResponseModel> login(String _username, String _password);
  Future<CustomerDetailModel> getCustomerDetails(int _userId);
  Future<CustomerDetailModel> updateShippingInformations(
    int _userId,
    ShippingModel _shippingModel,
  );
  Future<ResetPasswordResponseModel> forgotPassword(String _email);
  //Future<CustomerDetailModel> customerDetails();
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
  Future<CartResponseModel> addToCart(CartRequestModel _model);
  Future<CartResponseModel> getCartItem();
  Future<Map<String, dynamic>> createOrder(OrderModel _model);
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
  Future<OrderDetailModel> getOrderDetails(int _orderId);
  Future<List<PaymentGatewaysModel>> getPaymentGateways();
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
    DevenirDistributeurRequestModel _formData,
  );
  Future<ContactResponseModel> contact(ContactRequestModel _formData);
  Future<List<PaiementModel>> getPaiements();
  Future<List<MagasinCosmetiqueModel>> getMagasinsCosmetiques();
}

class _APIServiceImpl implements APIService {
  _APIServiceImpl(this._dio);

  final APIEndPoint _apiEndPoint = APIEndPoint();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final Dio _dio;

  //***************************************************************************
  //Login
  @override
  Future<LoginResponseModel> login(String _username, String _password) async {
    late LoginResponseModel _loginResponseModel;

    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final _data = {'username': _username, 'password': _password};

    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponseModel>(
          Options(
            method: 'POST',
            headers: {
              HttpHeaders.authorizationHeader: '',
            },
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.jwtAuthToken,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _loginResponseModel = LoginResponseModel.fromJson(_response.data!);
    } on DioError catch (e) {
      printDebugMessage('APIService.loginCustomer Exception : ${e.message}');
    }
    return _loginResponseModel;
  }

  //***************************************************************************
  // ForgotPassword
  @override
  Future<ResetPasswordResponseModel> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  //***************************************************************************
  // Get Customer Details
  @override
  Future<CustomerDetailModel> getCustomerDetails(int _userId) async {
    late CustomerDetailModel _customerDetailModel;

    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};

    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomerDetailModel>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                _apiEndPoint.customer(_userId),
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );

      _customerDetailModel = CustomerDetailModel.fromJson(_response.data!);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        printDebugMessage(e.response!.statusCode.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.error.toString());
      }
    }
    return _customerDetailModel;
  }

  //***************************************************************************
  // Update Customer Details
  @override
  Future<CustomerDetailModel> updateShippingInformations(
    int _userId,
    ShippingModel _shippingModel,
  ) async {
    late CustomerDetailModel _customerDetailModel;

    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final _data = {"shipping": _shippingModel.toJson()};

    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        //_setStreamType<ShippingModel>(
        _setStreamType<CustomerDetailModel>(
          Options(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                _apiEndPoint.customer(_userId),
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _customerDetailModel = CustomerDetailModel.fromJson(_response.data!);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        printDebugMessage(e.response!.statusCode.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.error.toString());
      }
    }
    return _customerDetailModel;
  }

  //***************************************************************************
  // Get Categories
  @override
  Future<List<CategoryModel>> getCategories() async {
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final _queryParameters = {
      'hide_empty': false,
      'per_page': 100,
    };
    const _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CategoryModel>>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.categories,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      return (_response.data!)
          .map((_e) => CategoryModel.fromJson(_e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      printDebugMessage('## getCategories DioError : ${e.message}');
    }
    return <CategoryModel>[];
  }

  //***************************************************************************
  //Produits
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
  }) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    if (status != null) {
      _queryParameters['status'] = status;
    }
    if (strSearch != null) {
      _queryParameters['search'] = strSearch;
    }
    if (perPage != null) {
      _queryParameters['per_page'] = perPage;
    }
    if (pageNumber != null) {
      _queryParameters['page'] = pageNumber;
    }
    if (tagName != null) {
      _queryParameters['tag'] = tagName;
    }
    if (productsIds != null) {
      _queryParameters['include'] = productsIds.join(',');
    }
    if (categoryId != null) {
      _queryParameters['category'] = categoryId;
    }
    if (sortBy != null) {
      _queryParameters['orderby'] = sortBy;
    }
    if (sortOrder != null) {
      _queryParameters['order'] = sortOrder;
    }
    List<ProductModel> _products = <ProductModel>[];
    try {
      const Map<String, dynamic> _extra = <String, dynamic>{};
      final Map<String, dynamic> _data = <String, dynamic>{};
      final _response = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ProductModel>>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.products,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _products = (_response.data!)
          .map((_e) => ProductModel.fromJson(_e as Map<String, dynamic>))
          .toList();

      String _userRole = kEMPTY;
      final _isUserLoggedIn = await _appPreferences.isUserLoggedIn();
      if (_isUserLoggedIn) {
        final _userId = await _appPreferences.getUserId();
        final _customerDetailModel = await getCustomerDetails(_userId);
        _userRole = _customerDetailModel.role!;
      }

      for (final ProductModel product in _products) {
        switch (_userRole) {
          case 'grossite':
            product.price = _isUserLoggedIn ? product.acf!.grossite : kEMPTY;
            break;
          case 'super_gros':
            product.price = _isUserLoggedIn ? product.acf!.superGros : kEMPTY;
            break;
          case 'grand_moyenne_surface':
            product.price =
                _isUserLoggedIn ? product.acf!.grandeMoyenneSurface : kEMPTY;
            break;
          case 'hypermarche':
            product.price = _isUserLoggedIn ? product.acf!.hypermarche : kEMPTY;
            break;
          default:
            product.price = kEMPTY;
        }
      }
      return _products;
    } on DioError catch (e) {
      printDebugMessage('APIService.getProducts Exception : ${e.response}');
    }

    return <ProductModel>[];
  }

  //***************************************************************************
  // Add to cart
  @override
  Future<CartResponseModel> addToCart(CartRequestModel model) async {
    // final LoginResponseModel loginResponseModel = await SharedService.loginDetails();
    // if (loginResponseModel.data != null) {
    //   model.userId = loginResponseModel.data.id;
    // }
    model.userId = await _appPreferences.getUserId();
    late CartResponseModel _responseModel;
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = model.toJson();
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartResponseModel>(
          Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.addToCart,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _responseModel = CartResponseModel.fromJson(
        _response.data!,
      ); // as Map<String, dynamic>);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        printDebugMessage(
          'APIService.addToCart Exception (response.statusCode): ${e.response!.statusCode}',
        );
      } else {
        printDebugMessage(
          'APIService.addToCart Exception (message): ${e.message}',
        );
        printDebugMessage('APIService.addToCart Exception (error): ${e.error}');
      }
    }
    return _responseModel;
  }

  //***************************************************************************
  // Get Cart Items
  @override
  Future<CartResponseModel> getCartItem() async {
    late CartResponseModel _responseModel;
    final _userId = await _appPreferences.getUserId();
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final _queryParameters = {'user_id': _userId};
    final Map<String, dynamic> _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartResponseModel>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.cart,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _responseModel = CartResponseModel.fromJson(
        _response.data!,
      ); // as Map<String, dynamic>);
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return _responseModel;
  }

  //***************************************************************************
  // Create Order
  @override
  Future<Map<String, dynamic>> createOrder(OrderModel model) async {
    model.customerId = await _appPreferences.getUserId();
    Map<String, dynamic> _myOrderCreated = <String, dynamic>{};
    bool _isOrderCreated = false;
    String _orderNumber;
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final _data = model.toJson();
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, dynamic>>(
          Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.orders,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );

      final _responseModel =
          OrderModel.fromJson(_response.data!); // as Map<String, dynamic>);
      _orderNumber = _responseModel.orderNumber!;
      _isOrderCreated = true;

      _myOrderCreated = {
        'orderNumber': _orderNumber,
        'isOrderCreated': _isOrderCreated,
      };
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        printDebugMessage(e.response!.statusCode.toString());
      } else {
        printDebugMessage(e.message);
        printDebugMessage(e.error.toString());
      }
    }

    return _myOrderCreated;
  }

  //***************************************************************************
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
  }) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    _queryParameters['customer'] = customerID;
    if (pageNumber != null) {
      _queryParameters['page'] = pageNumber;
    }
    if (pageNumber != null) {
      _queryParameters['per_page'] = perPage;
    }
    if (search != null) {
      _queryParameters['search'] = search;
    }
    if (after != null) {
      _queryParameters['after'] = after;
    }
    if (before != null) {
      _queryParameters['before'] = before;
    }
    if (sortOrder != null) {
      _queryParameters['order'] = sortOrder;
    }
    if (sortBy != null) {
      _queryParameters['orderby'] = sortBy;
    }
    if (status != null) {
      _queryParameters['status'] = status;
    }
    if (product != null) {
      _queryParameters['product'] = product;
    }

    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OrderModel>>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.orders,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      return (_response.data!) // as List<dynamic>)
          .map(
            (element) => OrderModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return <OrderModel>[];
  }

  //***************************************************************************
  // Get Orders Details
  @override
  Future<OrderDetailModel> getOrderDetails(int _orderId) async {
    OrderDetailModel _responseModel = OrderDetailModel();
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderDetailModel>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                _apiEndPoint.order(_orderId),
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _responseModel = OrderDetailModel.fromJson(_response.data!);
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    }
    return _responseModel;
  }

//***************************************************************************
// Get Payment Methods
  @override
  Future<List<PaymentGatewaysModel>> getPaymentGateways() async {
    //List<PaymentGatewaysModel> _getPayments = <PaymentGatewaysModel>[];
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final _queryParamets = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};

    try {
      final _response = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PaymentGatewaysModel>>(
          Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.paymentGateways,
                queryParameters: _queryParamets,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      return (_response.data!)
          .map(
            (element) =>
                PaymentGatewaysModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();
    } on DioError catch (e) {
      printDebugMessage(
        'api_service - getPaymentGateways Exception : ${e.response}',
      );
    }

    return <PaymentGatewaysModel>[];
  }

  // Devenir Distributeur
  @override
  Future<DevenirDistributeurResponseModel> devenirDistributeur(
    DevenirDistributeurRequestModel _formData,
  ) async {
    DevenirDistributeurResponseModel _devenirDistributeurResponse =
        DevenirDistributeurResponseModel();
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParamets = <String, dynamic>{};
    final FormData _data = FormData.fromMap(_formData.toJson());
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DevenirDistributeurResponseModel>(
          Options(
            method: 'POST',
            headers: {
              HttpHeaders.authorizationHeader: "",
              HttpHeaders.contentTypeHeader: "multipart/form-data"
            },
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.devenirDistributeur,
                queryParameters: _queryParamets,
                data: _data,
              )
              .copyWith(baseUrl: APIEndPoint().baseUrl),
        ),
      );
      _devenirDistributeurResponse =
          DevenirDistributeurResponseModel.fromJson(_response.data!);
    } on DioError catch (e) {
      printDebugMessage(
        'api_service - devenirDistributeur Exception - DioError: ${e.response}',
      );
    }
    return _devenirDistributeurResponse;
  }

  // Contact
  @override
  Future<ContactResponseModel> contact(ContactRequestModel _formData) async {
    ContactResponseModel _contactResponse = ContactResponseModel();
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParamets = <String, dynamic>{};
    final FormData _data = FormData.fromMap(_formData.toMap());
    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ContactResponseModel>(
          Options(
            method: 'POST',
            headers: {
              HttpHeaders.authorizationHeader: "",
              HttpHeaders.contentTypeHeader: "multipart/form-data",
            },
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.contact,
                queryParameters: _queryParamets,
                data: _data,
              )
              .copyWith(
                baseUrl: APIEndPoint().baseUrl,
              ),
        ),
      );
      _contactResponse = ContactResponseModel.fromMap(_response.data!);
    } on DioError catch (e) {
      printDebugMessage(
        'api_service - contact Exception - DioError : ${e.response}',
      );
    }
    return _contactResponse;
  }

  // Get Paiements
  @override
  Future<List<PaiementModel>> getPaiements() async {
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PaiementModel>>(
          Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  'Basic ${APIApplicationPassword().basicAuth}',
            },
            extra: _extra,
          )
              .compose(
                _dio.options,
                APIEndPoint.paiements,
                queryParameters: _queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: APIEndPoint().baseUrl,
              ),
        ),
      );
      return (_response.data!)
          .map((_e) => PaiementModel.fromJson(_e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      printDebugMessage(e.response.toString());
    } catch (e) {
      printDebugMessage(e.toString());
    }
    return <PaiementModel>[];
  }

  // Get Magasins Cosmétiques
  @override
  Future<List<MagasinCosmetiqueModel>> getMagasinsCosmetiques() async {
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    try {
      final _response = await _dio.fetch<List<dynamic>>(
        Options(
          method: 'GET',
          headers: {
            HttpHeaders.authorizationHeader:
                'Basic ${APIApplicationPassword().basicAuth}',
          },
          extra: _extra,
        )
            .compose(
              _dio.options,
              APIEndPoint.magasinsCosmetiques,
              queryParameters: _queryParameters,
              data: _data,
            )
            .copyWith(
              baseUrl: APIEndPoint().baseUrl,
            ),
      );
      return (_response.data!)
          .map(
            (_e) => MagasinCosmetiqueModel.fromMap(_e as Map<String, dynamic>),
          )
          .toList();
    } on DioError catch (_e) {
      printDebugMessage(_e.response.toString());
    } catch (_e) {
      printDebugMessage(_e.toString());
    }
    return <MagasinCosmetiqueModel>[];
  }

//***************************************************************************
// Request Options
  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
