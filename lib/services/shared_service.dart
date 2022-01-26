import 'dart:convert';

import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('login_details') != null) {
      return true;
    }
    return false;
  }

  static Future<LoginResponseModel> loginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_details') != null
        ? LoginResponseModel.fromJson(
            jsonDecode(prefs.getString('login_details'))
                as Map<String, dynamic>)
        : null;
  }

  static Future<void> setLoginDetails(LoginResponseModel loginResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(
      'login_details',
      loginResponse != null ? jsonEncode(loginResponse.toJson()) : null,
    );
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('login_details');
  }
}
