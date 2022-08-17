import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEndPoint {
  // WooCommerce Products endpoint
  static const String products = '/wp-json/wc/v3/products';

  // WooCommerce Categories endpoint
  static const String categories = '/wp-json/wc/v3/products/categories';

  // WooCommerce cart endpoint
  static const String cart = '/wp-json/wc/v3/cart';

  // WooCommerce addtocart endpoint
  static const String addToCart = '/wp-json/wc/v3/addtocart';

  // WooCommerce All Orders endpoint
  static const String orders = '/wp-json/wc/v3/orders';

  // WooCommerce All Payment Gateways endpoint
  static const String paymentGateways = '/wp-json/wc/v3/payment_gateways';

  // Advanced dynamic Pricing for WooCommerce endpoint
  static const String wdpRules = '/wp-json/wdp-rules/all';

  // JWT Auth endpoint
  static const String jwtAuthToken = '/wp-json/jwt-auth/v1/token';

  // WooCommerce Customer endpoint
  String customer(int userId) {
    return '/wp-json/wc/v3/customers/$userId';
  }

  // WooCommerce One Order endpoint
  String order(int orderId) {
    return '/wp-json/wc/v3/orders/$orderId';
  }

  // WooCommerce One Payment Gateway endpoint
  String paymentGateway(int paymentGatewayId) {
    return '/wp-json/wc/v3/payment_gateways/$paymentGatewayId';
  }

  static const String cartanaLogoUrl =
      '/wp-content/uploads/2021/05/cartana-logo.png';

  // Base URL
  String get baseUrl {
    return dotenv.env['SITE_URL']!;
  }
}

class APIConsumer {
  final String consumerKey = dotenv.env['CONSUMER_KEY']!;
  final String consumerSecret = dotenv.env['CONSUMER_SECRET']!;
  String get basicAuth {
    return base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
  }
}
