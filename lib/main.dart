import 'dart:io';

import 'package:cartanawc_app/core/app.dart';
import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  // TODO ajouter pour palier CERTIFICATE_VERIFY_FAILED
  HttpOverrides.global = MyHttpOverrides();
  await initAppModule();
  runApp(CartanaApp());
}
