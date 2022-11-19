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

  // Paiement endpoint
  static const String paiements = '/wp-json/wp/v2/paiements';

  // Advanced dynamic Pricing for WooCommerce endpoint
  static const String wdpRules = '/wp-json/wdp-rules/all';

  // JWT Auth endpoint
  static const String jwtAuthToken = '/wp-json/jwt-auth/v1/token';

  // Devenir Distributeur endpoint
  static const String devenirDistributeur =
      '/wp-json/contact-form-7/v1/contact-forms/1433/feedback';

  // Reset Password endpoint
  static const String passwordReset = '/wp-json/bdpwr/v1/reset-password';

  // Set Password endpoint
  static const String passwordSet = '/wp-json/bdpwr/v1/set-password';

  // Validate code OTP for Reset Password endpoint
  static const String passwordValidateCode = '/wp-json/bdpwr/v1/validate-code';

  // Logo Url
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

class APIApplicationPassword {
  final String nameKey = dotenv.env['NAME_KEY']!;
  final String secretKey = dotenv.env['SECRET_KEY']!;
  String get basicAuth {
    return base64Encode(utf8.encode('$nameKey:$secretKey'));
  }
}
