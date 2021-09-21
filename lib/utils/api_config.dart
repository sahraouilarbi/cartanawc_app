import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIConfig {
  final String _wpNameSpace = '/wp-json';
  final String _wcNameSpace = '/wc/v3';
  final String _customers = '/customers';
  final String _products = '/products';
  final String _categories = '/categories';
  final String _cart = '/cart';
  final String _addToCart = '/addtocart';
  final String _orders = '/orders';
  final String _paymentGateways = '/payment_gateways';
  final String _wdpRules = '/wdp-rules/all';
  final String _cartanaLogoUrl = '/wp-content/uploads/2021/05/cartana-logo.png';
  final String _token = '/jwt-auth/v1/token';

  // Base URL
  String get baseUrl {
    return dotenv.env['SITE_URL'];
  }

  // Site Logo
  String get cartanaLogoSrc {
    return '$baseUrl$_cartanaLogoUrl';
  }

  // Products Endpoint
  String get productsEndPoint {
    return _wpNameSpace + _wcNameSpace + _products;
  }

  // Categories Endpoint
  String get categoriesEndPoint {
    return _wpNameSpace + _wcNameSpace + _products + _categories;
  }

  // Customer Endpoint
  String customerEndPoint(int userId) {
    return '$_wpNameSpace$_wcNameSpace$_customers/$userId';
  }

  // PaymentMethod Endpoint
  String get paymentGatewaysEndPoint {
    return _wpNameSpace + _wcNameSpace + _paymentGateways;
  }

  // Orders Endpoint
  String get ordersEndPoint {
    return _wpNameSpace + _wcNameSpace + _orders;
  }

  // One Order Endpoint
  String orderEndPoint(int orderId) {
    return '$ordersEndPoint/$orderId';
  }

  // CartItem for current user Endpoint
  String cartItemsEndPoint(int userId) {
    return '$_wpNameSpace$_wcNameSpace$_cart/$userId';
  }

  // Add to cart endpoint
  String get addToCartEndPoint {
    return _wpNameSpace + _wcNameSpace + _addToCart;
  }

  //Basic Auth with Consumer key and Consumer Secret
  String get consumerBasicAuth {
    return base64Encode(utf8.encode(
        '${dotenv.env['CONSUMER_KEY']}:${dotenv.env['CONSUMER_SECRET']}'));
  }

  // Site url width Woocommerce namespace
  // TODO : A SUPRIMER
  String get apiSiteUrlWithNameSpace {
    return '${dotenv.env['SITE_URL']}$_wcNameSpace';
  }

  // JWT Token Url
  String get jwtTokenEndPoint {
    return baseUrl + _wpNameSpace + _token;
  }

  //Advanced Pricing Dynamic Rules
  String get apiWpdRules {
    return '$apiSiteUrlWithNameSpace$_wdpRules';
  }

  // Product Url
  // TODO : A SUPRIMER
  // String get apiProductsUrl {
  //   return '$apiSiteUrlWithNameSpace$_products';
  // }

  //Categories Url
  //TODO : A SUPPRIMER
  // String get apiCategoriesUrl {
  //   //return '$apiSiteUrlWithNameSpace$_products$_categories?hide_empty=false&per_page=100';
  //   return '$_categories?hide_empty=false';
  // }

  //Order Url
  // TODO : A SUPPRIMER
  // String get orderUrl {
  //   return '$apiSiteUrlWithNameSpace$_orders';
  // }
  // Add to cart Url
  // TODO : A SUPPRIMER
  // String get apiAddToCartUrl {
  //   return '$apiSiteUrlWithNameSpace$addToCart';
  // }

  // Customer Url
  //TODO A SUPPRIMER
  // String apiCustomerUrl({int userId}) {
  //   return '$apiSiteUrlWithNameSpace$_customers/$userId';
  // }
  // Cart Url based on user id
  // TODO : A SUPPRIMER
  // String apiCartUrl({int userId}) {
  //   return '$apiSiteUrlWithNameSpace$_cart?user_id=$userId';
  // }

  // Payment Gateways
  //TODO A SUPPRIMER
  //String get paymentGatewaysUrl {
  //  return '$apiSiteUrlWithNameSpace$_paymentGateways';
  //}

  // Consumer Key & Consumer Secret
  //TODO A SUPPRIMER
  // String get apiConsumerKeySecret {
  //   return 'consumer_key=${dotenv.env['CONSUMER_KEY']}&consumer_secret=${dotenv.env['CONSUMER_SECRET']}';
  // }

  // Site Logo
  //TODO A SUPPRIMER
  // String get cartanaLogoSrc {
  //   return '$baseUrl$_cartanaLogoUrl';
  // }
}
