import 'package:cartanawc_app/core/app.dart';
import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initDIAppModule();
  runApp(CartanaApp());
}
