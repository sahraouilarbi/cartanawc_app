//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '/core/app.dart';
import '/core/dependency_injection.dart';
//import 'core/http_overrides.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  //HttpOverrides.global = MyHttpOverrides();
  await initAppModule();
  runApp(CartanaApp());
}
